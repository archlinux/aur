# Maintainer: Kian Kasad <kian@kasad.com>
pkgname=saka-chromium-git
pkgver=v0.17.1.r10.6a678fb
pkgrel=1
pkgdesc="A browsing assistant for Chromium-based browsers"
arch=('any')
url="https://saka.io"
license=('MIT')
makedepends=('git' 'yarn')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/lusakasa/saka")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	# Get version
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"

	yarn install
}

build() {
	cd "$srcdir/${pkgname%-git}"

	yarn run build:chrome:prod
}

check() {
	cd "$srcdir/${pkgname%-git}"

	# run tests
	yarn test
}

package() {
	cd "$srcdir/${pkgname%-git}"

	# install license
	install -Dm0644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}"

	# install extension files
	mkdir -p  "$pkgdir/usr/share/${pkgname%-git}"
	cp -aT dist "$pkgdir/usr/share/${pkgname%-git}"
}
