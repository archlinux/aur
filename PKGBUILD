# Maintainer: tarball <bootctl@gmail.com>

# 'viking' conflicts with extra/viking
pkgname=viking-ssh
pkgver=0.2.1
pkgrel=2
pkgdesc='Simple way to manage your remote machines and SSH keys'
url='https://github.com/d3witt/viking'
arch=(i686 x86_64 aarch64 riscv64)
license=(MIT)
makedepends=(go)
depends=(glibc)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1d201609dae92055f236bc57306ec177c0ef1ad20553aab8281d4deb0ff5ae84')
binname=viking

prepare() {
  cd "viking-$pkgver"
  mkdir -p build
  go mod download
}

build() {
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'

  cd "viking-$pkgver"
  go build -o $binname
}

package() {
  cd "viking-$pkgver"

  install -Dm755 $binname \
    "$pkgdir/usr/bin/$binname" # conflict with extra/viking

  install -Dm644 LICENSE \
    -t "$pkgdir/usr/share/licenses/$binname/"

  install -Dm644 README.md \
    -t "$pkgdir/usr/share/doc/$binname/"
}
