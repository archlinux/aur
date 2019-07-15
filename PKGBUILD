# Maintainer: Árni Dagur <arnidg@protonmail.ch>
# Adapted from original package by: Ronald van Haren <ronald.archlinux.org>
pkgname=bzip2-with-lbzip2-symlinks
pkgver=1.0.8
pkgrel=1
pkgdesc="bzip2 with binaries symbolically linked to their lbzip2 equivalents"
arch=('x86_64')
license=('custom')
url="https://sourceware.org/bzip2"
depends=('lbzip2' 'glibc' 'sh')
provides=("bzip2=$pkgver")
conflicts=('bzip2')
source=(https://sourceware.org/pub/bzip2/bzip2-$pkgver.tar.gz)
sha256sums=('ab5a03176ee106d3f0fa90e381da478ddae405918153cca248e682cd0c4a2269')
        
build() {
  cd "$srcdir/bzip2-$pkgver"

  make -f Makefile-libbz2_so CC="gcc $CFLAGS $LDFLAGS"
  make bzip2 bzip2recover CC="gcc $CFLAGS $LDFLAGS"
}

check() {
  cd "$srcdir/bzip2-$pkgver"
  make test
}

package() {
  cd "$srcdir/bzip2-$pkgver"

  install -dm755 "$pkgdir"/usr/{bin,lib,include,share/man/man1}

  # We symlink bzip2, bunzip2, and bzcat to lbzip2
  ln -sf lbzip2 $pkgdir/usr/bin/bzip2
  ln -sf lbzip2 $pkgdir/usr/bin/bunzip2
  ln -sf lbzip2 $pkgdir/usr/bin/bzcat

  # The rest is installed as normal
  install -m755 bzip2recover bzdiff bzgrep bzmore "$pkgdir"/usr/bin

  cp -a libbz2.so* "$pkgdir"/usr/lib
  ln -s libbz2.so.$pkgver "$pkgdir"/usr/lib/libbz2.so
  ln -s libbz2.so.$pkgver "$pkgdir"/usr/lib/libbz2.so.1 # For compatibility with some other distros

  install -m644 bzlib.h "$pkgdir"/usr/include/

  install -m644 bzip2.1 "$pkgdir"/usr/share/man/man1/
  ln -sf bzip2.1 "$pkgdir"/usr/share/man/man1/bunzip2.1
  ln -sf bzip2.1 "$pkgdir"/usr/share/man/man1/bzcat.1
  ln -sf bzip2.1 "$pkgdir"/usr/share/man/man1/bzip2recover.1

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}
