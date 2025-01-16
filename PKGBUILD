# Maintainer: Kemel Zaidan <kemelzaidan@gmail.com>
pkgname=gama-github-actions-manager
_pkgname=gama
pkgver=1.2.1
pkgrel=1
pkgdesc="Manage your GitHub Actions from Terminal with great UI"
arch=('i686' 'x86_64' 'armv6h' 'aarch64')
url="https://github.com/termkit/gama"
license=('GPL-3.0-only')
depends=('glibc')
makedepends=('go')
options=("strip" "buildflags")
source=("$url/archive/refs/tags/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('d2fad1280142b0cc8cb311a5e328590feb0c5a1642c47e3f8e0aaf1b713f6c7b')

prepare(){
    cd "$_pkgname-$pkgver"
    mkdir -p build
}

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    cd "$_pkgname-$pkgver"
	go build -o "build/$_pkgname" "./main.go"
}

check() {
	cd "$_pkgname-$pkgver"
	go test
}

package() {
	cd "$_pkgname-$pkgver"
	install -Dm755 "build/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
