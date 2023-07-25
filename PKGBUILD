# Maintainer: tarball <bootctl@gmail.com>

pkgname=psitop
pkgver=1.1.1
pkgrel=1
pkgdesc='top for /proc/pressure'
url='https://github.com/jamespwilliams/psitop'
arch=(i686 x86_64 aarch64 riscv64)
license=(MIT)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('e67e65c12f7be7a81200be81cea942e411b76a3ac6ddd9c540df8df7a6df18e7')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p build
  go mod download
}

build() {
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'

  cd "$srcdir/$pkgname-$pkgver"
  go build -o $pkgname
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # binary
  install -Dm755 $pkgname \
    "$pkgdir/usr/bin/$pkgname"

  # license
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
