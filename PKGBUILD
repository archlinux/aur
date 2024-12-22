# Maintainer: Giovanni Scafora <scafora.giovanni@gmail.com>

pkgname=sfp-master-git
_pkgname=SFP-Master
pkgver=r89.89cd7de
pkgrel=1
pkgdesc="SFP-module programmer for CH341a devices"
arch=('x86_64')
url="https://github.com/bigbigmdm/SFP-Master"
license=('GPL-3.0-or-later')
depends=('qt5-base' 'libusb')
makedepends=('cmake' 'git')
source=("git+https://github.com/bigbigmdm/SFP-Master.git")
sha256sums=(SKIP)

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
cmake \
	-S "$srcdir/$_pkgname" \
	-B "$srcdir/build"
cmake --build "$srcdir/build"
}

package() {
	cd "$srcdir/build"
	make DESTDIR="$pkgdir" install
	mkdir -p "$pkgdir/etc/udev/rules.d"
	mv "$pkgdir"/usr/lib/udev/rules.d/70-CH341.rules "$pkgdir"/etc/udev/rules.d
	rm -rf "$pkgdir/usr/lib"
}
