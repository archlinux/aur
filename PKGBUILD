# Maintainer: tippfehlr <tippfehlr@tippfehlr.eu>

pkgname=whosthere
pkgver=0.8.1
pkgrel=1
pkgdesc='Local Area Network discovery tool'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/ramonvermeulen/whosthere"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go' 'git')
source=("git+$url#tag=v$pkgver")
sha512sums=('a307de1693bfdf1bac2c6556d67b0595392a425b2670a7a00cb33a3d7e5d8029ef6b1fb6fe7a53ad6946ef56e380c48f0701ced36bf0bc22bc95d9a398b2c77b')

prepare() {
	cd $pkgname
	export GOPATH="${srcdir}"
	go mod download -modcacherw
}

build() {
	cd $pkgname
	export GOPATH="${srcdir}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o build
}

package() {
	cd $pkgname
	install -Dm755 "build" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/" 
}
