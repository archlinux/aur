# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Marco A Rojas <marco.rojas@zentek.com.mx>

pkgname=dbmate
pkgver=1.12.1
pkgrel=1
pkgdesc="A lightweight, framework-agnostic database migration tool"
arch=('x86_64')
url="https://github.com/amacneil/dbmate"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
optdepends=('postgresql: for local instance of PostgreSQL')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('2661bc995255c1ad54dacf987f8d5ed2d494aecd49bdf91be31d3c3b09a7a81cea11ca7b107cffc8593250becaa4bb96434357abf90cc551a5af8778af4790b3')
b2sums=('d80a0757663e2e166cbc78c42a0cb3a713a27d045e57b199f10cc77bef1b19319a758ba1437c8132884008110674337842bc105e29ef8eaa2f5d754db8e9c08e')

prepare() {
  cd "$pkgname-$pkgver"

  # create directory for build output
  mkdir build

  # download dependencies
  go mod download
}

build() {
  cd "$pkgname-$pkgver"

  # set Go flags
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"

  go build -v \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags ${LDFLAGS}" \
    -o build \
    .
}

package() {
  cd "$pkgname-$pkgver"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "build/$pkgname"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
