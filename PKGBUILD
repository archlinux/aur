# Maintainer: tippfehlr <tippfehlr@tippfehlr.dev>

pkgname=shq-git
_pkgname=${pkgname%-git}
pkgver=0.2.0.r4.g11a9ba3
pkgrel=1
pkgdesc='shell queue'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://codeberg.org/tippfehlr/shq"
license=('MIT')
makedepends=('go' 'git')
provides=($_pkgname)
conflicts=($_pkgname)
source=("git+$url")
sha512sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -c 2-
}

prepare() {
	cd "$_pkgname"
	mkdir -p build
	export GOPATH="${srcdir}"
	go mod download -modcacherw
}

build() {
	cd "$_pkgname"
	export GOPATH="${srcdir}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o build
}

package() {
	cd "$_pkgname"
	install -Dm755 "build/$_pkgname" -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
