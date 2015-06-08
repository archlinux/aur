
pkgname=mingw-w64-qscintilla
pkgver=2.9
pkgrel=1
pkgdesc="A port to Qt4 of Neil Hodgson's Scintilla C++ editor class (mingw-w64)"
license=('GPL')
arch=('any')
url="http://www.riverbankcomputing.co.uk/software/qscintilla/intro"
depends=('mingw-w64-crt' 'mingw-w64-qt4')
makedepends=('mingw-w64-gcc' 'mingw-w64-qt4')
options=('!buildflags' '!strip' 'staticlibs')
source=("http://downloads.sourceforge.net/pyqt/QScintilla-gpl-${pkgver}.tar.gz")
md5sums=('24659879edf9786f41a9b9268ce3c817')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"      

build() {
  unset CFLAGS CXXFLAGS LDFLAGS
  cd "$srcdir/QScintilla-gpl-${pkgver}"
  for _arch in ${_architectures}; do
    export QTDIR=/usr/${_arch}
    mkdir -p "build-${_arch}" && pushd "build-${_arch}"
    ${QTDIR}/bin/qmake ../Qt4Qt5/qscintilla.pro
    #sed -i "s|qscintilla2.dll|libqscintilla2-11.dll|g" Makefile.Release
    sed -i "s|libqscintilla2.a|libqscintilla2.dll.a|g" Makefile.Release
    make
    popd
  done
  echo "CONFIG += static" >> Qt4Qt5/qscintilla.pro
  for _arch in ${_architectures}; do
    export QTDIR=/usr/${_arch}
    mkdir -p "build-${_arch}-static" && pushd "build-${_arch}-static"
    ${QTDIR}/bin/qmake ../Qt4Qt5/qscintilla.pro
    make
    popd
  done
}


package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/QScintilla-gpl-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" INSTALL_ROOT="$pkgdir" install QMAKE=echo
    rm "$pkgdir"/usr/${_arch}/lib/*.dll
    install -d "$pkgdir"/usr/${_arch}/bin
    install -m755 release/qscintilla2.dll "$pkgdir"/usr/${_arch}/bin
    cd "$srcdir/QScintilla-gpl-${pkgver}/build-${_arch}-static"
    install -m644 release/libqscintilla2.a "$pkgdir"/usr/${_arch}/lib/
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    rm -rf "$pkgdir"/usr/${_arch}/share
  done
}
