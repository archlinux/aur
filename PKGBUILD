# Maintainer: Ben Edwards <aur at artfuldodge dot io>

pkgname='restish'
pkgver='0.13.2'
pkgrel=1
pkgdesc='A CLI for interacting with REST-ish HTTP APIs'
arch=(x86_64)
url='https://github.com/danielgtaylor/restish'
license=(MIT)
makedepends=(go)
depends=(glibc)
source=("https://github.com/danielgtaylor/restish/archive/v${pkgver}.tar.gz")
sha256sums=('3511c2b3163034a7e705588388084ddad3c6982a688abf14ee3fabd54df74524')

prepare() {
  cd restish-$pkgver
  go mod vendor
}

build() {
  cd restish-$pkgver
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o restish
}

package() {
  cd restish-$pkgver
  install -Dm755 restish "$pkgdir/usr/bin/restish"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
