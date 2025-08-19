# Maintainer: Kemel Zaidan <kemelzaidan at gmail dot com>
pkgname=updo
pkgver=0.4.3
pkgrel=1
pkgdesc="Uptime monitoring CLI tool with alerting and advanced settings"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/Owloops/updo"
license=('MIT')
depends=('glibc')
makedepends=('go' 'zip')
options=("strip" "buildflags")
source=("$url/archive/refs/tags/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('2b63562fc4b57ce9a1e9f53adad583c7b98f2f8cef69766d8feb9553e3b41a72')

prepare(){
    cd "$pkgname-$pkgver"
    mkdir -p build
}

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_ENABLED=2
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    cd "$pkgname-$pkgver"
    make build-lambda
	go build -o "build/$pkgname"
}

check() {
	cd "$pkgname-$pkgver"
	go test
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "build/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm655 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
