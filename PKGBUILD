# Maintainer: spsf64 <at g m a i l  dot com>
pkgname=webapp-manager
pkgver=1.1.0
pkgrel=1
pkgdesc="Run websites as if they were apps"
arch=('x86_64')
url="https://github.com/linuxmint/webapp-manager"
license=('GPL')
depends=('python-beautifulsoup4' 'python-configobj' 'python-gobject' 'python-pillow'
         'python-setproctitle' 'python-tldextract' 'dconf' 'xapp')
makedepends=('git')
provides=("${pkgname}")
conflicts=("${pkgname}-git" 'ice-ssb' 'ice-dev')


sha256sums=('2e8c30c2d96f6aaae3c655606eeb076cc070c9dfbc2124297a7b86273676b488')

source=("https://github.com/linuxmint/$pkgname/archive/$pkgver.zip")

prepare() {
	cd "$srcdir/$pkgname-$pkgver"

	# Fix browser names
	sed -i 's/brave-browser/brave/g' \
		"usr/lib/${pkgname}/common.py"
	sed -i 's/epiphany-browser/epiphany/g' \
		"usr/lib/${pkgname}/common.py"
	sed -i 's/microsoft-edge/microsoft-edge-dev/g' \
		"usr/lib/${pkgname}/common.py"

	# Fix license path
	sed -i 's;common-licenses/GPL/licenses;common/GPL/license.txt;g' \
		"usr/lib/${pkgname}/${pkgname}.py"

	# Set version in About dialog
	sed -i "s/__DEB_VERSION__/${pkgver}/g" \
		"usr/lib/${pkgname}/${pkgname}.py"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	cp -r etc usr "$pkgdir"

	# Fix launching Chrome & Vivaldi
	ln -s /usr/bin/google-chrome-stable "$pkgdir/usr/bin/google-chrome"
	ln -s /usr/bin/vivaldi-stable "$pkgdir/usr/bin/vivaldi"
}
