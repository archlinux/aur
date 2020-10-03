# Maintainer: sseneca <me at ssene dot ca>

pkgname=jellycli
pkgver=0.6.0
pkgrel=1
pkgdesc="Terminal music player for Jellyfin."
arch=('x86_64')
url='https://github.com/tryffel/jellycli'
provides=("${pkgname}=${pkgver}")
conflicts=("${pkgname}-bin" "${pkgname}-git")
license=('Apache')
makedepends=('go' 'git')
depends=('glibc' 'alsa-lib')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tryffel/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('5a8e53b1b82982d9ffa7a91b20c01d94d856c5847ced8b60bed861c6cf98416e')

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
    -tags noupgrade,noembeddocs \
    -ldflags "-X main.version=$pkgver \
              -extldflags ${LDFLAGS}" \
    .
}

package() {
  cd "$pkgname-$pkgver"

  install -D "$pkgname" "$pkgdir/usr/bin/$pkgname"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
