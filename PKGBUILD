# Maintainer: Nogweii <me@nogweii.net>
pkgname=zk
pkgver=0.7.0
pkgrel=1
pkgdesc='A command-line tool helping you to maintain a Zettelkasten or personal wiki.'
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/mickael-menu/${pkgname}"
license=('GPL3')
depends=('icu')
makedepends=('go' 'git')
source=("https://github.com/mickael-menu/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c68168a99950598e2ecfc35aa75bbd9120ed958ce1c39a77c340c4e7f27f6de5')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  CGO_ENABLED=1 go build -tags "fts5 icu" -ldflags "-X=main.Version=v${pkgver}"
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  ./zk --version
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
  mkdir -p "$pkgdir"/usr/share/docs/$pkgname
  cp -r "docs" "$pkgdir"/usr/share/docs/$pkgname
}
