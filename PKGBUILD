# Maintainer: Kian Kasad <kian at kasad.com>

pkgname=privacy-redirect-git
pkgver=v1.1.41.r6.ed4ebad
pkgrel=1
pkgdesc="Privacy Redirect browser extension (for chromium and Firefox)"
arch=(any)
url="https://github.com/SimonBrazell/privacy-redirect"
license=('MIT')
groups=()
depends=()
makedepends=('git' 'nodejs-web-ext' 'unzip')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/SimonBrazell/privacy-redirect.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	# print version string
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"

	# build extension
	web-ext build --overwrite-dest
}

package() {
	cd "$srcdir/${pkgname%-git}"

	# create install dir
	mkdir -p "$pkgdir/usr/share/${pkgname%-git}"

	# get the short version number (e.g. 1.1.41 instead of v1.1.41.r6.ed4ebad)
	shortpkgver="$(sed 's/^v//; s/\.r.*$//;' <<< "$pkgver")"

	# unzip resulting zip file into install dir
	unzip -d "$pkgdir/usr/share/${pkgname%-git}/" "web-ext-artifacts/privacy_redirect-$shortpkgver.zip"

	# install MIT license
	install -TDm0644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
}
