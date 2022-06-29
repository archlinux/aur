# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=dsq
pkgver=0.21.0
pkgrel=1
pkgdesc='CLI tool for running SQL queries against JSON/CSV/Excel/Parquet and more'
arch=('x86_64')
url='https://github.com/multiprocessio/dsq'
license=('Apache')
depends=('glibc')
makedepends=('git' 'go')
checkdepends=('python' 'jq' 'p7zip')
options=('!lto')
_commit='e58372b0855a54f7b20ad6ff3dfa48c9bd931fbc'
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

  # fix failing test
  sed \
    -i scripts/test.py \
    -e "s/dsq latest/dsq $pkgver/"

  # setup taxi.csv
  7z e testdata/taxi.csv.7z

  # ensure chatter from systemd-nspawn doesn't modify expected stdout
  LC_ALL=C ./scripts/test.py
}

package() {
  cd "$pkgname"

  install -vDm755 -t "$pkgdir/usr/bin" dsq
}
