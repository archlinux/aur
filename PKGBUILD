# Maintainer: Kemel Zaidan <kemelzaidan@gmail.com>
pkgname=smtprelay
pkgver=1.12.0
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
sha256sums=('e86f655aad61cb316e6ab1e63c3da3f4b64bf2e2cbc9bc1c843f9c803264c6d5')

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
