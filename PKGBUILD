# Maintainer: librebob <librebob at protonmail dot com>
pkgname=athenaeum-git
_pkgdomain=com.gitlab.librebob.Athenaeum
pkgver=v0.3.0.r27.3406cef
pkgrel=1
pkgdesc="A libre replacement for Steam"
arch=('any')
url="https://gitlab.com/librebob/athenaeum"
license=('GPL3')
depends=('flatpak' 'python-pyqt5' 'python-dateutil' 'qt5-svg' 'qt5-quickcontrols2')
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
}
