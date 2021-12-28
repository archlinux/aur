# Maintainer: 0b100100 <0b100100 at protonmail dot ch>
# Contributor: Gaetan Bisson <bisson@archlinux.org>

pkgname=msieve
pkgver=1.53
pkgrel=2
pkgdesc='Library for factoring large integers'
url='https://sourceforge.net/projects/msieve'
license=('custom')
arch=('x86_64')
depends=('zlib' 'gmp-ecm')
source=("$pkgname-$pkgver.tar.gz::https://downloads.sourceforge.net/project/msieve/msieve/Msieve%20v$pkgver/msieve${pkgver//./}_src.tar.gz")
sha512sums=('e50e8913d38ed4108f5f2ecdbb338968edd416c56c5b7a92d8598b81fc16014ce7c7df963101c65f5bc88d1c7b2d8dbaa572efbecf53d720430a327929c9ce12')

build() {
  cd "$pkgname-$pkgver"
  CFLAGS+=' -fopenmp'
  # Note: Makefile defines auto-configured OPT_FLAGS
  # and leaves MACHINE_FLAGS for us to tweak CFLAGS.
  # (a) If you do not want to override OPT_FLAGS's -O3 or -march=native:
  # make all ECM=1 MACHINE_FLAGS="\$(filter-out -O% -m%,$CFLAGS)"
  # (b) Better keep our -m overrides, but use OPT_FLAGS's -O3 setting:
  # make all ECM=1 MACHINE_FLAGS="\$(filter-out -O%,$CFLAGS)"
  # (c) Use all CFLAGS from makepkg.conf, including -O* and -m* flags:
  make all ECM=1 MACHINE_FLAGS="$CFLAGS"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 msieve -t "$pkgdir/usr/bin/"
  install -Dm644 Readme* Changes -t "$pkgdir/usr/share/doc/$pkgname/"
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s /usr/share/doc/$pkgname/Readme "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
