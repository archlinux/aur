# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=virtualsmartcard
pkgname=$_pkgname-git
pkgver=0.9.r9.gd2e607f
pkgrel=1
pkgdesc="Smart card emulator written in Python"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://frankmorgner.github.io/vsmartcard/virtualsmartcard/README.html"
license=('GPL-3.0-only')
depends=('glibc' 'pcsclite' 'python' 'python-qrcode' 'qrencode')
makedepends=('git' 'help2man')
optdepends=(
	'openpace: emulation of German identity card with –type=nPA'
	'python-pillow: emulation of electronic passport with –type=ePass'
	'python-pycryptodomex: emulation of electronic passport with –type=ePass'
	'python-pyscard: relaying a local smart card with –type=relay'
)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=('vsmartcard::git+https://github.com/frankmorgner/vsmartcard.git')
b2sums=('SKIP')

pkgver() {
	cd vsmartcard
	git describe --long --match='virtualsmartcard-*' --tags | sed 's/^virtualsmartcard-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	autoreconf -fiv vsmartcard/virtualsmartcard
}

build() {
	cd vsmartcard/virtualsmartcard
	LDFLAGS+=" -Wl,-z,undefs"
	./configure \
		--enable-serialconfdir=/etc/reader.conf.d \
		--enable-serialdropdir=/usr/lib/pcsc/drivers/serial \
		--prefix=/usr
	make
}

package() {
	# shellcheck disable=SC2154
	make -C vsmartcard/virtualsmartcard DESTDIR="$pkgdir" install
}
