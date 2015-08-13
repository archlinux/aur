# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=yubico-pam-git
pkgver=2.19.r12.g11326d0
pkgrel=1
pkgdesc='Yubico YubiKey PAM module - git checkout'
arch=('i686' 'x86_64')
url='https://github.com/Yubico/yubico-pam'
license=('BSD')
depends=('pam' 'yubico-c-client' 'yubikey-personalization' 'json-c')
makedepends=('git' 'asciidoc')
checkdepends=('perl-net-ldap-server')
provides=('pam_yubico' 'yubico-pam')
conflicts=('pam_yubico' 'yubico-pam')
source=('git://github.com/Yubico/yubico-pam.git')

pkgver() {
	cd yubico-pam/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

build() {
	cd yubico-pam/

	autoreconf -fi
	./configure --prefix=/usr
	make
}

check() {
	cd yubico-pam/

	make check
}

package() {
	cd yubico-pam/

	install -D -m0644 COPYING "${pkgdir}/usr/share/licenses/yubico-pam/COPYING"
	install -D -m0644 README "${pkgdir}/usr/share/doc/yubico-pam/README"
	make DESTDIR="${pkgdir}/" install
}

sha256sums=('SKIP')
