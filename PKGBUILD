# Maintainer: Daniel Milde <daniel at milde dot cz>

pkgname=gdu
pkgver=4.8.0
pkgrel=1
license=('MIT')
pkgdesc="Fast disk usage analyzer"
conflicts=(gdu-git gdu-bin)
makedepends=('go')
arch=('x86_64')
url="https://github.com/Dundee/gdu"
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/dundee/gdu/archive/v${pkgver}.tar.gz")
sha256sums=('6f6bbffbce4b32c128fe35da50f59fffc3332c6b7fb11d16f06ab2a9cf167cee')

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

  make build VERSION=$pkgver
}

check() {
  cd "$pkgname-$pkgver"
  make test
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 dist/$pkgname "${pkgdir}"/usr/bin/$pkgname
  install -Dm644 gdu.1  "${pkgdir}"/usr/share/man/man1/$pkgname.1
  install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

