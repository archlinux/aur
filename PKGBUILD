# Maintainer: Kemel Zaidan <kemelzaidan@gmail.com>
pkgname=smtprelay
pkgver=1.13.0
pkgrel=1
pkgdesc="Simple Golang SMTP relay/proxy server"
arch=('i686' 'x86_64' 'armv6h' 'aarch64')
url="https://github.com/decke/smtprelay"
license=('MIT')
depends=('glibc')
makedepends=('go')
# optdepends=('otf-commit-mono-nerd: icon support in the terminal')
options=("strip" "buildflags")
source=("$url/archive/refs/tags/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('f27c586ddcb0d09aa8c91aad22ce7a42a487f504095665541cc8d99e56c42266')

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

# tests not passing
check() {
	cd "$pkgname-$pkgver"
	go test
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "build/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm655 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
