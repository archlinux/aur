# Maintainer: Andrea Denisse Gómez-Martínez <aur at denisse dot dev>

pkgname=oauth2-proxy
pkgdesc='A reverse proxy that provides authentication with Google, Github or other providers.'
arch=(aarch64 armv6h x86_64)
url='https://oauth2-proxy.github.io/oauth2-proxy/'
_url='https://github.com/oauth2-proxy/oauth2-proxy'
_branch='master'
pkgver=7.1.2
pkgrel=1
license=('MIT')
makedepends=(go sed)
source=("${pkgname}-${pkgver}.tar.gz::${_url}/archive/v${pkgver}.tar.gz")
sha256sums=('cf2a921179a23542e74e12e1ecfd2b17e9fd7958382ab952e17f94ec0ac69f2b')
sha512sums=('58e21aac2d213c35fda0bed25b3c80116415a3dc0881e59095f1fc6e460701989728853d404234fd14a86e954465cd754fa00733c17b9dbc3447e5a975c2a78d')
b2sums=('39ac6c5036dc29304908b0805002a2d2c484a07876fb790a1bd7e0188be26ae0d1b40a3073024c34a83c57f8efbbe91a92d3c2f4e547c9ef278288654be46062')
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
