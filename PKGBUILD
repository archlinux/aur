# Maintainer: Alexander Nicholi <alex@caveoforig.in>

pkgname=agbcc
pkgver=1
pkgrel=1
epoch=
pkgdesc='GCC 2.95.1 reworked to match games compiled for the Game Boy Advance.'
arch=('i686' 'x86_64')
url="https://github.com/pret/$pkgname"
license=('GPL-2.0')
makedepends=('git')
provides=("$pkgname")
conflicts=("$pkgname")
source=("git+https://github.com/pret/$pkgname.git")
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"

  make -C gcc old
  mv gcc/old_agbcc "$srcdir/old_agbcc.elf"
  # scripts called by the Makefiles expect to find ‘../old_agbcc’
  ln -s "$srcdir/old_agbcc.elf" old_agbcc
  make -C gcc clean
  make -C gcc
  mv gcc/agbcc "$srcdir/agbcc.elf"
  make -C libgcc
  make -C libc
  mv libgcc/libgcc.a "$srcdir/libgcc.a"
  mv libc/libc.a "$srcdir/libc.a"
}

package() {
  cd "$srcdir/$pkgname"

  install -d "$pkgdir/opt/pret/agbcc/bin"
  install -d "$pkgdir/opt/pret/agbcc/include"
  install -d "$pkgdir/opt/pret/agbcc/lib"
  install -s -m755 "$srcdir/agbcc.elf" "$pkgdir/opt/pret/agbcc/bin/agbcc"
  install -m644 "$srcdir/libgcc.a" "$pkgdir/opt/pret/agbcc/lib/libgcc.a"
  install -m644 "$srcdir/libc.a" "$pkgdir/opt/pret/agbcc/lib/libc.a"
  mv "$srcdir/$pkgname/ginclude" "$srcdir/$pkgname/include"
  cp -r "$srcdir/$pkgname/include" "$pkgdir/opt/pret/agbcc/"
  cp -r "$srcdir/$pkgname/libc/include" "$pkgdir/opt/pret/agbcc/"
  find "$pkgdir/opt/pret/agbcc/include" -type f -exec chmod 644 {} \;
}
