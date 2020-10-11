# Maintainer: Kian Kasad <kian at kasad.com>

pkgname=sponsorblock-firefox-git
pkgver=2.0.7.r38.4dc4160
pkgrel=1
pkgdesc="SponsorBlock extension for Firefox"
arch=(any)
url="https://github.com/ajayyy/SponsorBlock"
license=('GPL')
makedepends=('git' 'npm')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	# print version string
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"

	cp config.json.example config.json

	# install build-time dependencies using npm
	npm install
}

build() {
	cd "$srcdir/${pkgname%-git}"

	# build extension
	npm run build:firefox
}

package() {
	cd "$srcdir/${pkgname%-git}"

	# create install dir
	mkdir -p "$pkgdir/usr/share/"

	# install extension files
	cp -aT dist "$pkgdir/usr/share/${pkgname%-git}"
}
