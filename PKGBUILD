# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=guiscrcpy-git
pkgver=3.7.post96.dev.continuous.r4.g5f406f6
pkgrel=1
epoch=1
pkgdesc="Open Source GUI based Android Screen Mirroring System"
arch=('any')
url="https://guiscrcpy.github.io"
license=('GPL3')
depends=('scrcpy' 'python-pyqt5' 'python-pynput' 'python-fonttools' 'python-psutil')
makedepends=('git' 'python-setuptools')
optdepends=('python-pystray: for Notification Auditor'
            'usbaudio: AOA audio, deprecated since Android 8.0')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/srevinsaju/guiscrcpy.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf $(grep -oP "(?<=version=').*(?=')" setup.py).$(git describe \
		--long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g')
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	sed -i 's/PyQt5==5.14/PyQt5/g' setup.py
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
