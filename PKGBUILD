# Maintainer: Nikolas Koesling <nikolas@koesling.info>

_pkgname=hid-pulsar
pkgname=hid-pulsar-dkms-git
pkgver=r3.eb0d9dd
pkgrel=1
pkgdesc="Linux HID kernel driver for Pulsar gaming mice (X2 V2, X2H, X2A, Xlite V3, Kysona M600, ATK VXE R1 SE+, VXE Dragonfly R1 Pro)"
arch=('i686' 'x86_64')
url="https://gitlab.com/NikolasK-source/hid-pulsar"
license=('GPL-2.0-or-later')
depends=('dkms')
makedepends=('git')
provides=("$_pkgname" "$_pkgname-dkms")
conflicts=("$_pkgname" "$_pkgname-dkms")
source=("git+https://gitlab.com/NikolasK-source/hid-pulsar.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	if git describe --long --tags >/dev/null 2>&1; then
		git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
	else
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	fi
}

package() {
	install -Dm644 "$srcdir/$_pkgname/dkms.conf"   "$pkgdir/usr/src/$_pkgname-$pkgver/dkms.conf"
	install -Dm644 "$srcdir/$_pkgname/Makefile"    "$pkgdir/usr/src/$_pkgname-$pkgver/Makefile"
	install -Dm644 "$srcdir/$_pkgname/hid-pulsar.c" "$pkgdir/usr/src/$_pkgname-$pkgver/hid-pulsar.c"
	install -Dm644 "$srcdir/$_pkgname/hid-ids.h"   "$pkgdir/usr/src/$_pkgname-$pkgver/hid-ids.h"
	sed -i "s/@VERSION@/$pkgver/" "$pkgdir/usr/src/$_pkgname-$pkgver/dkms.conf"
}
