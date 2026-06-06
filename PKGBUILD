# Maintainer: Omar Pakker <archlinux@opakker.nl>
# Contributor: Parker Reed <parker.l.reed@gmail.com>
# Contributor: dale <dale@archlinux.org>

_pkgname=pilot-link
pkgname="${_pkgname}-git"
pkgver=r1995.d996cbc1
pkgrel=1
pkgdesc="A suite of tools for connecting to PalmOS handheld devices"
url="http://www.pilot-link.org/"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
license=('GPL-2.0-or-later' 'LGPL-2.0-or-later')
depends=('readline' 'libpng' 'libusb-compat' 'popt' 'bluez-libs')
makedepends=('git')
options=('!libtool')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/desrod/pilot-link.git"
        "configure-checks.patch")
sha512sums=('SKIP'
            'e87ed44f5aa9131094d7a2be805eafaf4957bf245eb1dea758c8dde0ef3c42d1bab0dabbeedac63bd961e2e247ebc0229a5b28f2935c32a26c1cd793ce9f0cad')

pkgver() {
	cd "${srcdir}/${_pkgname}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${_pkgname}"

	for patch in "${srcdir}"/*.patch; do
		patch -p1 < "${patch}"
	done
}

build() {
	cd "${srcdir}/${_pkgname}"

	./autogen.sh \
		--prefix=/usr \
		--enable-conduits \
		--enable-libusb \
		--with-libiconv \
		--with-libpng

	make
}

package() {
	cd "${srcdir}/${_pkgname}"

	make DESTDIR="${pkgdir}" install
}
