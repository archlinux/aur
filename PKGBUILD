# Maintainer: aetherherne <aetherherne@gmail.com>
# Derived from the PKGBUILD for aur/subtui-git on commit hash 857077
# Contributer (aur/subtui-git): MattiaPun <mattia@punjwani.pm>


pkgname=subtui
_pkgname=SubTUI
pkgver=2.14.2
pkgrel=1
pkgdesc="Lightweight TUI music player for Subsonic-compatible servers"
arch=('x86_64' 'aarch64')
url="https://github.com/MattiaPun/SubTUI"
license=('MIT')
depends=('mpv')
makedepends=('go')
provides=('subtui')
source=("https://github.com/MattiaPun/SubTUI/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('86a32a76a4f57bb985a4598c6734367a4f664bc014af2c275a0206e9e770c05d0a0493fd33afc4d919fdcf168303505333b0fe58685dba910a7bb052b1fef69f')

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
