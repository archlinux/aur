# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Sean Enck <enckse@gmail.com>

pkgname=ccid-git
_srcname=CCID
pkgver=1.8.1.r2.ge4e49c8
pkgrel=1
pkgdesc="A generic USB Chip/Smart Card Interface Devices driver (git version)"
arch=('x86_64')
url="https://ccid.apdu.fr/"
license=('LGPL' 'GPL')
depends=('pcsclite' 'libusb' 'flex')
makedepends=('git' 'meson')
provides=("ccid")
conflicts=("ccid")
backup=('etc/reader.conf.d/libccidtwin')
source=("git+https://salsa.debian.org/rousseau/CCID.git"
        "git+https://salsa.debian.org/rousseau/PCSC.git"
        "git+https://salsa.debian.org/rousseau/PCSC-contrib.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
	cd "${_srcname}"
	git describe --long | sed "s/\([^-]*-g\)/r\1/;s/-/./g;s/^ccid\.//g"
}

prepare() {
	cd "${_srcname}"
	git submodule init
	git config submodule.PCSC.url "${srcdir}/PCSC"
	git config submodule.PCSC-contrib.url "${srcdir}/PCSC-contrib"
	git submodule update
}

build() {
	arch-meson "${_srcname}" build \
		-Dclass=true \
		-Dserial=true
	meson compile -C build
}

package() {
	meson install -C build --destdir "${pkgdir}"
	install -Dm 644 "${_srcname}/src/92_pcscd_ccid.rules" "${pkgdir}/usr/lib/udev/rules.d/92_pcscd_ccid.rules"
}
