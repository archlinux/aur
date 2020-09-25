# Maintainer: Yardena Cohen <yardenack at gmail dot com>
# Co-Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=torbrowser-launcher-git
pkgver=0.3.2.r34.1e95880
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
        'https://github.com/micahflee/torbrowser-launcher/pull/444/commits/66781d299d9dfd812c7aca9a04de7ea37f4d57e2.patch'
        'https://github.com/micahflee/torbrowser-launcher/pull/499/commits/070a5f40af7c93d39bddfc5aa382469ce97dfd5b.patch'
        "tor-browser-developers.pub::https://sources.archlinux.org/other/community/torbrowser-launcher/tor-browser-developers-2020-12-19.asc")
sha256sums=('SKIP'
            'c94ecaab83ae49943d02772583dcd89e9d6ee1448d56ca8fcb621eeafbc3315b'
            '07dd27c56c83549a52a8ea1c1957129674bed96512bcb3cdb6cc017062139072'
            '1845e038fc7b0b1f861d9ddb29118d40c03596ec6efff82025dd47e74eb865b9')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/${pkgname%-git}"

	# fix for python >= 3.8
	patch --forward --strip=1 --input="${srcdir}/66781d299d9dfd812c7aca9a04de7ea37f4d57e2.patch"

	# fix for tor browser version 10
	patch --forward --strip=1 --input="${srcdir}/070a5f40af7c93d39bddfc5aa382469ce97dfd5b.patch"
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
