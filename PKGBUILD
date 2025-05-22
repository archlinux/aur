# Maintainer: Kemel Zaidan <kemelzaidan@gmail.com>
pkgname=updo
pkgver=0.1.7
pkgrel=1
pkgdesc="Uptime monitoring CLI tool with alerting and advanced settings"
arch=('i686' 'x86_64' 'armv6h' 'aarch64')
url="https://github.com/Owloops/updo"
license=('MIT')
depends=('glibc')
makedepends=('go')
options=("strip" "buildflags")
source=("$url/archive/refs/tags/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('8bd1432ec46e281cc3cf55c2ab855e1805df19d874708e7458890ddd6772c003')

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
