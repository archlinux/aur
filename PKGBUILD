# Maintainer: Di Mei <di.mei@coinbase.com>
# Maintainer: Kainoa Kanter <kainoa@t1c.dev>

_pkgname=cdpcurl
pkgname="$_pkgname-git"
pkgver=r16.gc315d8d
pkgrel=1
pkgdesc='CLI for the Coinbase Developer Platform (CDP)'
url='https://github.com/coinbase/cdpcurl'
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
	install -Dv cdpcurl -t "$pkgdir/usr/bin/"
}
