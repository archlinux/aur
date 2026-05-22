# Maintainer: aetherherne <aetherherne@gmail.com>
# Derived from the PKGBUILD for aur/subtui-git on commit hash 857077
# Contributer (aur/subtui-git): MattiaPun <mattia@punjwani.pm>


pkgname=subtui
_pkgname=SubTUI
pkgver=2.14.3
pkgrel=1
pkgdesc="Lightweight TUI music player for Subsonic-compatible servers"
arch=('x86_64' 'aarch64')
url="https://github.com/MattiaPun/SubTUI"
license=('MIT')
depends=('mpv')
makedepends=('go')
provides=('subtui')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/MattiaPun/SubTUI/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('5b42f73f438ad42327e3022fcffbbe4685c6a5414be56d5001f920fc5a8d0ccb0e9c501f66e1ae0c77ba1ea53859c55c250e9812f5be24127b5da432429ead48')

prepare() {
  cd "$srcdir/$_pkgname-${pkgver}"
  mkdir -p build
}

build() {
  cd "$srcdir/$_pkgname-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  go build \
    -ldflags "-s -w -X main.version=${pkgver}" \
    -o build/subtui .
}

package() {
  cd "$srcdir/$_pkgname-${pkgver}"

  install -Dm755 build/subtui "$pkgdir/usr/bin/subtui"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
