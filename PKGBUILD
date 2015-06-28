# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=yubico-c-client-git
pkgver=2.14.r1.ga022697
pkgrel=1
pkgdesc='Yubico YubiKey client C library - git checkout'
arch=('i686' 'x86_64')
url='https://github.com/Yubico/yubico-c-client'
license=('BSD')
depends=('curl' 'yubico-c')
makedepends=('git' 'help2man')
provides=('ykclient' 'yubico-c-client')
conflicts=('ykclient' 'yubico-c-client')
source=('git://github.com/Yubico/yubico-c-client.git')

pkgver() {
	cd yubico-c-client/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

build() {
	cd yubico-c-client/

	autoreconf -fi
	./configure --prefix=/usr
	make
}

check() {
	cd yubico-c-client/

	make check
}

package() {
	cd yubico-c-client/

	install -D -m0644 COPYING "${pkgdir}/usr/share/licenses/yubico-c-client/COPYING"
	install -D -m0644 README "${pkgdir}/usr/share/doc/yubico-c-client/README"
	make DESTDIR="${pkgdir}/" install
}

sha256sums=('SKIP')
