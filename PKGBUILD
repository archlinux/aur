# Maintainer: Kemel Zaidan <kemelzaidan@gmail.com>
pkgname=gama-github-actions-manager
_pkgname=gama
pkgver=1.1.4
pkgrel=2
pkgdesc="Manage your GitHub Actions from Terminal with great UI"
arch=('i686' 'x86_64' 'armv6h' 'aarch64')
url="https://github.com/termkit/gama"
license=('GPL-3.0-only')
depends=('glibc')
makedepends=('go')
options=("strip" "buildflags")
source=("$url/archive/refs/tags/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('bdca58ab25c93a4b13b666d271e36142a9f4b87d7dc3264306e9c8692d252d13')

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
