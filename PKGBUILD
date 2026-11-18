# Maintainer: robertfoster
pkgbase=daxfs
pkgname=(daxfs-dkms daxfs-utils)
pkgver=0.1.0 # renovate: datasource=github-tags depName=multikernel/daxfs
pkgrel=2
pkgdesc="DAX-based filesystem for multikernel and multi-host shared memory"
arch=(x86_64 aarch64 riscv64)
url="https://github.com/multikernel/daxfs"
license=('GPL-2.0-only')
source=("$pkgbase-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  'dkms.conf')

build() {
  cd "$pkgbase-$pkgver"
  # tools/Makefile links with $(CFLAGS) only
  make -C tools CFLAGS="$CFLAGS $LDFLAGS -I../include"
}

package_daxfs-dkms() {
  pkgdesc+=" (DKMS kernel module)"
  arch=(any)
  depends=('dkms')

  local _dest="$pkgdir/usr/src/$pkgbase-$pkgver"
  cd "$pkgbase-$pkgver"
  install -Dm644 -t "$_dest/daxfs" daxfs/Makefile daxfs/*.c daxfs/*.h
  install -Dm644 -t "$_dest/include" include/*.h
  sed "s/@PKGVER@/$pkgver/" "$srcdir/dkms.conf" > "$_dest/dkms.conf"
}

package_daxfs-utils() {
  pkgdesc+=" (mkdaxfs and daxfs-inspect)"
  depends=('glibc')

  cd "$pkgbase-$pkgver/tools"
  install -Dm755 -t "$pkgdir/usr/bin" mkdaxfs daxfs-inspect
}
sha256sums=('d9e0f9b5aee1f1a707f9b09bac9222a21ab34afebf10eedbbb1554ed69d970ed'
            '079f8b5f8636cd858fc17a0549a44004706263b430780b2ca1f42c99ef99baf8')
