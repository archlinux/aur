# Maintainer: Andrea Denisse Gómez-Martínez <aur at denisse dot dev>

pkgname=vvgo
pkgdesc='Virtual Video Game Orchestra.'
arch=(x86_64)
url='https://vvgo.org/'
_url='https://github.com/virtual-vgo/vvgo'
_branch='master'
pkgver=1.3.0
pkgrel=1
license=('MIT')
depends=(minio redis)
makedepends=(go yarn)
source=("${pkgname}-${pkgver}.tar.gz::${_url}/archive/v${pkgver}.tar.gz")
sha256sums=('0979c14d62c5ed773638ab0e8626f28a5adecd57bb72c8d02e2f05f88abb559e')
sha512sums=('63dde0d7720bca5b17e5919f18adb8e82c3d3af8ff2d582768bc3d53d5d947e503075ec3c50910a36cc4c61e731b2f8578b7305f6c0330cf15d0d87d2d3efeb1')
b2sums=('288b66e51b816980ffff1cf32f083cc3334a1e3de1615802c56502457ed28b9e3239a5bffa2c4ce6dc6afe448435ea4007d1dad24cee234ed8e9a62d7fdd32d9')
provides=($pkgname)
conflicts=($pkgname)

build() {
  cd "${pkgname}-${pkgver}"

  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  make node_modules
  make vvgo
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

info() {
  echo "Redis and Minio are runtime dependencies for the webapp."
  echo "If the webapp cannot connect to Redis and Minio at startup, it will complain and exit."
}
