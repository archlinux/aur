# Maintainer: Albert Graef <aggraef at gmail.com>
# Contributor: Bernardo Barros <bernardobarros at gmail dot com>
# Contributor: bjoern lindig (bjoern _dot_ lindig _at_ google.com)

pkgname=faust-git
pkgver=2.44.3.r12517.71d87c0ae
pkgrel=1
epoch=2
pkgdesc="A functional programming language for realtime audio signal processing."
arch=('i686' 'x86_64')
url="http://faust.grame.fr/"
license=('GPL')
depends=('llvm-libs'
# needed for sound2faust:
	 'libsndfile'
# needed for libfaustremote and faustbench:
#	 'jack2'
# needed for libHTTPDFaust:
	 'libmicrohttpd' 'openssl')
# We need xxd at build time, which is provided by 'gvim', 'vim' and
# 'xxd-standalone' (AUR).
makedepends=('llvm' 'git' 'xxd')
optdepends=('clang: needed for sound2reader'
	    'python2: needed for faust2md'
	    'ruby: needed for faust2sc and scbuilder'
            'java-environment=8: needed for faust2android')
provides=('faust' 'faust2-git')
conflicts=('faust')
# This keeps the static libraries. Remove the 'staticlibs' option if this
# isn't wanted.
options=('staticlibs')
# We're using the (default) master-dev branch of Faust here, which has all the
# latest changes. End users might want to use the master branch instead, which
# is supposedly more stable and tested, but nevertheless (mostly) up-to-date.
source=("$pkgname::git+https://github.com/grame-cncm/faust.git#branch=master-dev")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"

  # use un-annotated tags per
  # https://wiki.archlinux.org/index.php/VCS_package_guidelines#Git
  #git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'

  # ... but unfortunately many releases go untagged right now, so we rather do
  # it like this, because that gives us the real release number as running
  # `faust --version` will report it
  echo $(make debversion|sed -e s/+git.*//).r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd "$pkgname"
  git submodule update --init
}

# NOTE: libHTTPDFaust requires 'libmicrohttpd' and 'openssl'.
# Similarly, sound2faust requires libsndfile which we also include by default.
# These are all optional, so you can get rid of the extra dependencies by
# changing the build target from 'world' to 'all' and removing the
# corresponding dependencies above.

build() {
  cd "$pkgname"
  make PREFIX=/usr world
  # 'remote' and 'benchmark' are disabled right now since they require jack2.
  #make benchmark remote PREFIX=/usr
}

package() {
  cd "$pkgname"
  make install PREFIX=/usr DESTDIR="$pkgdir"

  # docs
  install -d "$pkgdir/usr/share/doc/faust"
  for x in documentation/*.{pdf,html} libraries/doc/*.{pdf,html}; do test -f $x && install -Dm644 $x "$pkgdir/usr/share/doc/faust"; done

  # examples
  install -d "$pkgdir/usr/share/faust/examples"
  cp -R "examples/"* "$pkgdir/usr/share/faust/examples/"

  ## syntax highlighting files
  cd syntax-highlighting

  # atom
  install -Dm644 "atom/language-faust/package.json" \
    "${pkgdir}/usr/lib/atom/dot-atom/packages/language-faust/package.json"
  install -Dm644 "atom/language-faust/grammars/faust.cson" \
    "${pkgdir}/usr/lib/atom/dot-atom/packages/language-faust/grammars/faust.cson"
  install -Dm644 "atom/language-faust/settings/language-faust.cson" \
    "${pkgdir}/usr/lib/atom/dot-atom/packages/language-faust/settings/language-faust.cson"
  install -t "${pkgdir}/usr/lib/atom/dot-atom/packages/language-faust/snippets/" \
    -Dm644 "atom/language-faust/snippets/"*
  install -Dm644 "atom/language-faust/process-palette.json.linux" \
	  "${pkgdir}/usr/share/doc/faust/process-palette.json"
  # kate
  install -Dm644 faust.xml "$pkgdir/usr/share/apps/katepart/syntax/faust.xml"
  # gedit
  install -Dm644 faust.lang "$pkgdir/usr/share/gtksourceview-2.0/language-specs/faust.lang"
  install -Dm644 faust.lang "$pkgdir/usr/share/gtksourceview-3.0/language-specs/faust.lang"
  # highlight
  install -Dm644 dsp.lang "$pkgdir/usr/share/highlight/langDefs/dsp.lang"
  # nano
  install -Dm644 "faust.nanorc" "$pkgdir/usr/share/nano/faust.nanorc"
  # vim
  install -Dm644 faust.vim "$pkgdir/usr/share/vim/vimfiles/syntax/faust.vim"
  # emacs
  install -d "$pkgdir/usr/share/emacs/site-lisp/"
  install -Dm644 faust-mode.el "$pkgdir/usr/share/emacs/site-lisp/"
}
