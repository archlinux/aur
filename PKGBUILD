# Maintainer: Kisaragi Hiu <mail@kisaragi-hiu.com>
# Contributor: David Lumaye <david at chindit dot be>

pkgname=frankenphp
pkgver=1.13.0
pkgrel=1
pkgdesc="The modern PHP app server"
arch=('x86_64')
url="https://frankenphp.dev"
license=('MIT')
depends=('php-embed' 'watcher')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/php/frankenphp/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6bcb8fdb414899cfb74e712c552771ec31cbe14d07ec767ce6a3aa671b54ab36')

build() {
	# like yay's PKGBUILD
	export GOPATH="${srcdir}/gopath"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="$(php-config --includes) ${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="$(php-config --ldflags) $(php-config --libs) ${LDFLAGS}"
	export GOFLAGS="-trimpath -buildmode=pie"

	cd "${pkgname}-${pkgver}/caddy/frankenphp/"
	go build -tags=nobadger,nomysql,nopgx,deprecated_topic,deprecated_claim
}

package() {
	cd "${pkgname}-${pkgver}/caddy/frankenphp/"
	install -Dm755 "frankenphp" "${pkgdir}/usr/bin/frankenphp"
}
