# Maintainer: Menci <huanghaorui301@gmail.com>

pkgname=magpie
pkgver=1.2.0
pkgrel=2
pkgdesc="Bidirectional NDP proxy and route maintainer to relay an IPv6 SLAAC network"
arch=(any)
url="https://github.com/Menci/magpie"
license=("MIT")
makedepends=("cmake" "libpcap")
depends=("libpcap")

prepare() {
  git clone "$url" "${srcdir}/${pkgname}" --recursive
  cd "${srcdir}/${pkgname}"
  git checkout "$(git describe --tags --abbrev=0)"
}

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --tags --abbrev=0 | cut -c2- # Remove leading "v" in version tag
}

build() {
  mkdir "${srcdir}/build-${pkgname}" && cd "${srcdir}/build-${pkgname}"

  cmake -DCMAKE_BUILD_TYPE=Release "${srcdir}/${pkgname}"
  make
}

package() {
  # Binary
  install -Dm0755 "$srcdir/build-$pkgname/src/$pkgname" "$pkgdir/usr/bin/$pkgname"

  # Service
  install -Dm0644 "$srcdir/$pkgname/examples/systemd/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"

  # Data directory
  mkdir -p "$pkgdir/var/lib/magpie"

  # License
  install -Dm0644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
