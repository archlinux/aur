# Maintainer: Daniel Milde <daniel@milde.cz>

pkgname=gdu
pkgver=4.3.1
pkgrel=2
license=('MIT')
pkgdesc="Fast disk usage analyzer"
makedepends=('go')
conflicts=("gdu" "gdu-bin")
arch=('x86_64')
url="https://github.com/Dundee/gdu"
source=("https://github.com/dundee/gdu/archive/v${pkgver}.tar.gz")
sha256sums=('114c6de7ed83c5658c8438e25a3a422bc6feac90924506361f3c31cdff2d4053')

prepare(){
  cd "$pkgname-$pkgver"
  mkdir -p dist/
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -modcacherw"

  make build VERSION=$pkgver
}

check() {
  cd "$pkgname-$pkgver"
  make test
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 dist/$pkgname "${pkgdir}"/usr/bin/$pkgname
}

