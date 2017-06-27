# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=blackbird-git
pkgver=r354.b438ce5
pkgrel=1
pkgdesc="Bitcoin arbitrage with a long/short market-neutral strategy"
arch=('i686' 'x86_64')
url="https://github.com/butor/blackbird"
license=('MIT')
depends=('curl' 'jansson' 'openssl' 'sqlite')
makedepends=('curl' 'jansson' 'openssl' 'sqlite')
optdepends=('sendemail')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd ${srcdir}/blackbird
  printf "r%s.%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cd ${srcdir}/blackbird
  mkdir -p build
  cd build
  cmake .. -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "${srcdir}"/blackbird

  install -dm755 "${pkgdir}"/usr/bin/
  install -m755 build/blackbird "${pkgdir}"/usr/bin/

  install -dm755 "${pkgdir}"/etc/
  install -m755 blackbird.conf "${pkgdir}"/etc/

  install -dm755 "${pkgdir}"/usr/share/ca-certificates/trust-source/anchors/
  install -m755 curl-ca-bundle.crt "${pkgdir}"/usr/share/ca-certificates/trust-source/anchors/blackbird.crt

  sed 's#curl-ca-bundle.crt#/usr/share/ca-certificates/trust-source/anchors/blackbird.crt#' \
    -i "${pkgdir}"/etc/blackbird.conf
}
