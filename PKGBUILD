# Maintainer: Nogweii <me@nogweii.net>
pkgname=zk
pkgver=0.8.0
pkgrel=3
pkgdesc='A command-line tool helping you to maintain a Zettelkasten or personal wiki.'
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/mickael-menu/${pkgname}"
license=('GPL3')
depends=('icu' 'sqlite')
makedepends=('go' 'git')
source=("zk-${pkgver}.tar.gz::https://github.com/mickael-menu/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b1967e93469aa6abdc49d0cbd21f603576bcf09d94c2a13a6dce78bbf2983805')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  VERSION="${pkgver}" BUILD="" make -e build
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  ./zk --version
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
  mkdir -p "$pkgdir"/usr/share/doc
  cp -r "docs" "$pkgdir"/usr/share/doc/$pkgname
}
