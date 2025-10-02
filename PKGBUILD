# Maintainer: Cody Schafer <aur@codyps.com>
# Maintainer: Jake <aur@ja-ke.tech>
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>

# epoch 0: up to 1.11
# epoch 1: 1.2.0
epoch=1
pkgname=dsview
pkgver=1.3.2
pkgrel=3
pkgdesc="Client software that supports the DreamSourceLab logic analyzer"
arch=('i686' 'x86_64')
url="http://www.dreamsourcelab.com/"
license=('GPL3')
depends=('hicolor-icon-theme' 'qt5-base' 'fftw' 'python' 'libusb')
makedepends=('cmake' 'ninja' 'boost')

source=(
  "DSView-$pkgver.tar.gz::https://github.com/DreamSourceLab/DSView/archive/v${pkgver}.tar.gz"
  "0001-strings.patch"
)
sha384sums=('afd4790c3bef0c0772971f679c6d542edf8c2d8384ae7738f5039f9015e80773bd7e12857252cf88ef4053b97be502ed'
            '5a115bdebf0a0fd2db0ef79168d2f34f9a1e564bdfd4661db90afcaf380a05efc3073b9cbff89cfaee56c6c0ea98f3db')

prepare() {
  sed -i 's#MODE="0666"#TAG+="uaccess"#' \
    "DSView-${pkgver}/DSView/DreamSourceLab.rules"

  cd "DSView-${pkgver}"
  # This patch is upstream 2018baf0e1add4f9971dd02271ee8e6773cebfac, should be removed with next release
  patch --forward --strip=1 --input=../0001-strings.patch
}

build() {
    cmake -B build -S "DSView-${pkgver}" \
        -GNinja \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
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
