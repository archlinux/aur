# Maintainer: Ben Edwards <aur at artfuldodge dot io>

pkgname='restish'
pkgver='0.21.0'
pkgrel=1
pkgdesc='A CLI for interacting with REST-ish HTTP APIs'
arch=(x86_64)
url='https://github.com/danielgtaylor/restish'
license=(MIT)
makedepends=(go)
depends=(glibc)
source=("https://github.com/danielgtaylor/restish/archive/v${pkgver}.tar.gz")
sha256sums=('9a73e743a78d6a28e2ff0dba53499b23c945c45f78b4a0ab3aa4b6283491de5d')

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
