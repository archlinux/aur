# Maintainer: Yardena Cohen <yardenack at gmail dot com>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=torbrowser-launcher-git
pkgver=0.3.2.r49.g0e020dc
pkgrel=1
pkgdesc="Securely and easily download, verify, install and launch Tor Browser"
arch=('any')
url="https://github.com/micahflee/torbrowser-launcher"
license=('MIT')
depends=('python' 'python-pyqt5' 'python-requests' 'python-pysocks' 'python-gpgme'
         'gnupg' 'tor' 'hicolor-icon-theme' 'dbus-glib')
makedepends=('git' 'python-setuptools' 'python-distro')
optdepends=('apparmor: support for apparmor profiles')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/micahflee/torbrowser-launcher.git#branch=develop'
        'https://github.com/micahflee/torbrowser-launcher/pull/470/commits/b8774d7a4f3e23f01c2c772aa9f3de7b98e8e932.patch'
        'https://sources.debian.org/data/main/t/torbrowser-launcher/0.3.3-3/debian/patches/05-Fix-use-case-that-enforce-install-of-EN-version-on-n.patch')
sha256sums=('SKIP'
            'c8b3ca9054b018ac08c1fc20b0f8cf13ce9ba328c95712c4f58b9b0e256c3af1'
            '319d287d6a3e9850e4499912761ec2ac8294e8cb0ebc543d2bc83313afd1e5ab')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/${pkgname%-git}"

	# fix for python >= 3.8
	patch --forward --strip=1 --input="${srcdir}/b8774d7a4f3e23f01c2c772aa9f3de7b98e8e932.patch"

	# fix for "force english version" on non-english system
	patch --forward --strip=1 --input="${srcdir}/05-Fix-use-case-that-enforce-install-of-EN-version-on-n.patch"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	export PYTHONHASHSEED=0
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
}
