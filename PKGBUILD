# Maintainer: Andrea Denisse Gómez-Martínez <aur at denisse dot dev>

pkgname=teleirc
pkgdesc='Go implementation of a Telegram <=> IRC bridge for use with any IRC channel and Telegram group.'
arch=(any)
url='https://github.com/RITlug/teleirc'
_branch='master'
pkgver=2.1.0
pkgrel=1
license=('GPL3')
makedepends=(go)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('37a1a70e8d9dfcd296382647aac882ee24517f1d084b05877713cff226c0c299')
sha512sums=('ef9877f39f9e5ec8acbdc37783d8e459b49f8c477606ef14d6ead27af321e7e8bb2dff5bf27b14312b1cb30ee8f77a5272026f301ea1c46519dca73d83950367')
b2sums=('1f34d181f32eebecde22830e0c988b9777014ed53f2b84ef3604cf1a5be320df36ecb652d9f7f714926594a1e6fdfd3a4e2a201410052125c8294638067a0591')
provides=($pkgname)
conflicts=($pkgname)

prepare() {
  mkdir -p "${pkgname}-${pkgver}/build"
}

build() {
  cd "${pkgname}-${pkgver}"

  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -o build/ cmd/$pkgname.go
}

check() {
  cd "${pkgname}-${pkgver}"
  go test ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
