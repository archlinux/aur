# Maintainer: librebob <librebob at protonmail dot com>
pkgname=athenaeum-git
_pkgdomain=com.gitlab.librebob.Athenaeum
pkgver=v0.3.0.r0.668867a
pkgrel=1
pkgdesc="A libre replacement for Steam"
arch=('any')
url="https://gitlab.com/librebob/athenaeum"
license=('GPL3')
depends=('flatpak' 'python-pyqt5' 'python-peewee' 'python-dateutil' 'qt5-svg' 'qt5-quickcontrols2')
makedepends=('git' 'python-setuptools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://gitlab.com/librebob/athenaeum.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	for i in 16 32 48 64 96 128 256 512; do
		install -Dm644 "${pkgname%-git}/resources/icons/hicolor/${i}x${i}/$_pkgdomain.png" \
			"$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$_pkgdomain.png"
	done
	install -Dm644 "${pkgname%-git}/resources/$_pkgdomain.desktop" \
		"$pkgdir/usr/share/applications/$_pkgdomain.desktop"
	install -Dm644 "${pkgname%-git}/resources/$_pkgdomain.appdata.xml" \
		"$pkgdir/usr/share/appdata/$_pkgdomain.appdata.xml"
	sed -i 's%#!/usr/bin/python2%#!/usr/bin/python%g' \
		$pkgdir/usr/lib/python3.7/site-packages/athenaeum/appstream/{store.py,errors.py,utils.py,__init__.py,component.py}
}