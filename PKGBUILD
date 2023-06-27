# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgbase=sqlboiler
pkgname=(
  'sqlboiler'
  'sqlboiler-psql'
  # TODO: add mysql split package
)
pkgver=4.14.2
pkgrel=1
pkgdesc='Generate a Go ORM tailored to your database schema'
arch=('x86_64')
url='https://github.com/volatiletech/sqlboiler'
license=('BSD')
depends=('glibc')
makedepends=('git' 'go')
options=('!lto')
_commit='e6989a7f42bc2f8e83f149bef91be49be80fb10d'
source=("$pkgbase::git+$url.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgbase"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgbase"

  # create directory for build output
  mkdir build

  # download dependencies
  go mod download
}

build() {
  cd "$pkgbase"

  # set Go flags
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"

  for BINARY in . ./drivers/sqlboiler-psql ./drivers/sqlboiler-sqlite3; do
    go build -v \
      -trimpath \
      -buildmode=pie \
      -mod=readonly \
      -modcacherw \
      -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
      -o build \
      "$BINARY"
  done
}

package_sqlboiler() {
  cd "$pkgbase"

  # binary
  install -vDm755 \
    -t "$pkgdir/usr/bin" \
    "build/$pkgname" \
    "build/$pkgname-sqlite3"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md
}

package_sqlboiler-psql() {
  pkgdesc='PostgreSQL driver for SQLBoiler'
  depends=('sqlboiler' 'postgresql-libs')

  cd "$pkgbase"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "build/$pkgname"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

