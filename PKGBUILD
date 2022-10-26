# Maintainer: drakkan <nicola.murino at gmail dot com>
# Contributor: drakkan <nicola.murino at gmail dot com>

pkgname="mingw-w64-kdsoap"
pkgver=2.1.1
pkgrel=1
pkgdesc="Qt-based client-side and server-side SOAP component (mingw-w64)"
arch=('any')
license=('GPL3' 'LGPL' 'custom')
url='https://github.com/KDAB/KDSoap'
options=('!buildflags' 'staticlibs' '!strip')
depends=('mingw-w64-qt5-base')
makedepends=('mingw-w64-cmake' 'mingw-w64-wine')

source=("https://github.com/KDAB/KDSoap/releases/download/kdsoap-${pkgver}/kdsoap-${pkgver}.tar.gz"{,.asc})
sha256sums=('aed57f6b200ddf762f5d2898f7e9228dd0700881c4491aefe4006f7fa5f5c627'
  'SKIP')

validpgpkeys=(E86C000370B1B9E2A9191AD53DBFB6882C9358FB) # KDAB Products (user for KDAB products) <info@kdab.com>

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() { 
  cd "$srcdir/kdsoap-$pkgver/"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/kdsoap-$pkgver/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    find "${pkgdir}/usr/${_arch}" -name "*.exe" -exec ${_arch}-strip --strip-all {} \;
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    if [[ $NO_EXECUTABLES ]]; then
      find "${pkgdir}/usr/${_arch}" -name '*.exe' -delete
    fi
  done
}

# vim: ts=2 sw=2 et:
