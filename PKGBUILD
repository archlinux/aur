# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Thermi <noel[ at ] familie-kuntze.de>
# Submitter: nullie

pkgname=lsyncd
pkgver=2.3.1
pkgrel=1
pkgdesc="Live Syncing (Mirror) Daemon"
arch=(x86_64)
url="https://github.com/axkibe/lsyncd"
license=(GPL2)
depends=(
  rsync
  lua53
)
makedepends=(
  asciidoc
  cmake
)

source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/lsyncd/lsyncd/archive/refs/tags/v$pkgver.tar.gz"
  "lsyncd.service"
  "use-lua53.patch"
)
sha256sums=(
  '501f70368da8c43d3da81bf9bbb22f43dfcbc9f96b03c745842f326723c091c7'
  '538072a4505abbdf8c4d16c9200810d4a2253f892a71fc16b5cd7f35ebe1ae57'
  'ef55721553bdac0e3441ced58b9df1bb0d24f97513e66c12c3e94a477ba89115'
)

_archive="$pkgname-$pkgver"


prepare() {
  cd "$_archive"

  patch --forward --strip=1 --input="$srcdir/use-lua53.patch"
}

build() {
  cd "$_archive"

  cmake -B build -S . \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Wno-dev
  cmake --build build
}

package() {
  cd "$_archive"

  DESTDIR="$pkgdir" cmake --install build

  install -Dm664 "${pkgdir}/man1/lsyncd.1" "${pkgdir}/usr/share/man/man1/lsyncd.1"
  rm -rf "${pkgdir}/man1"

  mkdir -p "${pkgdir}/usr/share/doc/$pkgname"
  cp -r "${pkgdir}/usr/doc/examples" "${pkgdir}/usr/share/doc/$pkgname/examples"
  rm -rf "${pkgdir}/usr/doc"
}
