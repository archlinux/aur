# Maintainer: Andrea Denisse Gómez-Martínez <aur at denisse dot dev>

pkgname=oauth2-proxy
pkgdesc='A reverse proxy that provides authentication with Google, Github or other providers.'
arch=(aarch64 armv6h x86_64)
url='https://oauth2-proxy.github.io/oauth2-proxy/'
_url='https://github.com/oauth2-proxy/oauth2-proxy'
_branch='master'
pkgver=7.2.0
pkgrel=1
license=('MIT')
makedepends=(go sed)
source=("${pkgname}-${pkgver}.tar.gz::${_url}/archive/v${pkgver}.tar.gz")
b2sums=('cb40e2be2ab335289d2785382fedb3f57cd9b1f7d67311d247e692e22a135f51cf460b534196981e9e87f31ab44500f92d5e938701f2a45971a0f20178f66dd5')
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
