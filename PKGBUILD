#Maintainer: Dmytro Aleksandrov <alkersan@gmail.com>

pkgname=rpi-imager
pkgver=1.4
pkgrel=3
pkgdesc="Raspberry Pi Imaging Utility"
depends=('curl' 'libarchive' 'qt5-base' 'qt5-declarative' 'qt5-quickcontrols2' 'qt5-svg' 'qt5-tools')
makedepends=('gcc' 'make' 'cmake')
arch=('any')
url="https://github.com/raspberrypi/rpi-imager"
license=("Apache")

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
				"fix_find_package_arguments_order.patch")

sha256sums=('f42359fca67a61fa37f0dfd0167749b7d758263b8501c07473d416542d78e004'
            '4be37532c38419b6ac25c54ba22618c17ad26bae8fee40dc95f8a63e7381eb2e')

prepare() {
	cd "${pkgname}-${pkgver}"
  patch --forward < "${srcdir}/fix_find_package_arguments_order.patch"
}

build() {
  rm -rf build
  cmake -B build -S "${pkgname}-${pkgver}" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr'

  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
