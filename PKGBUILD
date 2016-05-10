# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=yubikey-personalization-git
pkgver=1.17.3.r20.g74d0873
pkgrel=1
pkgdesc='Yubico YubiKey Personalization library and tool - git checkout'
arch=('i686' 'x86_64')
url='https://github.com/Yubico/yubikey-personalization'
license=('BSD')
depends=('libusb' 'yubico-c-client')
makedepends=('git' 'asciidoc')
provides=('ykpers' 'yubikey-personalization')
conflicts=('ykpers' 'yubikey-personalization')
source=('git://github.com/Yubico/yubikey-personalization.git')
sha256sums=('SKIP')

pkgver() {
	cd yubikey-personalization/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

build() {
	cd yubikey-personalization/

	autoreconf -fi
	./configure --prefix=/usr --with-udevrulesdir=/usr/lib/udev/rules.d/
	make
}

check() {
	cd yubikey-personalization/

	make check
}

package() {
	cd yubikey-personalization/

	install -D -m0644 COPYING "${pkgdir}/usr/share/licenses/yubikey-personalization/COPYING"
	install -D -m0644 README "${pkgdir}/usr/share/doc/yubikey-personalization/README"
	make DESTDIR="${pkgdir}/" install
}

