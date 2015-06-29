# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Alexey Vasiliev <robbinton@gmail.com>

pkgname=freerdp-git
pkgdesc='Free RDP client - git checkout'
pkgver=1.2.0.beta1.r1514.gb7e2430
pkgrel=1
depends=('openssl' 'libxcursor' 'libcups' 'alsa-lib' 'libxext' 'libxdamage'
         'ffmpeg' 'libxkbfile' 'libxinerama' 'libxv')
makedepends=('git' 'krb5' 'cmake' 'damageproto')
arch=('i686' 'x86_64')
url="http://www.freerdp.com/"
license=('GPL')
provides=('freerdp')
conflicts=('freerdp')
source=('freerdp::git://github.com/FreeRDP/FreeRDP.git')
sha256sums=('SKIP')

pkgver() {
	cd freerdp/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

build() {
	cd freerdp/

	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-DWITH_PULSE=ON \
		-DWITH_SERVER=ON \
		.
	make
}

package() {
	cd freerdp/

	make DESTDIR="${pkgdir}/" install
}

