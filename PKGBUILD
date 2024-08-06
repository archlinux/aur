# Maintainer: tarball <bootctl@gmail.com>

# 'viking' conflicts with extra/viking
pkgname=viking-ssh
pkgver=0.1.0
pkgrel=1
pkgdesc='Simple way to manage your remote machines and SSH keys'
url='https://github.com/d3witt/viking'
arch=(i686 x86_64 aarch64 riscv64)
license=(MIT)
makedepends=(go)
depends=(glibc)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a2b86d496f7348840f6038c1448ec7816c68bc33202ab8976ba7218ecc1c88bb')

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
  go build -o $pkgname
}

package() {
  cd "viking-$pkgver"

  install -Dm755 $pkgname \
    "$pkgdir/usr/bin/$pkgname" # conflict with extra/viking

  install -Dm644 LICENSE \
    -t "$pkgdir/usr/share/licenses/$pkgname/"

  install -Dm644 README.md \
    -t "$pkgdir/usr/share/doc/$pkgname/"
}
