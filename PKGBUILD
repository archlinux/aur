# Maintainer: tippfehlr <tippfehlr@tippfehlr.dev>

pkgname=whosthere
pkgver=0.6.1
pkgrel=1
pkgdesc='Local Area Network discovery tool'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/ramonvermeulen/whosthere"
license=('Apache-2.0')
makedepends=('go' 'git')
source=("git+$url#tag=v$pkgver")
sha512sums=('bd110f0c9075514fd35279e769da1eda0ef4c7854d6be967cb73db15019a8b3ef62bca2d85a02fdad2e4ac95211c952f54251b0e5e9aea1bd17f9f5c1ffbdd8b')

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
