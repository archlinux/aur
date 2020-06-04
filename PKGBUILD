# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Rafael Cavalcanti <rccavalcanti at gmail dot com>
# Contributor: Jorge Barroso <jorge.barroso.11 at gmail dot com>
# Contributor: x-demon
pkgname=nicotine-plus-git
pkgver=1.4.3.2.r2502.e1f879ff
pkgrel=1
pkgdesc="A graphical client for the SoulSeek peer-to-peer system"
arch=('any')
url="https://nicotine-plus.github.io/nicotine-plus"
license=('GPL3')
depends=('gtk3' 'gobject-introspection' 'libnotify' 'python-dbus'
         'python-gobject' 'python-mutagen' 'xdg-utils')
makedepends=('git' 'python-setuptools')
optdepends=('miniupnpc: UPnP support'
            'python-miniupnpc: Python bindings for miniupnpc'
            'python-geoip: for geo-blocker'
            'python-feedparser: for Reddit plugin'
            'gspell: for spell checking in chat'
            'nuspell: for spell checking in chat'
            'libappindicator-gtk3: for tray icon'
            'gsound: for sound effects')
checkdepends=('python-pytest')
#checkdepends=('python-pytest-xvfb' 'robotframework' 'miniupnpc')
provides=("${pkgname%-git}" 'nicotine+' 'nicotine')
conflicts=("${pkgname%-git}" 'nicotine+' 'nicotine')
source=('git+https://github.com/Nicotine-Plus/nicotine-plus.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s.r%s.%s" "$(head -n 1 debian/changelog | cut -d'(' -f 2 | cut -d')' -f 1 | \
		sed 's/-/./')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py build
}

check() {
	cd "$srcdir/${pkgname%-git}"

	# Basic sanity check
	./nicotine --version | grep Nicotine+

	# Perform local in-tree unit tests
	pytest test/unit

	# Requires Nicotine+ to be installed

		# Run the GUI inside of a dummy frame buffer
#		xvfb-run robot test/integration/nicotine.robot
}

package() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
