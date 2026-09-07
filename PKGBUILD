# Maintainer: Jochem Kuipers <jochem@kuipers.cc>
pkgbase=uniwill-laptop
pkgname=(uniwill-laptop-dkms uniwill-control)
pkgver=1.0
pkgrel=1
pkgdesc='Uniwill / Medion ERAZER laptop extras'
arch=('x86_64')
url='https://github.com/JochemKuipers/uniwill-laptop'
license=('GPL-2.0-only')
makedepends=('cmake' 'qt6-base')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/JochemKuipers/uniwill-laptop/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7f645dcd4ea396dee27c2145796bf724e9f875645183369d456a3f028a3c09d7')

build() {
	cmake -S "$pkgbase-$pkgver/control" -B build \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package_uniwill-laptop-dkms() {
	pkgdesc='DKMS driver for Uniwill / Medion ERAZER laptops'
	depends=('dkms')
	arch=('any')
	install=uniwill-laptop-dkms.install

	cd "$pkgbase-$pkgver"
	install -d "$pkgdir/usr/src/uniwill-laptop-$pkgver"
	install -m644 Makefile dkms.conf uniwill-acpi.c uniwill-wmi.c uniwill-wmi.h \
		"$pkgdir/usr/src/uniwill-laptop-$pkgver/"
	install -Dm644 uniwill-laptop.conf \
		"$pkgdir/usr/lib/modules-load.d/uniwill-laptop.conf"
	install -Dm644 99-uniwill-laptop.rules \
		"$pkgdir/usr/lib/udev/rules.d/99-uniwill-laptop.rules"
}

package_uniwill-control() {
	pkgdesc='Qt control app for Uniwill / Medion ERAZER laptops'
	depends=('qt6-base' 'uniwill-laptop-dkms')

	DESTDIR="$pkgdir" cmake --install build
}
