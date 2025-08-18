# Maintainer: Kemel Zaidan <kemelzaidan@gmail.com>
pkgname=ugm
pkgver=1.8.0
pkgrel=1
pkgdesc="A terminal based UNIX user and group browser"
arch=('i686' 'x86_64' 'armv6h' 'aarch64')
url="https://github.com/ariasmn/ugm"
license=('MIT')
depends=('glibc')
makedepends=('go')
options=("strip" "buildflags")
source=("$url/archive/refs/tags/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('96342a6ed3bde5d547edc220405ed81cc45466013d2462cebf25e7145868b731')

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
