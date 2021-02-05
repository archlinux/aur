# Maintainer: Daniel Milde <daniel@milde.cz>

pkgname=gdu
pkgver=4.4.1
pkgrel=1
license=('MIT')
pkgdesc="Fast disk usage analyzer"
makedepends=('go')
conflicts=("gdu" "gdu-bin")
arch=('x86_64')
url="https://github.com/Dundee/gdu"
source=("https://github.com/dundee/gdu/archive/v${pkgver}.tar.gz")
sha256sums=('4008e2df3adfca5c77302c334f4bd7f4f3825c22d1547c7374d65c371041e94b')

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

