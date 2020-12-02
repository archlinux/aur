# Maintainer: Yardena Cohen <yardenack at gmail dot com>
# Co-Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=torbrowser-launcher-git
pkgver=0.3.2.r49.0e020dc
pkgrel=1
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
        'https://github.com/yardenac/torbrowser-launcher/commit/5fe206b8fcc31ca6b5df444c2bdcf00c2d81a0d0.patch'
        'https://github.com/yardenac/torbrowser-launcher/commit/f4f3ae0eb5e8a3e52ff5e2d1b9078ae2ce6680c3.patch'
        'tor-browser-developers.pub::https://sources.archlinux.org/other/community/torbrowser-launcher/tor-browser-developers-2020-12-19.asc')
sha256sums=('SKIP'
            '9bc0424ccde2cfde61ec863210a503dcbe6b19537fef8a877419628b7604e696'
            'a11323b49a1f1a2c886dafe1a0b91eeb51ec273199916d14f1ed5ea8aa6aa2d3'
            '1845e038fc7b0b1f861d9ddb29118d40c03596ec6efff82025dd47e74eb865b9')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/${pkgname%-git}"

	# fix for python >= 3.8
	patch --forward --strip=1 --input="$srcdir/5fe206b8fcc31ca6b5df444c2bdcf00c2d81a0d0.patch"

	# fix for "force english version" on non-english system
	patch --forward --strip=1 --input="$srcdir/f4f3ae0eb5e8a3e52ff5e2d1b9078ae2ce6680c3.patch"
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
