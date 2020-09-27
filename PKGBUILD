# Maintainer: Paul Davis <paul@dangersalad.com>
# Contributor: Bo Davidson <a3JvemFyZXFAZ21haWwuY29tCg== | base64 -d>
pkgname=openrgb
pkgver=0.4
pkgrel=1
pkgdesc="Open source RGB lighting control that doesn't depend on manufacturer software."
arch=("x86_64")
url="https://gitlab.com/CalcProgrammer1/OpenRGB"
license=('GPL2')
depends=('qt5-base' 'libusb' 'hidapi')
makedepends=('git' 'make' 'binutils' 'pkgconf')
optdepends=('i2c-tools: Motherboard & RAM access')
conflicts=('openrgb-git')
provides=("openrgb")
source=("https://gitlab.com/CalcProgrammer1/OpenRGB/-/archive/release_$pkgver/OpenRGB-release_$pkgver.tar.gz"
        'openrgb.desktop'
        'openrgb.conf')
sha256sums=('a5743d6b0589e136b236cbfd815d7b7cb5c7331c1ca63cbd38e7b93d52c930fe'
            '2f96f6bcb381490dae7132b9533045dd46db8a0fc9f9ab5d00d952545800c6fc'
            'b5a53d747422f8b594e3e9615e238457d696732efce94050cdd72182a8645ef2')

build() {
	cd "OpenRGB-release_$pkgver"
	qmake OpenRGB.pro
	make -j$(nproc)
}

check() {
	mkdir -p $HOME/.config/OpenRGB
}

package() {
	cd "$srcdir/OpenRGB-release_$pkgver"
	install -Dm755 OpenRGB "$pkgdir"/usr/bin/openrgb
	install -Dm644 qt/OpenRGB.png "$pkgdir"/usr/share/pixmaps/openrgb.png
	install -Dm644 -t "$pkgdir"/usr/share/applications ../openrgb.desktop
	install -Dm644 -t "$pkgdir"/usr/lib/udev/rules.d 60-openrgb.rules
	install -Dm644 -t "$pkgdir"/usr/lib/modules-load.d ../openrgb.conf
}
