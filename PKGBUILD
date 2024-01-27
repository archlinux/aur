# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: Jonathon Fernyhough <jonathon+m2x.dev>
# Contributor: krevedko <helllamer-gmail.com>

pkgname=seaweedfs
pkgver=3.62
pkgrel=1
pkgdesc="Simple and highly scalable distributed file system"
arch=(i686 x86_64 aarch64 armv7h)
url=https://github.com/seaweedfs/seaweedfs
license=(Apache)
depends=(glibc)
makedepends=(go)
source=($url/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('d7ace6a1c8519096abe2cbf323f23baa941936bfc4723887deac32da76fa9270')

prepare() {
  cd $pkgname-$pkgver
  export GOPATH="$srcdir/gopath"
  go mod download
}

build() {
  cd $pkgname-$pkgver

  export GOPATH="$srcdir/gopath"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"

  go build -o weed/weed \
    -buildmode=pie \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    weed/weed.go
}

# check() {
#   cd $pkgname-$pkgver/weed
#   go test -v ./...
# }

package() {
  cd $pkgname-$pkgver
  install -vDm0755 weed/weed "$pkgdir/usr/bin/weed"
  install -vDm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ts=2 sw=2 et:
