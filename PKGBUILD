# Maintainer: Colin Teng <tfcolin@88.com>
pkgname=mbg
pkgver=1.5.0
pkgrel=1
pkgdesc="a game whose rules are combination of 'monoply' and 'sanguo'"
arch=('x86_64')
url="https://gitee.com/tfcolin/mbg"
license=('GPL-3.0-or-later')
depends=('gtk3')
makedepends=('go>=1.20' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tfcolin/mbg/archive/refs/tags/v${pkgver}.tar.gz")

prepare() {
  cd "$pkgname-$pkgver"
  mkdir -p build/
  export GONOPROXY="gitee.com"
  #export GOPROXY="https://goproxy.cn,direct"
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
  install -Dm755 build/mbg_gtk -t "$pkgdir"/usr/bin/
  install -Dm644 doc/manual.pdf -t "$pkgdir"/usr/share/doc/mbg/
  install -Dm644 mbg_gtk/sanguo.map -t "$pkgdir"/usr/share/mbg/rules/
}

sha256sums=('be0abd4292fd6e1c31f263d03a003b1f578b3fea8b9a0cafc7cefb003f8df858')
