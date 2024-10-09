# Maintainer: Kemel Zaidan <kemelzaidan@gmail.com>
pkgname=pvw
pkgver=2.0.0
pkgrel=1
pkgdesc="A simple and intuitive TUI to monitor the ports used on a computer"
arch=('i686' 'x86_64' 'armv6h' 'aarch64')
url="https://github.com/allyring/pvw"
license=('GPL-3.0-only')
depends=('glibc')
makedepends=('go')
options=("strip" "buildflags")
source=("$url/archive/refs/tags/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('05f979d56d6a3f4bdd7182573b599aa82938058a6b1fe904c54dc0da86b4a38b')

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
}
