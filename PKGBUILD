# Maintainer: Stephanie WIlde-Hobbs <git@stephanie.is>

pkgname=pathvector
pkgver=6.3.2
pkgrel=2
pkgdesc="declarative edge routing platform that automates route optimization and control plane configuration with secure and repeatable routing policy"
arch=('x86_64')
url="https://pathvector.io/"
license=('MIT')
makedepends=('go')
source=("pathvector-${pkgver}.tar.gz::https://github.com/natesales/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('44925a6d8c8a0f9bac0f813f6b9984824aee500d79443ec1bedda5a662c578aa')

prepare() {
  cd "$pkgname-$pkgver"

  sed -i "/version = \"devel\"/s/devel/${pkgver}/" main.go

  mkdir -p build/
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build ./...
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}

