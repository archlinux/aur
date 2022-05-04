# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=gosniff
pkgver=r38.17ac522
pkgrel=1
pkgdesc='A fancy-schmancy tcpdump-esque TUI, programmed in Go'
arch=('x86_64')
url='https://github.com/c-grimshaw/gosniff'
license=('MIT')
depends=('glibc' 'libpcap')
makedepends=('git' 'go')
options=('!lto')
_commit='17ac522a8bb0c0ea3545e06f864f8db476fa5f8e'
source=("$pkgname::git+$url#commit=$_commit")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$pkgname"

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
    .
}

check() {
  cd "$pkgname"

  go test -v ./...
}

package() {
  cd "$pkgname"

  install -vDm755 -t "$pkgdir/usr/bin" gosniff

  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
