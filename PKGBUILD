# Maintainer: w568w <w568w at outlook dot com>

_corever=0.1.0

pkgname=fvs2
pkgver=0.8.0
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
sha256sums=('18e8a51e6df3068c05b95e4595f194bf095d760aa37a06a205a543154ffe7b1a'
            'f9cbdc707a8c090b5c57e1ebd7283170586cf2dc910792daba01f4024496d8da')

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
