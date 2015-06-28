# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=yubikey-neo-manager-git
pkgver=1.3.0.r0.gffd2fac
pkgrel=1
pkgdesc="Cross platform personalization tool for the YubiKey NEO - git checkout"
arch=('i686' 'x86_64')
url="https://github.com/Yubico/yubikey-neo-manager"
license=('BSD')
depends=('yubikey-personalization' 'libykneomgr' 'libu2f-host' 'python2-pyside' 'python2-crypto' 'qtwebkit')
makedepends=('git' 'python2-setuptools' 'python2-pyside-tools' 'imagemagick')
provides=('yubikey-neo-manager')
conflicts=('yubikey-neo-manager')
install=yubikey-neo-manager.install
source=('git://github.com/Yubico/yubikey-neo-manager.git')
sha256sums=('SKIP')

pkgver() {
	cd yubikey-neo-manager/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

package() {
	cd yubikey-neo-manager/

	python2 setup.py qt_resources
	python2 setup.py install --root="${pkgdir}/" --optimize=1

	install -D -m0644 resources/neoman-large.png "${pkgdir}/usr/share/icons/hicolor/128x128/neoman.png"
	for SIZE in 16 24 32 48 64 96; do
		convert -scale ${SIZE} \
			resources/neoman-large.png \
			${srcdir}/neoman.png
		install -D -m0644 ${srcdir}/neoman.png "${pkgdir}/usr/share/icons/hicolor/${SIZE}x${SIZE}/apps/neoman.png"
	done

	install -D -m0644 resources/neoman.desktop "${pkgdir}/usr/share/applications/neoman.desktop"

	install -D -m0644 COPYING "${pkgdir}/usr/share/licenses/yubikey-neo-manager/COPYING"
	install -D -m0644 README "${pkgdir}/usr/share/doc/yubikey-neo-manager/README"
}

