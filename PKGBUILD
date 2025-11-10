# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Maintainer: SlimGary <->
# Contributor: magodo <wztdyl@sina.com>

pkgname=aztfy
_originpkgname=aztfexport
pkgver=0.18.0
pkgrel=1
pkgdesc="Bring existing Azure resources under Terraform's management"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/Azure/aztfy"
license=('MPL2')
depends=('glibc')
optdepends=('terraform')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d1440525fe6e7b29bed97be373b26789c99b5d78cef4de3f771bed996cef30e8')

prepare() {
    mv "$_originpkgname-$pkgver" "$pkgname-$pkgver"
	cd "$pkgname-$pkgver"
	mkdir -p build
	go mod download
}

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    cd "$pkgname-$pkgver"
    go build -o build/$pkgname -ldflags="-linkmode=external -X 'main.version=$pkgver'"
}

check() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	cd "$pkgname-$pkgver"
	go test ./...
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "build/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 README.md SECURITY.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
