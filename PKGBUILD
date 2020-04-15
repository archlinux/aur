# Maintainer: Yardena Cohen <yardenack at gmail dot com>
# Co-Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=torbrowser-launcher-git
pkgver=0.3.2.r24.fc2073d
pkgrel=3
pkgdesc="Securely and easily download, verify, install and launch Tor Browser"
arch=('any')
url="https://github.com/micahflee/torbrowser-launcher"
license=('MIT')
depends=('tor' 'gnupg' 'python-gnupg' 'python-gpgme' 'python-pyqt5' 'python-pysocks'
         'python-requests')
makedepends=('git' 'python-setuptools' 'python-distro')
optdepends=('apparmor: support for apparmor profiles')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/micahflee/torbrowser-launcher.git#branch=develop'
        "444.patch")
sha256sums=('SKIP'
            'c94ecaab83ae49943d02772583dcd89e9d6ee1448d56ca8fcb621eeafbc3315b')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	patch --forward --strip=1 --input="$srcdir/444.patch"
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
