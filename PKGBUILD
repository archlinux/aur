# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: magodo <wztdyl@sina.com>

pkgname=aztfy
pkgver=0.6.0
pkgrel=1
pkgdesc="Bring existing Azure resources under Terraform's management"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/Azure/aztfy"
license=('MPL2')
depends=('glibc')
optdepends=('terraform')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('49c280d710db1d28defb8e6f5ff28e7b09fd41399552634170ee053b3d4e273b')

prepare() {
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
	go build -o build -ldflags="-linkmode=external -X 'main.version=$pkgver'"
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
	install -D "build/$pkgname" -t "$pkgdir/usr/bin/"
	install -Dm644 README.md SECURITY.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
