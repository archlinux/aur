# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="legit"
epoch=1
pkgver=0.2.2
pkgrel=1
pkgdesc="A git web frontend written in Go"
arch=("x86_64" "armv7h" "aarch64")
url="https://github.com/icyphox/legit"
license=("MIT")
depends=("git")
makedepends=("go")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
		"config-example.yaml")
b2sums=("fc3a094cbab7b9f1d705a66bcfddceea4ade9bffaaea29a6714a0729317cf172309cf1037ed0a2c8daff139553b07fc8ab8e0e3de7877e32ebafee996ace26e3"
        "2bdf55ddb91350dcb6281128c24bfb479dfa6ce66f5b2b3fd1d9df42b63572f0bcc5f8dec385fdea0732b263a064de647adc3e4752142f3b45d3abfd80fd1c7a")
options=("!strip")

prepare(){
 cd "$pkgname-$pkgver"
 mkdir -p build
}

build(){
 cd "$pkgname-$pkgver"
 export CGO_CPPFLAGS="${CPPFLAGS}"
 export CGO_CFLAGS="${CFLAGS}"
 export CGO_CXXFLAGS="${CXXFLAGS}"
 export CGO_LDFLAGS="${LDFLAGS}"
 export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
 go build -o build .
}

package(){
 cd "$pkgname-$pkgver"
 install -d "$pkgdir/usr/share/$pkgname"
 cp -r "static" "$pkgdir/usr/share/$pkgname"
 cp -r "templates" "$pkgdir/usr/share/$pkgname"
 install -D -m 755 "build/$pkgname"      "$pkgdir/usr/bin/$pkgname"
 install -D -m 644 "$srcdir/config-example.yaml" "$pkgdir/usr/share/$pkgname/config-example.yaml"
}
