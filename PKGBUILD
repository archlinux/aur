# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=prometheus-unbound-exporter
pkgver=0.4.1
pkgrel=1
pkgdesc='Prometheus exporter for Unbound'
arch=('x86_64')
url='https://github.com/letsencrypt/unbound_exporter'
license=('Apache')
groups=()
depends=('glibc')
makedepends=('git' 'go')
optdepends=('unbound: for local instance')
options=('!lto')
_commit='8c54f36172092fe900745cdd135a7fa3394b233f'
source=("$pkgname::git+$url.git#commit=$_commit")
md5sums=('SKIP')

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

  go build -v\
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags ${LDFLAGS}" \
    -o "build/$pkgname" \
    .
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
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
