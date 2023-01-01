# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=d2
pkgver=0.1.4
pkgrel=1
pkgdesc='A modern diagram scripting language that turns text to diagrams'
arch=('x86_64')
url='https://d2lang.com'
license=('MPL2')
depends=('gcc-libs')
makedepends=('git' 'go')
options=('!lto')
_commit='a796ee51c7d5e2a23a20b190a92b4f1be1bbf175'
source=("$pkgname::git+https://github.com/terrastruct/d2#commit=$_commit")
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
    -ldflags "-linkmode external -extldflags ${LDFLAGS} \
    -X oss.terrastruct.com/d2/lib/version.Version=$pkgver" \
    -o build \
    .
}

package() {
  cd "$pkgname"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" build/d2

  # man page
  install -vDm644 -t "$pkgdir/usr/share/man/man1" ci/release/template/man/d2.1

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  cp -vr docs "$pkgdir/usr/share/doc/$pkgname"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
