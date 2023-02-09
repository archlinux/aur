# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Ray Del Rosario <michael@raydelrosario.com>

pkgname=infracost
pkgver=0.10.17
pkgrel=1
pkgdesc='Cloud cost estimates for Terraform'
url='https://github.com/infracost/infracost'
arch=('x86_64')
license=('Apache')
depends=('glibc')
makedepends=('go')
# checkdepends=('git' 'terraform')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('034b8fa4ce467895190586953b5622bcff870d1bf868e55d13d1b1ffde37dce7')

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
	go build \
		-o build \
		-ldflags "-linkmode=external -X \
		'${url#https://}/internal/version.Version=v$pkgver'" \
		"./cmd/$pkgname"
}

## tests require an infracost_api key
check() {
	cd "$pkgname-$pkgver"
	"./build/$pkgname" --version
}

package() {
	cd "$pkgname-$pkgver"
	install -Dv "build/$pkgname" -t "$pkgdir/usr/bin/"
}
