# Maintainer: Kemel Zaidan <kemelzaidan at gmail dot com>
pkgname=updo
pkgver=0.4.7
pkgrel=1
pkgdesc="Uptime monitoring CLI tool with alerting and advanced settings"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/Owloops/updo"
license=('MIT')
depends=('glibc')
makedepends=('go' 'zip')
options=("strip" "buildflags")
source=("$url/archive/refs/tags/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('030b296d9f9b6c0b4a532a9a90b87e8dfde21c06dada05bd3670782b739ce69c')

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
