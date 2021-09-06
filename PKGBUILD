# Maintainer: Amin Vakil <info AT aminvakil DOT com>

pkgname=pumba
pkgver=0.7.8
pkgrel=1
pkgdesc="Chaos testing, network emulation and stress testing tool for containers"
arch=('any')
url="https://github.com/alexei-led/pumba"
license=('MIT')
makedepends=('go' 'git')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('d0f9edf2a5671695de1b81af5f897b76edbbaf4fed036767d45a87bdbcf5eef1')

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  make
}

test() {
  cd "$pkgname-$pkgver"
  make test-coverage
}

package() {
  cd "$pkgname-$pkgver"
  make release
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
