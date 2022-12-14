# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Jakub Jirutka <jakub@jirutka.cz>

pkgname=libpg_query
# All versions are tagged by the major Postgres version,
# plus an individual semver for this library itself.
pkgver=15.4.0.0
pkgrel=1
pkgdesc='C library for accessing the PostgreSQL parser outside of the server environment'
arch=('x86_64')
url='https://github.com/pganalyze/libpg_query'
license=('BSD')
depends=('protobuf-c' 'xxhash')
makedepends=('git')
_commit='1ada550d901ed4edbfb6bce2163d21f4b948ab2d'
source=(
  "$pkgname::git+$url#commit=$_commit"
  'dont-override-opt-level.patch'
  'verbose-build.patch'
  'unbundle-vendor-deps.patch'
)
sha512sums=('SKIP'
            'c3a9d97c72e72064fbb67a11860b4300090e18c7d4037d963f47dc182e5e52e1f8c03459e69c927fbb2c9e7bd546eb3621921afaa7dfcb6689c885287a4db78d'
            '374e0d62fa252edb306d74f93645675aa4287348046ea1804a1994725f0f9cdf8fbe8f370272c31385aec892bb5aed887a6d2e3431b12c310f42652ef277e0fc'
            'cb25169a3c34a9f9743e183ed5be32d3514f185070928c3a3e2a7293885572ad36af5806562731528a12deee2907a36a249bc0d74f8e020c3f691612dc781216')
b2sums=('SKIP'
        '9c84f1839ff95eb4f20c18fa2f9be49528e550769dcd4a9e2d3a8c9f61d92b787bc412a10ca454f0f3332d03db5149901ccaf1d0d5a1ce7fe49fdf04a1c7ba66'
        'd72739dbacf1aa078164e4fd97cf3bd3f41703006f2d847ed8c66d53c7a55ad20e64467df80402aecd2d52fcb05e503b27181c7f2cd81cbf0550f38f3345ffdf'
        '347df596d122e5d72f419d2dbd5a2e535b2c5a64a2820e68f8592308d6ad6817e2edc94c6a6eba0e084cda57ba3435db839cfd911713b803c74492c1fc23a621')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/-/./g'
}

prepare() {
  cd "$pkgname"

  patch -p1 -i "$srcdir/dont-override-opt-level.patch"
  #patch -p1 -i "$srcdir/verbose-build.patch"
  patch -p1 -i "$srcdir/unbundle-vendor-deps.patch"

  # remove vendored libraries (protobuf-c & xxhash)
  rm -rf vendor
}

build() {
  cd "$pkgname"

  make build_shared
}

check() {
  cd "$pkgname"

  make test
}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir" prefix=/usr install

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" *.md
}
