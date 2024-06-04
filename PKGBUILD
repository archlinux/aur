# Maintainer: Amin Vakil <info AT aminvakil DOT com>

_pkgname=ddosify
pkgname=anteon
pkgver=2.2.0
pkgrel=1
pkgdesc="High-performance load testing tool"
arch=('any')
url="https://github.com/getanteon/anteon"
license=('AGPL3')
makedepends=('go' 'git')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::$url/archive/refs/tags/selfhosted-$pkgver.tar.gz")
sha256sums=('e41015cd960a6a081263bb5c7f3d125bc8e506c43a648dcd78cf736aebb1bda4')

prepare(){
  cd "$pkgname-selfhosted-$pkgver"
  mkdir -p build/
}

build() {
  cd "$pkgname-selfhosted-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build .
}

check() {
  cd "$pkgname-selfhosted-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-selfhosted-$pkgver"
  install -Dm755 build/$_pkgname "$pkgdir"/usr/bin/$pkgname
}
