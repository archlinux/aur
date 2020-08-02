# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=guiscrcpy-git
pkgver=4.0.b1.r911.g0373528
pkgrel=1
pkgdesc="Open Source GUI based Android Screen Mirroring System"
arch=('any')
url="https://guiscrcpy.github.io"
license=('GPL3')
depends=('scrcpy' 'python-pyqt5' 'python-pynput' 'python-qtpy'
         'python-psutil' 'python-cairosvg')
makedepends=('git' 'python-setuptools')
optdepends=('usbaudio: AOA audio, deprecated since Android 8.0')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/srevinsaju/guiscrcpy.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
#	git describe --long --tags --match "[0-9]*" | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
#	git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
	printf "%s.r%s.g%s" "$(grep -oP "(?<=version=').*(?=')" setup.py)" \
		"$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

	install -Dm644 "appimage/${pkgname%-git}.desktop" -t \
		"$pkgdir/usr/share/applications"
	install -Dm644 "appimage/${pkgname%-git}.png" -t \
		"$pkgdir/usr/share/pixmaps"
}
