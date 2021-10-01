# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgbase=sqlboiler
pkgname=(
  'sqlboiler'
  'sqlboiler-psql'
  # TODO: add mysql split package
)
pkgver=4.7.1
pkgrel=1
pkgdesc="Generate a Go ORM tailored to your database schema"
arch=('x86_64')
url="https://github.com/volatiletech/sqlboiler"
license=('BSD')
depends=('glibc')
makedepends=('go' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('84064a3c5fa30a2d2837fd8734598ab7645a54a0fac07de8b468f421ba7c40879228777c06faf8700f62f92cc462b308a0d911a9850033fb60fba511e553087a')
b2sums=('55be4e4d20a939a95cc1266698881d103a96305de87506b0cff1296ebc046bf068c86ad9e803dd0094677ca56a0de8f1143fc4fdd33d8e2b6da5661803be0d1d')

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
