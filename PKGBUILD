# Maintainer: Cody Schafer <aur@codyps.com>
# Maintainer: Jake <aur@ja-ke.tech>
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>

# epoch 0: up to 1.11
# epoch 1: 1.2.0
epoch=1
pkgname=dsview
pkgver=1.3.0
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
sha384sums=('2fb32b0c48275ee4c7278fda59174aa7f7873a203952eded105cb7de1f2e60387a1db7a955455ceba5c269b911fe9a66')

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
