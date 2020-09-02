# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=webapp-manager-git
pkgver=1.0.3.r32.b7423b8
pkgrel=1
pkgdesc="Run websites as if they were apps."
arch=('x86_64')
url="https://github.com/linuxmint/webapp-manager"
license=('GPL')
depends=('python-gobject' 'python-configobj' 'python-setproctitle'
         'python-tldextract' 'python-beautifulsoup4' 'xapp' 'dconf')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/linuxmint/webapp-manager.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s.r%s.%s" "$(head -n 1 debian/changelog | cut -d'(' -f 2 | cut -d')' -f 1 | \
		sed 's/-/./')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"

	# Fix binary shebang
	sed -i 's/#\/bin\/sh/#!\/bin\/sh/g' "usr/bin/${pkgname%-git}"

	# Fix browser names
	sed -i 's/brave-browser/brave/g' \
		"usr/lib/${pkgname%-git}/${pkgname%-git}.py"
	sed -i 's/chromium-browser/chromium/g' \
		usr/lib/"${pkgname%-git}"/{common.py,"${pkgname%-git}.py"}
	sed -i 's/epiphany-browser/epiphany/g' \
		"usr/lib/${pkgname%-git}/${pkgname%-git}.py"

	# Fix license path
	sed -i 's/common-licenses/licenses\/common/g' \
		"usr/lib/${pkgname%-git}/${pkgname%-git}.py"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	cp -r usr "$pkgdir"
}
