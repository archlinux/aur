pkgname=mingw-w64-iistaskpanel
pkgver=0.2.2
pkgrel=1
pkgdesc="Qt widget like to Windows XP panel for common tasks of a folder (mingw-w64)"
license=('LGPL')
arch=(any)
url="https://www.linux-apps.com/content/show.php?content=79286"
depends=('mingw-w64-crt' 'mingw-w64-qt4')
makedepends=('mingw-w64-gcc')
options=('!buildflags' '!strip' 'staticlibs')
source=("iistaskpanel-${pkgver}.tar.gz::https://github.com/xantares/iistaskpanel/archive/v${pkgver}.tar.gz")
sha256sums=('047238dc70633c5b3ea732adaf52fdb4c886262b1571ea492e62e876492ebf55')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"      

build() {
  cd "$srcdir/iistaskpanel-${pkgver}"
  sed -i "s|SUBDIRS =  src \\\\|SUBDIRS = src|g" taskpanel.pro
  sed -i "s|tests|#tests|g" taskpanel.pro
  sed -i "1iCONFIG += shared" taskpanel.pro
  for _arch in ${_architectures}; do
    export QTDIR=/usr/${_arch}
    mkdir -p "build-${_arch}-static" && pushd "build-${_arch}-static"
    ${QTDIR}/bin/qmake ../taskpanel.pro
    make src/Makefile
    make
    popd
    mkdir -p "build-${_arch}" && pushd "build-${_arch}"
    sed -i "1iCONFIG += shared" ../taskpanel.pro
    ${QTDIR}/bin/qmake ../taskpanel.pro
    make src/Makefile
    sed -i "s|libiistaskpanel0.a|libiistaskpanel0.dll.a|g" src/Makefile.Release
    make
    popd
  done
}


package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/iistaskpanel-${pkgver}/build-${_arch}"
    make INSTALL_ROOT="$pkgdir" install
    install -d "$pkgdir"/usr/${_arch}/lib
    install -d "$pkgdir"/usr/${_arch}/bin
    install -d "$pkgdir"/usr/${_arch}/include/iistaskpanel
    install -m644 $srcdir/iistaskpanel-${pkgver}/src/*.h "$pkgdir"/usr/${_arch}/include/iistaskpanel
    install -m644 lib/*.a "$pkgdir"/usr/${_arch}/lib
    install -m755 lib/*.dll "$pkgdir"/usr/${_arch}/bin
    install -m644 ../build-${_arch}-static/lib/*.a "$pkgdir"/usr/${_arch}/lib
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

