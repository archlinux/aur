# Maintainer: tarball <bootctl@gmail.com>

pkgname=neko-go
pkgver=0.1.18
pkgrel=1
pkgdesc='Animated cursor-chasing cat (Go reimplementation)'
url='https://github.com/crgimenes/neko'
arch=(i686 x86_64 aarch64 riscv64)
license=(BSD)
makedepends=(go)
depends=(glibc libx11 libglvnd)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1fbf604880f3a15d3635f48398e822e1f716112af814e61e45ef30ed9d909327')

prepare() {
  cd "$srcdir/neko-$pkgver"
  mkdir -p build
  go mod download
}

build() {
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'

  cd "$srcdir/neko-$pkgver"
  go build -o $pkgname
}

package() {
  cd "$srcdir/neko-$pkgver"

  # '-go' prevents conflicts with 'extra/neko'
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
