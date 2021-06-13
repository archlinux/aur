# Maintainer: Mark Wagie <mark dot wagie at tutanota.com>
# Contributor: spsf64 <at g m a i l  dot com>
pkgname=webapp-manager
pkgver=1.1.3
pkgrel=1
pkgdesc="Run websites as if they were apps"
arch=('x86_64')
url="https://github.com/linuxmint/webapp-manager"
license=('GPL')
depends=('python-beautifulsoup4' 'python-configobj' 'python-gobject' 'python-pillow'
         'python-setproctitle' 'python-tldextract' 'dconf' 'xapp')
makedepends=('git')
conflicts=('ice-ssb' 'ice-dev')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('060d57cb592148094b9513f1d1adec7297dd216c74130f0b2339765e8590f93b')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"

	# Fix typo
	sed -i 's/range(4)/range(5)/g' "usr/lib/${pkgname%-git}/common.py"

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
	make buildmo
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	cp -r etc usr "$pkgdir"

	# Fix launching Chrome & Vivaldi
	ln -s /usr/bin/google-chrome-stable "$pkgdir/usr/bin/google-chrome"
	ln -s /usr/bin/vivaldi-stable "$pkgdir/usr/bin/vivaldi"
}
