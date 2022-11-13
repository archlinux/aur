# Maintainer: Robert Hamblin <hamblingreen@hotmail.com>
pkgname=pinedio-lora-driver-git
_pkgname=pinedio-lora-driver
pkgver=r3.3c1ba9d
pkgrel=2
pkgdesc="Driver and demo applications for the PineDio LoRa backplate for the Pinephone and USB adapter"
arch=('i686' 'x86_64' 'arm' 'aarch64')
url="https://codeberg.org/JF002/pinedio-lora-driver.git"
license=('LGPL3')
depends=('spi-ch341-usb-dkms')
makedepends=('git')
conflicts=('pinedio-lora-driver')
provides=('pinedio-lora-driver')
source=("$_pkgname"::"git+$url")
sha512sums=(SKIP)

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
        cd "$_pkgname"
	git submodule update --init
}

build() {
        cd "$_pkgname"
	mkdir build
	cd build

	cmake -DBUILD_FOR_PINEPHONE=1 -DBUILD_FOR_USB=1 ..
	make -j
}

package() {
        cd "$_pkgname/build"
        mkdir -p "$pkgdir/usr/bin"
        install apps/pinephone-communicator/pinephone-communicator "$pkgdir/usr/bin/pinedio-pinephone-communicator"
        install apps/usb-communicator/usb-communicator "$pkgdir/usr/bin/pinedio-usb-communicator"
}
