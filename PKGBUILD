# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgbase=sqlboiler
pkgname=(
  'sqlboiler'
  'sqlboiler-psql'
  # TODO: add mysql split package
)
pkgver=4.8.3
pkgrel=1
pkgdesc="Generate a Go ORM tailored to your database schema"
arch=('x86_64')
url="https://github.com/volatiletech/sqlboiler"
license=('BSD')
depends=('glibc')
makedepends=('go' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('8a90bd1ae5bc352cc1606f17bc92f05b5355173b7b5744da30edc55bd951c025f27d96d36683ffb76f69ed2fea77e0921ed591304319fb1f67786c2bdf353f81')
b2sums=('f8c3f8664e330ff80eee79443056be7b7ed06c23dfa2f40612c21c5b0ebb9566664838aa432fb66e9662a93ccd83bcafd545a888eec9ca2b7172c7a21a63a4eb')

prepare() {
  cd "$pkgbase-$pkgver"

  # create directory for build output
  mkdir build

  # download dependencies
  go mod vendor
}

build() {
  cd "$pkgbase-$pkgver"

  # set Go flags
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"

  for BINARY in . ./drivers/sqlboiler-psql; do
    go build -v \
      -trimpath \
      -buildmode=pie \
      -mod=vendor \
      -modcacherw \
      -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
      -o build \
      "$BINARY"
  done
}

package_sqlboiler() {
  optdepends=(
    'sqlboiler-psql: PostgreSQL driver'
  )
  cd "$pkgbase-$pkgver"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "build/$pkgname"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md
}

package_sqlboiler-psql() {
  pkgdesc='PostgreSQL driver for SQLBoiler'
  depends=('sqlboiler' 'postgresql-libs')
  cd "$pkgbase-$pkgver"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "build/$pkgname"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
