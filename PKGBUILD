# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=tern
pkgver=2.1.1
pkgrel=1
pkgdesc='A standalone migration tool for PostgreSQL'
arch=('x86_64')
url='https://github.com/jackc/tern'
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
optdepends=('postgresql: for local instance of PostgreSQL')
options=('!lto')
_commit='3b4b9b73743467e62d1214c28b8ce7d952ca14de'
source=("$pkgname::git+$url.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname"

  # create directory for build output
  mkdir build

  # download dependencies
  go mod download
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
    -ldflags "-linkmode external -extldflags ${LDFLAGS}" \
    -o build \
    .
}

package() {
  cd "$pkgname"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" build/tern

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.markdown

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
