# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgbase=zed
pkgname=(
  'zed'
  'zq'
)
pkgver=1.14.0
pkgrel=2
pkgdesc='Tooling for super-structured data'
arch=('x86_64')
url='https://zed.brimdata.io/'
license=('BSD')
depends=('glibc')
makedepends=('git' 'go')
options=('!lto')
source=("$pkgbase::git+https://github.com/brimdata/zed#tag=v$pkgver")
sha256sums=('c48145e4239de74fe9864974122d66b3b798715dc85858dd4671f4376788df8f')

prepare() {
  cd "$pkgbase"

  # create directory for build output
  mkdir dist

  # download dependencies
  go mod download
}

build() {
  cd "$pkgbase"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"

  go build -v \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\" \
    -X github.com/brimdata/zed/cli.Version=$pkgver" \
    -o dist \
    ./cmd/{zed,zq}
}

#check() {
#  cd "$pkgbase"
#
#  go test -v ./...
#}

package_zed() {
  cd "$pkgbase"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" dist/zed

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}

package_zq() {
  cd "$pkgbase"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" dist/zq

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
