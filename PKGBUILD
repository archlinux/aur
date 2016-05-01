# Maintainer: Albert Graef <aggraef at gmail.com>
# Contributor: Bernardo Barros <bernardobarros at gmail dot com>
# Contributor: bjoern lindig (bjoern _dot_ lindig _at_ google.com)

pkgname=faust
pkgver=0.9.73
pkgrel=1
pkgdesc="A functional programming language for realtime audio signal processing."
arch=('i686' 'x86_64')
url="http://faust.grame.fr/"
license=('GPL')
depends=('ruby'
# needed for sound2faust:
	 'libsndfile'
# needed for libHTTPDFaust:
	 'libmicrohttpd' 'openssl')
# We need xxd at build time, which is provided by 'gvim', 'vim' and 'xxd'
# (AUR).
makedepends=('git' 'xxd')
provides=('faust')
conflicts=('faust')
# This keeps the static libraries. Remove the 'staticlibs' option if this
# isn't wanted.
options=('strip' 'staticlibs')
source=("http://downloads.sourceforge.net/project/faudiostream/$pkgname-$pkgver.tgz"
	"debversion.patch"
	"git+https://github.com/rukano/emacs-faust-mode.git")
md5sums=('a29822139d37183dc5e952a52759e35d'
	 '234425476fd8dae5c2d20cb0fbd377b5'
         'SKIP')

# NOTE: libHTTPDFaust requires 'liblo', 'libmicrohttpd' and 'openssl'.
# Similarly, sound2faust requires libsndfile which we also include by default.
# These are all optional, so you can get rid of the extra dependencies by
# changing the build target from 'world' to 'all' and removing the
# corresponding dependencies above.

prepare() {
  cd $srcdir/$pkgname-$pkgver
  patch -p1 -i ../debversion.patch
}

build() {
  cd $srcdir/$pkgname-$pkgver
  make PREFIX=/usr world
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make install PREFIX=/usr DESTDIR="$pkgdir"

  # docs
  install -d "$pkgdir/usr/share/doc/faust"
  install -Dm644 documentation/*.{pdf,txt} "$pkgdir/usr/share/doc/faust"

  # examples
  install -d "$pkgdir/usr/share/faust/examples"
  cp -R "examples/"* "$pkgdir/usr/share/faust/examples/"

  ## syntax highlighting files
  cd syntax-highlighting

  # kate
  install -Dm644 faust.xml "$pkgdir/usr/share/apps/katepart/syntax/faust.xml"
  # gedit
  install -Dm644 faust.lang "$pkgdir/usr/share/gtksourceview-2.0/language-specs/faust.lang"
  install -Dm644 faust.lang "$pkgdir/usr/share/gtksourceview-3.0/language-specs/faust.lang"

  # highlight
  install -Dm644 dsp.lang "$pkgdir/usr/share/highlight/langDefs/dsp.lang"

  # vim
  install -Dm644 faust.vim "$pkgdir/usr/share/vim/vimfiles/syntax/faust.vim"

  # emacs
  install -d "$pkgdir/usr/share/emacs/site-lisp/"
  install -Dm644 "$srcdir/emacs-faust-mode/faust-mode.el" "$pkgdir/usr/share/emacs/site-lisp/"
}
