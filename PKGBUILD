# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgbase=sqlboiler
pkgname=(
  'sqlboiler'
  'sqlboiler-psql'
  # TODO: add mysql split package
)
pkgver=4.7.0
pkgrel=1
pkgdesc="Generate a Go ORM tailored to your database schema"
arch=('x86_64')
url="https://github.com/volatiletech/sqlboiler"
license=('BSD')
depends=('glibc')
makedepends=('go' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('af8ec2c560298ab6e6850ac6c2f6f713728c4fbf9f9783948f49a1b040651201ee30b9262761d1d85c4ff6d990db583e90f688edaeec9b5aaa1017c7fb0c7b3f')
b2sums=('3b1bd9e18e99702831d4efa3f9ed943839d4bad57930cfe7c9a9452ceddb681ea7c54709b77d97a8e2fc113ff180eb6679b77b184c6908931613cda0473a9559')

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
  desc=('PostgreSQL driver for SQLBoiler')
  depends=('sqlboiler' 'postgresql-libs')
  cd "$pkgbase-$pkgver"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "build/$pkgname"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
