# Maintainer: w568w <w568w at outlook dot com>

_corever=0.0.1

pkgname=fvs2
pkgver=0.1.5
pkgrel=1
pkgdesc='Standalone CLI for FVS v2'
arch=('x86_64')
url='https://github.com/fvs-lab/fvs2'
license=('MIT')
makedepends=('go')
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  "core-${_corever}.tar.gz::https://github.com/fvs-lab/core/archive/refs/tags/v${_corever}.tar.gz"
)
sha256sums=(
  '30fd13ad420ef44ea58122f614a32be4c85f6a08bcb9458ea480977d506dcd9c'
  'fa9220933cf7c41747b2817504001548c63b4319ebd890737aad168136a20c0a'
)

prepare() {
  local builddir="$srcdir/$pkgname-$pkgver"

  # fvs2 depends on core, which is a separate repository. 
  # We need to symlink it into the source tree to build.
  rm -f "$srcdir/core"
  ln -s "core-${_corever}" "$srcdir/core"
  cd "$builddir"

  export GOPATH="$srcdir"
  go mod download -modcacherw
  mkdir -p build
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'

  go build -ldflags='-linkmode external' -o "build/$pkgname" "./cmd/$pkgname"
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  "./build/$pkgname" --help >/dev/null
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 "build/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
