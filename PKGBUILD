# Maintainer: Kisaragi Hiu <mail@kisaragi-hiu.com>
# Contributor: David Lumaye <david at chindit dot be>

pkgname=frankenphp
pkgver=1.13.6
pkgrel=1
pkgdesc="The modern PHP app server"
arch=('x86_64')
url="https://frankenphp.dev"
license=('MIT')
depends=('php-embed' 'watcher')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/php/frankenphp/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('bc68359ecb7781b717af1a9ee6777c65ec7bff79508ad2159b6bc4ff73c4c23a')

build() {
	# like yay's PKGBUILD
	export GOPATH="${srcdir}/gopath"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS} $(php-config --includes)"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS} $(php-config --ldflags) $(php-config --libs)"
	export GOFLAGS="-trimpath -buildmode=pie -modcacherw"

	cd "${pkgname}-${pkgver}/caddy/frankenphp/"
	go build -tags=nobadger,nomysql,nopgx,deprecated_topic,deprecated_claim
}

package() {
	cd "${pkgname}-${pkgver}/caddy/frankenphp/"
	install -Dm755 "frankenphp" "${pkgdir}/usr/bin/frankenphp"
}
