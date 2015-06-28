# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=yubico-c-git
pkgver=1.13.r2.g167cb06
pkgrel=1
pkgdesc='Yubico YubiKey C library - git checkout'
arch=('i686' 'x86_64')
url='https://github.com/Yubico/yubico-c'
license=('BSD')
depends=('curl' 'libusb')
provides=('libyubikey' 'yubico-c')
conflicts=('libyubikey' 'yubico-c')
makedepends=('git' 'asciidoc')
source=('git://github.com/Yubico/yubico-c.git')

pkgver() {
	cd yubico-c/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

build() {
	cd yubico-c/

	autoreconf -fi
	./configure --prefix=/usr
	make
}

check() {
	cd yubico-c/

	make check
}

package() {
	cd yubico-c/

	install -D -m0644 COPYING "${pkgdir}/usr/share/licenses/yubico-c/COPYING"
	install -D -m0644 README "${pkgdir}/usr/share/doc/yubico-c/README"
	make DESTDIR="${pkgdir}/" install
}

sha256sums=('SKIP')
