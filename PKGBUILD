# Maintainer: Kisaragi Hiu <mail@kisaragi-hiu.com>
# Contributor: David Lumaye <david at chindit dot be>

pkgname=frankenphp
pkgver=1.13.4
pkgrel=2
pkgdesc="The modern PHP app server"
arch=('x86_64')
url="https://frankenphp.dev"
license=('MIT')
depends=('php-embed' 'watcher')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/php/frankenphp/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('855d2e725cf4882e489cabf89f1827ff7e7991de348ed6d2e702056016751462')

build() {
	# like yay's PKGBUILD
	export GOPATH="${srcdir}/gopath"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="$(php-config --includes) ${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="$(php-config --ldflags) $(php-config --libs) ${LDFLAGS}"
	export GOFLAGS="-trimpath -buildmode=pie -modcacherw"

	cd "${pkgname}-${pkgver}/caddy/frankenphp/"
	go build -tags=nobadger,nomysql,nopgx,deprecated_topic,deprecated_claim
}

package() {
	cd "${pkgname}-${pkgver}/caddy/frankenphp/"
	install -Dm755 "frankenphp" "${pkgdir}/usr/bin/frankenphp"
}
