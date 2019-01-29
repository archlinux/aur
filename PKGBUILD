# Maintainer: Árni Dagur <arnidg@protonmail.ch>
# Adapted from original package by: Ronald van Haren <ronald.archlinux.org>
pkgname=bzip2-with-lbzip2-symlinks
pkgver=1.0.6
pkgrel=1
pkgdesc="bzip2 with binaries symbolically linked to their lbzip2 equivalents"
arch=('x86_64')
license=('custom')
url="http://sources.redhat.com/bzip2"
depends=('lbzip2' 'glibc' 'sh')
provides=("bzip2=$pkgver")
conflicts=('bzip2')
source=(https://sources.archlinux.org/other/packages/bzip2/bzip2-$pkgver.tar.gz
        bzip2-1.0.4-bzip2recover.patch
        fix-heap-use-after-free-bzip2recover.patch::https://gitweb.gentoo.org/repo/gentoo.git/plain/app-arch/bzip2/files/bzip2-1.0.6-CVE-2016-3189.patch)
sha256sums=('a2848f34fcd5d6cf47def00461fcb528a0484d8edef8208d6d2e2909dc61d9cd'
            '0585fb92a4b409404147a3f940ed2ca03b3eaed1ec4fb68ae6ad74db668bea83'
            'e8792b2c7943486ab35893ffd9e638bbf2edbcab4f9f7b87544519bb3564af41')
        
build() {
  cd "$srcdir/bzip2-$pkgver"

  # add large-file support
  sed -e 's/^CFLAGS=\(.*\)$/CFLAGS=\1 \$(BIGFILES)/' -i ./Makefile-libbz2_so

  # use our optimization
  sed -i "s|-O2|${CFLAGS}|g" Makefile
  sed -i "s|-O2|${CFLAGS}|g" Makefile-libbz2_so

  patch -Np1 < ../bzip2-1.0.4-bzip2recover.patch
  # CVE-2016-3189
  patch -Np1 -i "${srcdir}/fix-heap-use-after-free-bzip2recover.patch"

  make -f Makefile-libbz2_so
  make bzip2recover
}

check() {
  cd "$srcdir/bzip2-$pkgver"
  make test
}

package() {
  cd "$srcdir/bzip2-$pkgver"

  install -dm755 $pkgdir/usr/{bin,lib,include,share/man/man1}

  # We symlink bzip2, bunzip2, and bzcat to lbzip2
  ln -sf lbzip2 $pkgdir/usr/bin/bzip2
  ln -sf lbzip2 $pkgdir/usr/bin/bunzip2
  ln -sf lbzip2 $pkgdir/usr/bin/bzcat

  # The rest is installed as normal
  install -m755 bzip2recover bzdiff bzgrep bzmore $pkgdir/usr/bin

  install -m755 libbz2.so.1.0.6 $pkgdir/usr/lib
  ln -s libbz2.so.1.0.6 $pkgdir/usr/lib/libbz2.so
  ln -s libbz2.so.1.0.6 $pkgdir/usr/lib/libbz2.so.1
  ln -s libbz2.so.1.0.6 $pkgdir/usr/lib/libbz2.so.1.0

  install -m644 bzlib.h $pkgdir/usr/include/

  install -m644 bzip2.1 $pkgdir/usr/share/man/man1/
  ln -sf bzip2.1 $pkgdir/usr/share/man/man1/bunzip2.1
  ln -sf bzip2.1 $pkgdir/usr/share/man/man1/bzcat.1
  ln -sf bzip2.1 $pkgdir/usr/share/man/man1/bzip2recover.1

  install -Dm644 $srcdir/bzip2-${pkgver}/LICENSE \
                 $pkgdir/usr/share/licenses/${pkgname}/LICENSE
}
