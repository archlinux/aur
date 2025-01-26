# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgname=ksuid
pkgver=d337249
epoch=1
pkgrel=1
pkgdesc="K-Sortable Globally Unique IDs"
arch=('x86_64')
url="https://github.com/segmentio/ksuid"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
source=('git+https://github.com/segmentio/ksuid.git')
sha512sums=('SKIP')
pkgver() {
  cd $pkgname
  git describe --always | sed 's|-|.|g'
}

prepare() {
  cd "$pkgname"

  # create directory for build output
  mkdir build
}

build() {
  cd "$pkgname"

  # set Go flags
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"

  go build -v \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    -o build \
    ./cmd/...
}

package() {
  cd "$pkgname"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "build/$pkgname"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}
