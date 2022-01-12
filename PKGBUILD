# Maintainer: Your Name <youremail@domain.com>

pkgname=dsq
pkgver=r11.bfcb014
pkgrel=1
pkgdesc="CLI tool for running SQL queries against JSON/CSV/Excel/Parquet and more"
arch=('x86_64')
url="https://github.com/multiprocessio/dsq"
license=('Apache')
depends=('glibc')
makedepends=('git' 'go')
checkdepends=('jq')
options=('!lto')
_commit='bfcb01443274da6dce619a9483afd408b0699658'
source=("$pkgname::git+$url.git#commit=$_commit")
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

  ./scripts/test.sh
}

package() {
  cd "$pkgname"

  install -vDm755 -t "$pkgdir/usr/bin" dsq
}
