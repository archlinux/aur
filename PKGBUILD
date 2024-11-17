# Maintainer: Leo <i@setuid0.dev>
pkgname=payload-dumper-go
pkgver=1.3.0
pkgrel=1
epoch=
pkgdesc="An Android OTA payload dumper written in Go."
arch=(x86_64)
url="https://github.com/ssut/payload-dumper-go"
license=(Apache-2.0)
depends=('xz')
makedepends=('go>=1.18')
options=(!buildflags)
source=("$pkgname-$pkgver.tar.gz::https://github.com/ssut/$pkgname/archive/refs/tags/$pkgver.tar.gz")
md5sums=(SKIP)

prepare() {
	export GOPATH="$srcdir"/gopath

	cd "$srcdir/$pkgname-$pkgver"
	go mod tidy
	go mod download
}

build() {
	export GOPATH="$srcdir"/gopath
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"

	cd "$srcdir/$pkgname-$pkgver"

	CGO_ENABLE=0 go build -trimpath -o ./$pkgname .
}

package() {
	install -Dt "$pkgdir/usr/bin/" -m755 "$srcdir/$pkgname-$pkgver/$pkgname"
	install -Dt "$pkgdir/usr/share/$pkgname/" -m644 "$srcdir/$pkgname-$pkgver/LICENSE"
}
