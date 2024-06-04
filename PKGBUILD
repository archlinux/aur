# Maintainer: tarball <bootctl@gmail.com>

pkgname=neko-go
pkgver=0.1.32
pkgrel=1
pkgdesc='Animated cursor-chasing cat (Go reimplementation)'
url='https://github.com/crgimenes/neko'
arch=(i686 x86_64 aarch64 riscv64)
license=(BSD)
makedepends=(go)
depends=(glibc libx11 libglvnd)
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  neko-go.desktop
)
sha256sums=('1021c94a104d738b98ccbde28a76546c15fbe70fce54719071893f376d970918'
            '4f5396f95cc692cb4d4ffc3f5d227d42925c1a858edde78dadd7814411f7e034')

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
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

  cd "$srcdir/neko-$pkgver"

  # '-go' prevents conflicts with 'extra/neko'
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 assets/yawn1.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
