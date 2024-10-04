# Maintainer: Albert Graef <aggraef at gmail.com>
# Contributor: Bernardo Barros <bernardobarros at gmail dot com>
# Contributor: bjoern lindig (bjoern _dot_ lindig _at_ google.com)

_pkgname=faust
pkgname=$_pkgname-git
pkgver=2.75.10.r13654.111a29901
pkgrel=1
epoch=2
pkgdesc='A functional programming language for realtime audio signal processing (git version)'
arch=(x86_64)
url='http://faust.grame.fr/'
license=(
  GPL-2.0-or-later
  GPL-3.0-or-later
  LGPL-2.1-or-later
)
groups=(pro-audio)
depends=(
  bash
  gcc-libs
  glibc
  libmicrohttpd
  llvm-libs
)
makedepends=(
  cmake
  git
  libsndfile
  llvm
  xxd
)
optdepends=(
  'clang: for sound2reader'
  'csound: for faust2csound'
  'gradle: for faust2android'
  'graphviz: for faust2sig{,viewer}'
  'gtk2: for faust2{jack,rosgtk}'
  'inkscape: for faust2{pdf,png}'
  'jack: for faust2{api,jack{,console,internal,server,rust},jaqt,netjackqt,nodejs,ros,rosgtk,rpinetjackconsole}'
  'swig: for faust2android'
  'libsndfile: for faust2{dummy,sndfile}'
  'octave: for faust2octave'
  'pd: for faust2puredata'
  'portaudio: for faust2paqt'
  'python: for faust2atomsnippets, faust2md and faust2sc.py'
  'qt5-tools: for faust2{faustvst,jaqt,lv2}'
  'rtaudio: for faust2raqt'
  'ruby-rexml: for faust2sc and scbuilder'
  'rust: for faust2jackrust'
  'supercollider: for faust2supercollider'
  'texlive-fontutils: for faust2pdf'
)
provides=(
  faust
  faust2-git
  libfaustmachine.so
  libfaust.so
  libOSCFaust.so
  libHTTPDFaust.so
)
# This keeps the static libraries. Remove the 'staticlibs' option if this
# isn't wanted.
options=(
  !lto  # https://github.com/grame-cncm/faust/issues/1033
  staticlibs
)
conflicts=(faust)
# We're using the (default) master-dev branch of Faust here, which has all the
# latest changes. End users might want to use the master branch instead, which
# is supposedly more stable and tested, but nevertheless (mostly) up-to-date.
source=("$_pkgname::git+https://github.com/grame-cncm/faust.git#branch=master-dev")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname

  # use un-annotated tags per
  # https://wiki.archlinux.org/index.php/VCS_package_guidelines#Git
  #git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'

  # ... but unfortunately many releases go untagged right now, so we rather do
  # it like this, because that gives us the real release number as running
  # `faust --version` will report it
  echo $(make debversion|sed -e s/+git.*//).r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd $_pkgname
  git submodule update --init
}

# NOTE: libHTTPDFaust requires 'libmicrohttpd' and 'openssl'.
# Similarly, sound2faust requires libsndfile which we also include by default.
# These are all optional, so you can get rid of the extra dependencies by
# changing the build target from 'world' to 'all' and removing the
# corresponding dependencies above.

build() {
  local cmake_options=(
    -B build-$pkgname
    -C $_pkgname/build/backends/all.cmake
    -C $_pkgname/build/targets/all.cmake
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_BUILD_TYPE=None
    -D INCLUDE_DYNAMIC=ON
    -D INCLUDE_ITP=ON
    -D INCLUDE_STATIC=OFF
    -D LINK_LLVM_STATIC=OFF
    -S $_pkgname/build
    -W no-dev
  )
  # prevent static libs from being mangled with LTO
  CXXFLAGS+=' -ffat-lto-objects'

  cmake "${cmake_options[@]}"
  cmake --build build-$pkgname --verbose
  make VERBOSE=1 -C $_pkgname/tools/sound2faust
}

package() {
  DESTDIR="$pkgdir" cmake --install build-$pkgname
  cd $_pkgname
  make VERBOSE=1 PREFIX=/usr DESTDIR="$pkgdir" install -C tools/sound2faust

  # docs
  install -vDm 644 documentation/{,misc/}*.pdf -t "$pkgdir/usr/share/doc/$pkgname"

  # examples
  install -vd "$pkgdir/usr/share/$_pkgname/examples"
  cp -vR "examples/"* "$pkgdir/usr/share/$_pkgname/examples/"

  # docs
  install -d "$pkgdir/usr/share/doc/faust"
  for x in documentation/*.{pdf,html} libraries/doc/*.{pdf,html}; do
    test -f "$x" && install -Dm644 "$x" "$pkgdir/usr/share/doc/$pkgname"
  done

  # examples
  install -d "$pkgdir/usr/share/faust/examples"
  cp -R "examples/"* "$pkgdir/usr/share/faust/examples/"

  cd syntax-highlighting
  # atom
  install -vDm 644 atom/language-$_pkgname/package.json -t "$pkgdir/usr/lib/atom/dot-atom/packages/language-$_pkgname/"
  install -vDm 644 atom/language-$_pkgname/grammars/$_pkgname.cson -t "$pkgdir/usr/lib/atom/dot-atom/packages/language-$_pkgname/grammars/"
  install -vDm 644 atom/language-$_pkgname/settings/language-$_pkgname.cson -t "$pkgdir/usr/lib/atom/dot-atom/packages/language-$_pkgname/settings/"
  install -vDm 644 atom/language-$_pkgname/snippets/* -t "$pkgdir/usr/lib/atom/dot-atom/packages/language-$_pkgname/snippets/"
  install -vDm 644 atom/language-$_pkgname/process-palette.json.linux "$pkgdir/usr/share/doc/$pkgname/process-palette.json"
  # kate
  install -vDm 644 $_pkgname.xml -t "$pkgdir/usr/share/apps/katepart/syntax/"
  # gedit
  install -vDm 644 $_pkgname.lang -t "$pkgdir/usr/share/gtksourceview-2.0/language-specs/"
  install -vDm 644 $_pkgname.lang -t "$pkgdir/usr/share/gtksourceview-3.0/language-specs/"
  # highlight
  install -vDm 644 dsp.lang -t "$pkgdir/usr/share/highlight/langDefs/"
  # nano
  install -vDm 644 $_pkgname.nanorc -t "$pkgdir/usr/share/nano/"
  # vim
  install -vDm 644 $_pkgname.vim -t "$pkgdir/usr/share/vim/vimfiles/syntax/"
  # emacs
  install -vDm 644 $_pkgname-mode.el -t "$pkgdir/usr/share/emacs/site-lisp/"

  # remove unusable scripts
  rm -v "$pkgdir/usr/bin/faust2au"
  # remove precompiled shared libraries for android:
  # https://github.com/grame-cncm/faust/issues/370
  rm -rvf "$pkgdir/usr/share/$_pkgname/android/app/"{lib,oboe} "$pkgdir/usr/share/$_pkgname/smartKeyboard/android/app/oboe"
}
