# Maintainer: Kevin MacMartin <prurigro@gmail.com>

pkgname=xiny
pkgver=0.3.5
pkgrel=2
pkgdesc='A simple command line tool for converting between various units of measurement'
url='https://github.com/bcicen/XinY'
license=('MIT')
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
makedepends=('go' 'git')
source=("https://github.com/bcicen/xiny/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('d16244bbb2997170f6d00ade6d04940aa4518ab02ed326de39092711bc36c43df96c71a52426993c2be81a9802a3cb1516e53fdf1e09269f4b5946a579534f58')

build() {
  cd $pkgname-$pkgver
  go mod download

  CGO_ENABLED=0 go build -tags release \
    -ldflags "-w -X main.version=$pkgver -X main.build=$(git rev-parse --short HEAD)" \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -o $pkgname \
    ./cmd/xiny
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
