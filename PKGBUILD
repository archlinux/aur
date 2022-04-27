# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=dsq
pkgver=0.16.0
pkgrel=1
pkgdesc="CLI tool for running SQL queries against JSON/CSV/Excel/Parquet and more"
arch=('x86_64')
url="https://github.com/multiprocessio/dsq"
license=('Apache')
depends=('glibc')
makedepends=('git' 'go')
checkdepends=('python' 'jq')
options=('!lto')
_commit='e07058e422b02efb89627bc778119ce23a48d258'
source=("$pkgname::git+$url.git#commit=$_commit")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags
}

prepare() {
  cd "$pkgname"

  # download dependencies
  go mod download

  # fix failing test
  # NOTE: this still fails when _commit is changed, and pkgver is not.
  sed \
    -i scripts/test.py \
    -e "s/dsq latest/dsq $pkgver/"
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
    -X main.Version=$pkgver" \
    .
}

check() {
  cd "$pkgname"

  ./scripts/test.py
}

package() {
  cd "$pkgname"

  install -vDm755 -t "$pkgdir/usr/bin" dsq
}
