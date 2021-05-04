# Maintainer: Andrea Denisse Gómez-Martínez <aur at denisse dot dev>

pkgname=oauth2-proxy
pkgdesc='A reverse proxy that provides authentication with Google, Github or other providers.'
arch=(aarch64 armv6h x86_64)
url='https://oauth2-proxy.github.io/oauth2-proxy/'
_url='https://github.com/oauth2-proxy/oauth2-proxy'
_branch='master'
pkgver=7.1.3
pkgrel=1
license=('MIT')
makedepends=(go sed)
source=("${pkgname}-${pkgver}.tar.gz::${_url}/archive/v${pkgver}.tar.gz")
sha256sums=('b6d45f3b44a98002ce8f3b581ffd79ade33fb19f374093df43564464439257ad')
sha512sums=('43e74e0d604b000755cec12a824fa6b7d08967ee5f8eda129755217205c9cb7a944ba858b27193b0407fd2306fa076387c15942baab60ce428f26c0b5d513192')
b2sums=('95591577fa9932b17a01a279d21626c5e352761c837f9bf14f310477b02f5034f4c25cb99174e90a7e30169543d7887e9d80ec8a3b0947aee927de5c3c58acdf')
provides=($pkgname)
conflicts=($pkgname)

prepare() {
  cd "${pkgname}-${pkgver}"
  mkdir -p build
  sed -i 's|/usr/local/bin/oauth2-proxy|/usr/bin/oauth2-proxy|' "contrib/$pkgname.service.example"
}

build() {
  cd "${pkgname}-${pkgver}"

  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -o build/ .
}

check() {
  cd "${pkgname}-${pkgver}"
  go test ./...
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 "build/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "contrib/$pkgname.cfg.example" "$pkgdir/etc/oauth2-proxy.cfg"
  install -Dm644 "contrib/$pkgname.service.example" "$pkgdir/usr/lib/systemd/system/oauth2-proxy.service"
}
