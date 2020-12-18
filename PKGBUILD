# Maintainer: sseneca <me at ssene dot ca>

pkgname=jellycli
pkgver=0.8.1
pkgrel=1
pkgdesc="Terminal music player for Jellyfin."
arch=('x86_64')
url='https://github.com/tryffel/jellycli'
provides=("${pkgname}=${pkgver}")
conflicts=("${pkgname}-bin" "${pkgname}-git")
license=('GPL3')
makedepends=('go' 'git')
depends=('glibc' 'alsa-lib')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tryffel/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('116d2ac3ccd5cabee931ebb9d8d0e61bb5cf1d27852bac87fb4b0bdec55efcac2d2f0fa6c05542d904a63acdb502e039827a14b89e349928c7bf6069054baff6')

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

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
