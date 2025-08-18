# Maintainer: Leandro Vital Catarin <leavitals@gmail.com>

pkgname=dasm-git
pkgver=r343.c46737b
pkgrel=1
pkgdesc="A versatile macro assembler with support for several 8-bit microprocessors including 6502, 6507, 6803, HD6303, 68HC11, 68705, and F8 (git version)"
arch=('x86_64')
url="https://dasm-assembler.github.io/"
license=('GPL2')
provides=('dasm' 'ftohex')
conflicts=('dasm')
depends=('glibc')
makedepends=('git' 'gcc')
source=("git+https://github.com/dasm-assembler/dasm.git"
        "fix-opdis.patch")
sha256sums=('SKIP'
            '99da37b7d881aa74a371fddb94972b79ec13fddda5065935cdd51b708f9c40b5')

prepare() {
  cd "$srcdir/dasm"
  patch -p1 -i "$srcdir/fix-opdis.patch"
}

pkgver() {
  cd "$srcdir/dasm"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/dasm"
  make
}

package() {
  cd "$srcdir/dasm"

  install -dm755 "$pkgdir/usr/bin"
  install -Dm755 bin/dasm bin/ftohex "$pkgdir/usr/bin"

  install -dm755 "$pkgdir/usr/share/man/man1" "$pkgdir/usr/share/docs/dasm"
  install -Dm644 docs/dasm.txt docs/ftohex.txt "$pkgdir/usr/share/docs/dasm"

  install -dm755 "$pkgdir/usr/include/dasm/atari2600" "$pkgdir/usr/include/dasm/channel-f"
  install -Dm644 machines/atari2600/* "$pkgdir/usr/include/dasm/atari2600"
  install -Dm644 machines/channel-f/* "$pkgdir/usr/include/dasm/channel-f"
}