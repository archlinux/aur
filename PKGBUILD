# Maintainer: tippfehlr <tippfehlr@tippfehlr.dev>

pkgname=whosthere
pkgver=0.5.1
pkgrel=1
pkgdesc='Local Area Network discovery tool'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/ramonvermeulen/whosthere"
license=('Apache-2.0')
makedepends=('go' 'git')
source=("git+$url#tag=v$pkgver")
sha512sums=('8968bba7f8d84981b7ee12d0c6e0f72c79288b3469d29fc146953519205143528dad2e3b890cca1940d32aea0e69689418594d94ff4bd5b232531688baaac3c6')

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
