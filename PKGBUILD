# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=webapp-manager-git
pkgver=1.0.7.r0.g55a37b4
pkgrel=1
pkgdesc="Run websites as if they were apps."
arch=('x86_64')
url="https://github.com/linuxmint/webapp-manager"
license=('GPL')
depends=('python-beautifulsoup4' 'python-configobj' 'python-gobject' 'python-pillow'
         'python-setproctitle' 'python-tldextract' 'dconf' 'xapp')
makedepends=('git')
optdepends=('brave' 'chromium' 'google-chrome' 'epiphany' 'vivaldi')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'ice-ssb' 'ice-dev')
source=('git+https://github.com/linuxmint/webapp-manager.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
#	printf "%s.r%s.%s" "$(head -n 1 debian/changelog | cut -d'(' -f 2 | cut -d')' -f 1 | \
#		sed 's/-/./')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"

	# Fix browser names
	sed -i 's/brave-browser/brave/g' \
		"usr/lib/${pkgname%-git}/common.py"
	sed -i 's/epiphany-browser/epiphany/g' \
		"usr/lib/${pkgname%-git}/common.py"

	# Fix license path
	sed -i 's/common-licenses\/GPL/licenses\/common\/GPL\/license.txt/g' \
		"usr/lib/${pkgname%-git}/${pkgname%-git}.py"

	# Set version in About dialog
	sed -i "s/__DEB_VERSION__/${pkgver%.r*}/g" \
		"usr/lib/${pkgname%-git}/${pkgname%-git}.py"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	cp -r etc usr "$pkgdir"

	# Fix launching Chrome & Vivaldi
	ln -s /usr/bin/google-chrome-stable "$pkgdir/usr/bin/google-chrome"
	ln -s /usr/bin/vivaldi-stable "$pkgdir/usr/bin/vivaldi"
}
