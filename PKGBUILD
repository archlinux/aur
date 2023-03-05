# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=virtualsmartcard
pkgname=$_pkgname-git
pkgver=0.8.r65.g38709f3
pkgrel=1
pkgdesc="Smart card emulator written in Python"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://frankmorgner.github.io/vsmartcard/virtualsmartcard/README.html"
license=('GPL3')
depends=(
	'pcsclite'
	'python-pillow'
	'python-pycryptodomex'
	'python-pyscard'
	'python-qrcode'
	'qrencode'
)
makedepends=('git' 'help2man')
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
