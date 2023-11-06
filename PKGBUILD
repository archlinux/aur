pkgname=mingw-w64-qscintilla-qt5
pkgver=2.14.1
pkgrel=1
pkgdesc="A port to Qt5 of Neil Hodgson's Scintilla C++ editor class (mingw-w64)"
license=('GPL')
arch=('any')
url="http://www.riverbankcomputing.co.uk/software/qscintilla/intro"
depends=('mingw-w64-qt5-base')
makedepends=('mingw-w64-gcc')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://www.riverbankcomputing.com/static/Downloads/QScintilla/$pkgver/QScintilla_src-$pkgver.tar.gz")
sha256sums=('dfe13c6acc9d85dfcba76ccc8061e71a223957a6c02f3c343b30a9d43a4cdd4d')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir/QScintilla_src-${pkgver}"
  for _arch in ${_architectures}; do
    export QTDIR=/usr/${_arch}/lib/qt
    mkdir -p "build-${_arch}" && pushd "build-${_arch}"
    ${QTDIR}/bin/qmake ../src
    make
    popd
  done
}


package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/QScintilla_src-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" INSTALL_ROOT="$pkgdir" install QMAKE=echo
    rm -r "$pkgdir"/usr/${_arch}/share
    rm "$pkgdir"/usr/${_arch}/lib/*.dll
    install -d "$pkgdir"/usr/${_arch}/bin
    install -m755 release/qscintilla2_qt5.dll "$pkgdir"/usr/${_arch}/bin
  done
}

