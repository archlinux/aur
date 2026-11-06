# Maintainer: Di Mei <di.mei@coinbase.com>
# Maintainer: Kainoa Kanter <kainoa@t1c.dev>

_pkgname=roast
pkgname="$_pkgname"
pkgver=1.3.0
pkgrel=1
pkgdesc='Adversarial cross-model code review'
url='https://github.com/bluesky-social/roast'
arch=('aarch64' 'i686' 'x86_64')
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
provides=("$_pkgname")
source=("${url}/archive/refs/tags/v${pkgver}.zip")
sha256sums=('66fa88a80350be359cfbef811c5d16ed1010f5d131c88756af21642dd906f23e')

prepare() {
	cd "$_pkgname-$pkgver/cmd/roast"
	go mod download
}

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	cd "$_pkgname-$pkgver"
	go build ./cmd/roast
}

check() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	cd "$_pkgname-$pkgver"
	go test ./...
}

package() {
	cd "$_pkgname-$pkgver"
	install -Dv ./roast -t "$pkgdir/usr/bin/"
}
