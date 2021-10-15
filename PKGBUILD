# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=tern
pkgver=1.12.5
pkgrel=1
pkgdesc="A standalone migration tool for PostgreSQL"
arch=('x86_64')
url="https://github.com/jackc/tern"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
optdepends=('postgresql: for local instance of PostgreSQL')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('3420437d81ec3ad05473ac5756ba26266afe34240485b8e672e8edcc9ea0bb3110b95de815825708e4d5ff8ca6f6bd118f44dbafca01b4d7e7a84a03ca4d84ef')
b2sums=('e4b7588745d5107349bc3d16214e816dfc27c123de18aeea1642bf1fbc90cbd63e9ecc7a4a0ca4f97529429a9a95d0ef78d926e5b0468f8e456ef290857b40de')

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
  install -vDm755 -t "$pkgdir/usr/bin" build/tern

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.markdown

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
