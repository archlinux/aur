# Maintainer: Luna D. Dragon <luna@lunarequest[dot]gay>
pkgname=updatecli
pkgver=0.29.0
pkgrel=1
url="https://www.updatecli.io/"
_url="https://github.com/updatecli/updatecli"
pkgdesc="a tool used to apply file update strategies"
arch=('x86_64')
license=('MIT')
makedepends=(
  'go'
  'git'
)
depends=(
  glibc
)
source=(
  "$pkgname-$pkgver.tar.gz::$_url/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('7471486490d2ac6ad3521c077eaf9dfe52535431d78c14b7a1e4aac0bb2300e1')

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build \
      -trimpath \
      -buildmode=pie \
      -mod=readonly \
      -modcacherw \
      -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
      -o build
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 build "$pkgdir"/usr/bin/$pkgname
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
