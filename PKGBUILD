# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Alexey Vasiliev <robbinton@gmail.com>

pkgname=freerdp-git
pkgdesc='Free RDP client - git checkout'
pkgver=2.0.0.rc2.r150.ge90184cc5
pkgrel=1
depends=('openssl' 'libxcursor' 'libcups' 'alsa-lib' 'libxext' 'libxdamage'
         'ffmpeg' 'libxkbfile' 'libxinerama' 'libxv' 'openh264')
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
		printf '%s.r%s.g%s' \
			"$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG})" \
			"$(git rev-list --count ${GITTAG}..)" \
			"$(git rev-parse --short HEAD)"
	else
		printf '0.r%s.g%s' \
			"$(git rev-list --count master)" \
			"$(git rev-parse --short HEAD)"
	fi
}

build() {
	cd freerdp/

	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-DWITH_PULSE=ON \
		-DWITH_SERVER=ON \
		-DWITH_OPENH264=ON \
		.
	make
}

package() {
	cd freerdp/

	make DESTDIR="${pkgdir}/" install
}

