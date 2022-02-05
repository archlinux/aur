# Maintainer: Thomas Gläßle <t_glaessle@gmx.de>

pkgname=tty-share
pkgver=2.2.1
pkgrel=1
pkgdesc="Shares terminal session with no setup on remote end (browser)"
arch=('any')
url="https://github.com/elisescu/tty-share"
license=('MIT')
depends=()
source=("${url}/archive/v${pkgver}.zip")
sha256sums=('009d84aef143f6f98e53506befc381bad7f8d8d06000613e0b2a2734223b17d0')
makedepends=('go')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"

  go build \
      -mod=vendor \
      -buildmode=pie \
      -trimpath \
      -ldflags "-linkmode=external -X main.version=${pkgver}" \
      -mod=readonly \
      -modcacherw \
      -o tty-share .
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/share/licenses/$pkgname"
  install -m755 tty-share "$pkgdir/usr/bin"
  install -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
