# Maintainer: Kainoa Kanter <kainoa@t1c.dev>

_pkgname=roast
pkgname="$_pkgname-git"
pkgver=r4.g8af0ff0
pkgrel=1
pkgdesc='Adversarial cross-model code review'
url='https://github.com/bluesky-social/roast'
arch=('aarch64' 'i686' 'x86_64')
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-bin")
source=("$_pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}" || exit
    printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$_pkgname/cmd/roast"
	go mod download
}

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	cd "$_pkgname"
	go build ./cmd/roast
}

check() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	cd "$_pkgname"
	go test ./...
}

package() {
	cd "$_pkgname"
	install -Dv ./roast -t "$pkgdir/usr/bin/"
}
