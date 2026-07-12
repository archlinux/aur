# Maintainer: Ning Sun <n@sunng.info>
pkgname=tapgres-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Passively tap a local PostgreSQL port and decode its wire traffic to stdout"
arch=('x86_64')
url="https://github.com/sunng87/tapgres"
provides=('tapgres')
conflicts=('tapgres')
license=('MIT')
depends=('glibc' 'gcc-libs' 'libpcap')
makedepends=('patchelf')
source=("$pkgname-$pkgver::https://github.com/sunng87/tapgres/releases/download/v${pkgver}/tapgres-linux-x86_64")
sha256sums=('08b6f0b0ff253f26127ab2767e10b970990af0bbde4e94bd4c6ad3ea981b67d2')

package() {
  # The binary is produced by `nix build`, so its ELF interpreter and RUNPATH
  # point into /nix/store. Repoint the interpreter to Arch's dynamic loader and
  # drop the nix RUNPATH so libpcap.so.1 resolves from the system (/usr/lib).
  patchelf --set-interpreter /usr/lib/ld-linux-x86-64.so.2 "$srcdir/$pkgname-$pkgver"
  patchelf --remove-rpath "$srcdir/$pkgname-$pkgver"
  install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/tapgres"
}
