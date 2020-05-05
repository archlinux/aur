# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Rafael Cavalcanti <rccavalcanti at gmail dot com>
# Contributor: Jorge Barroso <jorge.barroso.11 at gmail dot com>
# Contributor: x-demon
pkgname=nicotine-plus-git
pkgver=1.4.1.r119.g52b9b6f9
pkgrel=1
pkgdesc="A graphical client for the SoulSeek peer-to-peer system"
arch=('any')
url="http://nicotine-plus.org"
license=('GPL3')
depends=('gtk3' 'cairo' 'gobject-introspection' 'python-gobject'
         'python-mutagen' 'xdg-utils')
makedepends=('git' 'python-setuptools')
optdepends=('miniupnpc: UPnP support'
            'python-geoip: for geo-blocker'
            'python-notify2: for notifications'
            'python-feedparser: for Reddit plugin')
#checkdepends=('python-pytest-xvfb' 'dogtail' 'miniupnpc')
checkdepends=('python-pytest')
provides=("${pkgname%-git}" 'nicotine+' 'nicotine')
conflicts=("${pkgname%-git}" 'nicotine+' 'nicotine')
source=('git+https://github.com/Nicotine-Plus/nicotine-plus.git')
sha512sums=('SKIP')

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
	nicotine --version | grep Nicotine+
	pytest

	# Skipping for now, dogtail package missing dependencies
	#gsettings set org.gnome.desktop.interface toolkit-accessibility true
	#xvfb-run -a python tests/integration/run_app.py
	#gsettings set org.gnome.desktop.interface toolkit-accessibility false
}

package() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

	install -dm644 "$pkgdir/usr/share/doc/nicotine/plugins"
	cp -r plugins/* "$pkgdir/usr/share/doc/nicotine/plugins"
}
