# Maintainer: envolution
# Contributor: Darren Ng <$(base64 --decode <<<'ZGFycmVuMTk5NzA4MTBAZ21haWwuY29tCg==')>
# shellcheck shell=bash disable=SC2034,SC2154
# Co-Maintainer: Simon Krogmann <$(base64 --decode <<<'cy5rcm9nbWFubkB5YWhvby5jb20K')>
pkgname=pmdk
pkgver=2.1.1
pkgrel=2
pkgdesc="Persistent Memory Development Kit"
arch=('x86_64')
url="https://pmem.io/"
license=('BSD-3-Clause OSL-1.0')
makedepends=(pandoc-cli)
depends=(
  'ndctl>=63'
)
optdepends=(
  'libfabric>=1.4.2: required by librpmem'
)
provides=(
  'libpmem'
  'libpmem2'
  'libpmemobj'
  'libpmemblk'
  'libpmemlog'
  'libpmempool'
  'librpmem'
)
makedepends=(pandoc-cli)
source=("$pkgname-$pkgver.tar.gz::https://github.com/pmem/pmdk/archive/$pkgver.tar.gz")
sha1sums=('60ca219fff75741bcc66d355c0764ca8692e07d5')

build() {
  cd "$pkgname-$pkgver" || exit 1
  EXTRA_CFLAGS="-Wno-error" make
}

check() {
  cd "$pkgname-$pkgver/src/test" || exit 1
  EXTRA_CFLAGS="-Wno-error" make TEST_TYPE=short TEST_BUILD=nondebug TEST_FS=pmem UNIT_LOG_LEVEL=1
  touch testconfig.sh && ./RUNTESTS.sh -k obj_sync,util_is_zeroed
}

package() {
  cd "$pkgname-$pkgver" || exit 1
  DESTDIR="$pkgdir" make install prefix=/usr
  mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib"
  install -Dm644 LICENSE/BSD-3-Clause "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 LICENSE/OPENSOLARIS.LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=2 sw=2 et:
