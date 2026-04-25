# Maintainer: aetherherne <aetherherne@gmail.com>
# Derived from the PKGBUILD for aur/subtui-git on commit hash 857077
# Contributer (aur/subtui-git): MattiaPun <mattia@punjwani.pm>


pkgname=subtui
_pkgname=SubTUI
pkgver=2.14.1
pkgrel=1
pkgdesc="Lightweight TUI music player for Subsonic-compatible servers"
arch=('x86_64' 'aarch64')
url="https://github.com/MattiaPun/SubTUI"
license=('MIT')
depends=('mpv')
makedepends=('go')
provides=('subtui')
source=("https://github.com/MattiaPun/SubTUI/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('2a77bcd8c85ba7a5114ba9f6fbce388e4f0aa147c864fd6305e1b680546a6f27744bb2a880939b1f981ed93e9ec511270fa5abef23168fdcf228ceb54abf7b32')

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
