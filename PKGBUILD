# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Rafael Cavalcanti <rccavalcanti at gmail dot com>
# Contributor: Jorge Barroso <jorge.barroso.11 at gmail dot com>
# Contributor: x-demon
pkgname=nicotine-plus-git
pkgver=1.4.1.r200.gc44f321e
pkgrel=1
pkgdesc="A graphical client for the SoulSeek peer-to-peer system"
arch=('any')
url="http://nicotine-plus.org"
license=('GPL3')
depends=('gtk3' 'gobject-introspection' 'gst-python' 'python-dbus'
         'python-gobject' 'python-mutagen' 'xdg-utils')
makedepends=('git' 'python-setuptools')
optdepends=('miniupnpc: UPnP support'
            'python-geoip: for geo-blocker'
            'python-feedparser: for Reddit plugin')
checkdepends=('python-pytest')
#checkdepends=('python-pytest-xvfb' 'robotframework' 'miniupnpc')
provides=("${pkgname%-git}" 'nicotine+' 'nicotine')
conflicts=("${pkgname%-git}" 'nicotine+' 'nicotine')
source=('git+https://github.com/Nicotine-Plus/nicotine-plus.git'
        'https://github.com/Nicotine-Plus/nicotine-plus/pull/159.patch')
sha256sums=('SKIP'
            '8704f91c40cde31b61a83acce7155937c8038aa785847fc78531b84bc2de2ebe')

prepare() {
	cd "$srcdir/${pkgname%-git}"
	patch -p1 -i "$srcdir/159.patch"
}

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py build
}

check() {
	cd "$srcdir/${pkgname%-git}"
#	nicotine --version | grep Nicotine+
	pytest test/unit
#	xvfb-run robot test/integration/nicotine.robot
}

package() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
