# Maintainer: Cody Schafer <aur@codyps.com>
# Maintainer: Jake <aur@ja-ke.tech>
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>

# epoch 0: up to 1.11
# epoch 1: 1.2.0
epoch=1
pkgname=dsview
pkgver=1.2.2
pkgrel=1
pkgdesc="Client software that supports the DreamSourceLab logic analyzer"
arch=('i686' 'x86_64')
url="http://www.dreamsourcelab.com/"
license=('GPL3')
depends=('hicolor-icon-theme' 'qt5-base' 'fftw' 'python')
makedepends=('cmake' 'ninja' 'boost')

source=(
  "DSView-$pkgver.tar.gz::https://github.com/DreamSourceLab/DSView/archive/v${pkgver}.tar.gz"
)
sha384sums=('7fb5c8970fe88a58b94571cc36ed0916d758bd4a1e3d0d80713b3b7124fdb164607ee806c34b84bc5248e2937ec4b915')

prepare() {
  sed -i 's#MODE="0666"#TAG+="uaccess"#' \
    "DSView-${pkgver}/DSView/DreamSourceLab.rules"
}

build() {
    cmake -B build -S "DSView-${pkgver}" \
        -GNinja \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build

    ln -s "DSView" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
