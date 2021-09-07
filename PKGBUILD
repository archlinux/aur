# Maintainer: Amin Vakil <info AT aminvakil DOT com>

pkgname=pumba
pkgver=0.7.8
pkgrel=3
pkgdesc="Chaos testing, network emulation and stress testing tool for containers"
arch=('x86_64')
url="https://github.com/alexei-led/pumba"
license=('Apache')
makedepends=('go' 'git')
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
        "${pkgname}-199.patch::https://patch-diff.githubusercontent.com/raw/alexei-led/pumba/pull/199.patch")
sha256sums=('d0f9edf2a5671695de1b81af5f897b76edbbaf4fed036767d45a87bdbcf5eef1'
            'd74ef45486bcc3ded4d12e49cf18f6a009b88d16b4396f90fbf8d5fa8fd220b7')

prepare() {
  patch -d "${pkgname}-${pkgver}" -p1 -i ../${pkgname}-199.patch
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
