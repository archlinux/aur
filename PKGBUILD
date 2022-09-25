# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=gokart
pkgver=0.5.1
pkgrel=1
pkgdesc='Static analysis tool for securing Go code'
arch=('x86_64')
url='https://github.com/praetorian-inc/gokart'
license=('Apache')
depends=('glibc')
makedepends=('git' 'go')
options=('!lto')
_commit='3d38a9ae72f7d67d5c13f83ec5669630868e409e'
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
  go mod vendor
}

build() {
  cd "$pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"

  go build -v \
    -trimpath \
    -buildmode=pie \
    -mod=vendor \
    -modcacherw \
    -ldflags "-linkmode external -extldflags ${LDFLAGS}" \
    -o build .
}

check() {
  cd "$pkgname"
  go test -v ./...
}

package() {
  cd "$pkgname"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "build/$pkgname"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" *.md
}
