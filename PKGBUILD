# Maintainer: sseneca <me at ssene dot ca>

pkgname=jellycli
pkgver=0.9.0
pkgrel=1
pkgdesc="Terminal music player for Jellyfin."
arch=('x86_64')
url='https://github.com/tryffel/jellycli'
conflicts=("${pkgname}-bin" "${pkgname}-git")
license=('GPL3')
makedepends=('go' 'git')
depends=('glibc' 'alsa-lib')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('6e8e68a8d1198c9cece384306191a313d82a1fe49fb888d0183f75cfdfe36bc31f2efd309fc7abe60bbfbaf5f91c7b7c04132e14c33b04c5c209e94ef7f99e52')

build() {
  cd "$pkgname-$pkgver"

  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"

  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    .
}

package() {
  cd "$pkgname-$pkgver"
  install -D "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
