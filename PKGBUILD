# Maintainer: Thomas Gläßle <t_glaessle@gmx.de>

pkgname=tty-proxy
pkgver=0.0.2
pkgrel=3
pkgdesc="Proxy for tty-share"
arch=('x86_64')
url="https://github.com/elisescu/tty-proxy"
license=('MIT')
depends=('glibc')
source=("${url}/archive/v${pkgver}.zip")
sha256sums=('e40d6a95e4fc2a3af35441b5017c6901453b28f540d185baa5cb8f94da2e8dd1')
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
      -o tty-proxy .
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/share/licenses/$pkgname"
  install -m755 tty-proxy "$pkgdir/usr/bin"
  install -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
