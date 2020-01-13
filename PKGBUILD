# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=guiscrcpy-git
pkgver=2.0.post27.r24.e8237a4
pkgrel=1
pkgdesc="Open Source GUI based Android Screen Mirroring System"
arch=('any')
url="https://srevinsaju.github.io/guiscrcpy"
license=('GPL3')
depends=('scrcpy' 'python-pyqt5' 'python-psutil' 'python-qdarkstyle' 'python-gitpython'
         'python-pillow' 'python-pynput')
makedepends=('git' 'python-setuptools')
optdepends=('python-pystray: for Notification Auditor'
            'usbaudio: AOA audio, deprecated since Android 8.0')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/srevinsaju/guiscrcpy.git'
        "${pkgname%-git}.desktop"
        "${pkgname%-git}.sh")
sha256sums=('SKIP'
            'a97ede5e1f363df0b3960c7cfbfdff69e8c2b2c39ef0abc522d5ff5ecb04061b'
            'd00fdf9988324d8654509c39878bd488b63834ffe95fc51b0576204d4e2d0d34')

prepare() {
	cd "$srcdir/${pkgname%-git}"

	# Remove folders that should be added to dev's .gitignore
	rm -rf .circleci .github .idea .vscode

	# Remove shortcut creation as files cannot be placed in $HOME in fakeroot environment
	sed -i '44,74d' setup.py
}

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

	install -Dm755 "$srcdir/${pkgname%-git}.sh" "$pkgdir/usr/bin/${pkgname%-git}"
	install -Dm644 "$srcdir/${pkgname%-git}.desktop" -t "$pkgdir/usr/share/applications"
	install -Dm644 "installers/linux/icons/${pkgname%-git}_logo.png" \
		"$pkgdir/usr/share/pixmaps/${pkgname%-git}.png"
}
