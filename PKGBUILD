# Maintainer: Amin Vakil <info AT aminvakil DOT com>

pkgname=pumba
pkgver=0.9.0
pkgrel=4
pkgdesc="Chaos testing, network emulation and stress testing tool for containers"
arch=('x86_64')
url="https://github.com/alexei-led/pumba"
license=('Apache')
makedepends=('go' 'git')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
        "https://github.com/alexei-led/pumba/commit/cd6983.patch")
sha256sums=('7faa50566898a53b0fff81973e7161874eabec45ad11f9defcd0e04310bddaff'
            'e77b9003e6d79e443aed18c9bde557215a884b40a171cbefe3eeaa11a839d7e5')

prepare() {
  patch -d "$pkgname-$pkgver" -p1 -i ../cd6983.patch
}

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
  install -Dm755 .bin/github.com/alexei-led/${pkgname}_linux_amd64 "$pkgdir"/usr/bin/$pkgname
}
