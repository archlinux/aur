# Maintainer: Colin Teng <tfcolin@88.com>
pkgname=ftbt
pkgver=1.0.2
pkgrel=1
pkgdesc="A TBT game engine, with Chinese documents."
arch=('x86_64')
url="https://gitee.com/tfcolin/ftbt"
license=('MPL-2.0')
depends=('ncurses')
makedepends=('go>=1.20' 'git')
options=('strip' '!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tfcolin/ftbt/archive/refs/tags/v${pkgver}.tar.gz")

prepare() {
  cd "$pkgname-$pkgver"
  mkdir -p build/
  export GONOPROXY="gitee.com"
}

build() {
  cd "$pkgname-$pkgver"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -o build ./...
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 build/ftbt_{ai_nc,nc} -t "$pkgdir"/usr/bin/
  install -Dm644 doc/ftbt.pdf -t "$pkgdir"/usr/share/doc/ftbt/
}

sha256sums=('193de69699b579c47acc621e8447a400aded997fe1c17c1c6017d2f381fc67d1')
