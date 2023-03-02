# Maintainer: denisse <aur at denisse dot dev>

pkgname=oauth2-proxy
pkgdesc='A reverse proxy that provides authentication with Google, Github or other providers.'
arch=(aarch64 armv6h x86_64)
url='https://oauth2-proxy.github.io/oauth2-proxy/'
_url='https://github.com/oauth2-proxy/oauth2-proxy'
_branch='master'
pkgver=7.4.0
pkgrel=1
license=('MIT')
makedepends=(go sed)
source=("${pkgname}-${pkgver}.tar.gz::${_url}/archive/v${pkgver}.tar.gz")
b2sums=('83a5c8ee42ac55f6d9b5389da1b0ffb2132a3dae7e9c80f0fb866b52a866e557bf1f924c9bdf91fc99b63f954a939a7e876d22b7009d3e7223b016e21a439caa')
provides=($pkgname)
conflicts=($pkgname)

prepare() {
  cd "${pkgname}-${pkgver}"
  mkdir -p build
  sed -i 's|/usr/local/bin/oauth2-proxy|/usr/bin/oauth2-proxy|' "contrib/$pkgname.service.example"
}

check() {
  cd "${pkgname}-${pkgver}"
  go test ./...
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

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 "build/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "contrib/$pkgname.cfg.example" "$pkgdir/etc/oauth2-proxy.cfg"
  install -Dm644 "contrib/$pkgname.service.example" "$pkgdir/usr/lib/systemd/system/oauth2-proxy.service"
}
