# Maintainer: Yardena Cohen <yardenack at gmail dot com>
# Co-Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=torbrowser-launcher-git
pkgver=0.3.2.r32.275a2b8
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
        '444.patch'
        "https://github.com/archlinux/svntogit-community/blob/packages/torbrowser-launcher/trunk/tor-browser-developers.pub")
sha256sums=('SKIP'
            'c94ecaab83ae49943d02772583dcd89e9d6ee1448d56ca8fcb621eeafbc3315b'
            '1d06596847ef46a54005cd5cc9c5246bd134cb3d42d27ac045105b6aaa9f3475')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/${pkgname%-git}"

	# fix for python >= 3.8
	patch --forward --strip=1 --input="$srcdir/444.patch"

	# replace expired signing key:
	# https://github.com/micahflee/torbrowser-launcher/pull/482
	cp "$srcdir/tor-browser-developers.pub" \
		"share/${pkgname%-git}/tor-browser-developers.asc"
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
