# Maintainer: Ning Sun <n@sunng.info>
pkgname=tapgres-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Passively tap a local PostgreSQL port and decode its wire traffic to stdout"
arch=('x86_64')
url="https://github.com/sunng87/tapgres"
provides=('tapgres')
conflicts=('tapgres')
license=('MIT')
depends=('glibc' 'gcc-libs' 'libpcap')
makedepends=('patchelf')
source=("$pkgname-$pkgver::https://github.com/sunng87/tapgres/releases/download/v${pkgver}/tapgres-linux-x86_64"
        "tapgres-$pkgver.1.gz::https://github.com/sunng87/tapgres/releases/download/v${pkgver}/tapgres.1.gz")
sha256sums=('e5aa4a402ec233c3e41c50e68a7aa07161d947243fc25d0e37e5e84fe817e7db' 'f4c9c68700a17e3ca8301ea2106e2957873c7094c00374281f55500f7c0ba704')

package() {
  # The binary is produced by `nix build`, so its ELF interpreter and RUNPATH
  # point into /nix/store. Repoint the interpreter to Arch's dynamic loader and
  # drop the nix RUNPATH so libpcap.so.1 resolves from the system (/usr/lib).
  patchelf --set-interpreter /usr/lib/ld-linux-x86-64.so.2 "$srcdir/$pkgname-$pkgver"
  patchelf --remove-rpath "$srcdir/$pkgname-$pkgver"
  install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/tapgres"
  install -Dm644 "$srcdir/tapgres-$pkgver.1.gz" "$pkgdir/usr/share/man/man1/tapgres.1.gz"
}
