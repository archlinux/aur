# Maintainer: aetherherne <aetherherne@gmail.com>
# Derived from the PKGBUILD for aur/subtui-git on commit hash 857077
# Contributer (aur/subtui-git): MattiaPun <mattia@punjwani.pm>


pkgname=subtui
_pkgname=SubTUI
pkgver=2.14.0
pkgrel=1
pkgdesc="Lightweight TUI music player for Subsonic-compatible servers"
arch=('x86_64' 'aarch64')
url="https://github.com/MattiaPun/SubTUI"
license=('MIT')
depends=('mpv')
makedepends=('go')
provides=('subtui')
source=("https://github.com/MattiaPun/SubTUI/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('749c5e70b0f196570dc813c384217e7bd93343e769ad63579d036c89a6d4535ed3954d8a5d16ae4d3b585f5a6235a0cad506fb4ffc1218ad5cf09dfc96b4e1c6')

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
