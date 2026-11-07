# Maintainer: Kainoa Kanter <kainoa@t1c.dev>

_pkgname=roast
pkgname="$_pkgname"
pkgver=1.4.0
pkgrel=2
pkgdesc='Adversarial cross-model code review'
url='https://github.com/bluesky-social/roast'
arch=('aarch64' 'i686' 'x86_64')
license=('MIT OR Apache-2.0')
depends=('glibc')
makedepends=('git' 'go')
provides=("$_pkgname")
conflicts=("$_pkgname-git" "$_pkgname-bin")
source=("${url}/archive/refs/tags/v${pkgver}.zip")
sha256sums=('eb4b4bd56a630537fbfc3120fe44334d2945127286d7a10fbae67502f43e92f0')

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
