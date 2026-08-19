# Maintainer: w568w <w568w at outlook dot com>

_corever=0.1.3

pkgname=fvs2
pkgver=0.11.0
pkgrel=1
pkgdesc='Standalone CLI for FVS v2'
arch=('x86_64' 'aarch64')
url='https://github.com/fvs-lab/fvs2'
license=('MIT')
depends=('glibc')
makedepends=('go')
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  "core-${_corever}.tar.gz::https://github.com/fvs-lab/core/archive/refs/tags/v${_corever}.tar.gz"
)
sha256sums=('1dc0c1cf3343f7ef69f48f2f08bec31d4994f714f87a6c09f157be8e4144e7fa'
            '070b9961fbb5b9ab8b51be4b8fe7c7c7119c97054be82cdd55889a68b2aacd59')

prepare() {
  local builddir="$srcdir/$pkgname-$pkgver"

  # fvs2 depends on core, which is a separate repository. 
  # We need to symlink it into the source tree to build.
  rm -f "$srcdir/core"
  ln -s "core-${_corever}" "$srcdir/core"
  cd "$builddir"

  export GOMODCACHE="$srcdir/pkg/mod"
  go mod download -modcacherw
  mkdir -p build
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOMODCACHE="$srcdir/pkg/mod"
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
