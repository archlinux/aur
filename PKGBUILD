# Maintainer: Yardena Cohen <yardenack at gmail dot com>
# Co-Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=torbrowser-launcher-git
pkgver=0.3.2.r24.fc2073d
pkgrel=1
pkgdesc="Securely and easily download, verify, install, and launch Tor Browser"
arch=('any')
url="https://github.com/micahflee/torbrowser-launcher"
license=('MIT')
depends=('tor' 'gnupg' 'pygtk' 'python-gnupg' 'python-gpgme' 'python-pyqt5' 'python-twisted' 'python-distro')
makedepends=('git' 'python-setuptools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/micahflee/torbrowser-launcher.git#branch=develop'
        "${pkgname%-git}.patch")
sha256sums=('SKIP'
            '492ef44a6246e2e3d26feeeb317aa629fda9c0c229d0a64a8174f71492ead900')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	patch -p1 -i "$srcdir/${pkgname%-git}.patch"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py build
}

package() {
    cd "$srcdir/${pkgname%-git}"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
}
