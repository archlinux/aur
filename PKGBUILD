# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Jakub Jirutka <jakub@jirutka.cz>

pkgname=libpg_query
# All versions are tagged by the major Postgres version,
# plus an individual semver for this library itself.
pkgver=13.2.0.7
_pkgver="${pkgver/./-}"
pkgrel=1
pkgdesc="C library for accessing the PostgreSQL parser outside of the server environment"
arch=('x86_64')
url="https://github.com/pganalyze/libpg_query"
license=('BSD')
depends=('protobuf-c' 'xxhash')
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/$_pkgver.tar.gz"
  'dont-override-opt-level.patch'
  'verbose-build.patch'
  'unbundle-vendor-deps.patch'
)
b2sums=('5e7322d53cce033d6e61060f564b033781a354d1ab32cb1570f4e387f1340ef5d45cc6772354dc2336a6632f6ec508699e617f1aba75e5a450b0fda53c8e9f26'
        '9c84f1839ff95eb4f20c18fa2f9be49528e550769dcd4a9e2d3a8c9f61d92b787bc412a10ca454f0f3332d03db5149901ccaf1d0d5a1ce7fe49fdf04a1c7ba66'
        'd72739dbacf1aa078164e4fd97cf3bd3f41703006f2d847ed8c66d53c7a55ad20e64467df80402aecd2d52fcb05e503b27181c7f2cd81cbf0550f38f3345ffdf'
        '347df596d122e5d72f419d2dbd5a2e535b2c5a64a2820e68f8592308d6ad6817e2edc94c6a6eba0e084cda57ba3435db839cfd911713b803c74492c1fc23a621')

prepare() {
  cd "$pkgname-$_pkgver"

  patch -p1 -i "$srcdir/dont-override-opt-level.patch"
  patch -p1 -i "$srcdir/verbose-build.patch"
  patch -p1 -i "$srcdir/unbundle-vendor-deps.patch"

  # remove vendored libraries (protobuf-c & xxhash)
  rm -rf vendor
}

build() {
  cd "$pkgname-$_pkgver"
  make build_shared
}

check() {
  cd "$pkgname-$_pkgver"
  make test
}

package() {
  cd "$pkgname-$_pkgver"
  make DESTDIR="$pkgdir" prefix=/usr install

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" *.md
}
