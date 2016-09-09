# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=yubikey-neo-manager-git
pkgver=1.4.0.r3.gcd0de3a
pkgrel=2
pkgdesc="Cross platform personalization tool for the YubiKey NEO - git checkout"
arch=('i686' 'x86_64')
url="https://github.com/Yubico/yubikey-neo-manager"
license=('BSD')
depends=('yubikey-personalization' 'libykneomgr' 'libu2f-host'
	'python2-setuptools' 'python2-pyside' 'python2-crypto' 'qtwebkit')
makedepends=('git' 'python2-pyside-tools' 'imagemagick')
provides=('yubikey-neo-manager')
conflicts=('yubikey-neo-manager')
source=('git://github.com/Yubico/yubikey-neo-manager.git'
	'git://github.com/Yubico/python-yubicommon.git')
sha256sums=('SKIP' 'SKIP')

pkgver() {
	cd yubikey-neo-manager/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		printf '%s.r%s.g%s' \
			"$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG})" \
			"$(git rev-list --count ${GITTAG}..)" \
			"$(git log -1 --format='%h')"
	else
		printf '0.r%s.g%s' \
			"$(git rev-list --count master)" \
			"$(git log -1 --format='%h')"
	fi
}

prepare() {
	cd yubikey-neo-manager/

	git config --file=.gitmodules submodule.vendor/yubicommon.url ../python-yubicommon/
	git submodule init
	git submodule update
}

package() {
	cd yubikey-neo-manager/

	python2 setup.py qt_resources
	python2 setup.py install --root="${pkgdir}/" --optimize=1

	install -D -m0644 resources/yubikey-neo-manager.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/neoman.png"
	for SIZE in 16 24 32 48 64 96; do
		convert -scale ${SIZE} \
			resources/yubikey-neo-manager.png \
			${srcdir}/neoman.png
		install -D -m0644 ${srcdir}/neoman.png "${pkgdir}/usr/share/icons/hicolor/${SIZE}x${SIZE}/apps/neoman.png"
	done

	install -D -m0644 resources/neoman.desktop "${pkgdir}/usr/share/applications/neoman.desktop"

	install -D -m0644 COPYING "${pkgdir}/usr/share/licenses/yubikey-neo-manager/COPYING"
	install -D -m0644 README "${pkgdir}/usr/share/doc/yubikey-neo-manager/README"
}

