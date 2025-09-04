# Maintainer: Kainoa Kanter <kainoa@t1c.dev>

_pkgname=niri-screen-time
pkgname="$_pkgname-git"
pkgver=r78.ge5e223d
pkgrel=1
pkgdesc='Niri screen time tracker'
url='https://github.com/probeldev/niri-screen-time'
arch=('aarch64' 'i686' 'x86_64')
license=('custom:none')
depends=('glibc')
makedepends=('git' 'go')
provides=("$_pkgname")
source=("$_pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}" || exit
    printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$_pkgname"
	go mod download
}

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	cd "$_pkgname"
	go build
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
	install -Dv niri-screen-time -t "$pkgdir/usr/bin/"
}
