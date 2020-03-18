# Maintainer: Tilmann Meyer <tilmann.meyer@gmx.net>

_target=aarch64-linux-gnu

_pkgname=bzip2
pkgname=$_target-$_pkgname
pkgver=1.0.8
pkgrel=1
pkgdesc='A high-quality data compression program (ARM64)'
arch=(x86_64)
url='https://sourceware.org/bzip2/'
license=(custom)
depends=($_target-glibc)
makedepends=($_target-environment)
options=(!buildflags)
source=(
  https://sourceware.org/pub/bzip2/$_pkgname-$pkgver.tar.gz{,.sig}
)
sha256sums=(
  'ab5a03176ee106d3f0fa90e381da478ddae405918153cca248e682cd0c4a2269'
  'SKIP'
)
validpgpkeys=(
  'EC3CFE88F6CA0788774F5C1D1AA44BE649DE760A' # Mark Wielaard <mark@klomp.org>
)

_srcdir=$_pkgname-$pkgver

strip() {
  ${_target}-strip "$@"
}

objcopy() {
  ${_target}-objcopy "$@"
}

build() {
  cd $_srcdir

  make -f Makefile-libbz2_so CC="$_target-gcc $CFLAGS $LDFLAGS"
  make bzip2 bzip2recover CC="$_target-gcc $CFLAGS $LDFLAGS"
}

package() {
  cd $_srcdir

  install -dm755 "$pkgdir"/usr/$_target/{bin,lib,include,share/man/man1}

  install -m755 bzip2-shared "$pkgdir"/usr/$_target/bin/bzip2
  install -m755 bzip2recover bzdiff bzgrep bzmore "$pkgdir"/usr/$_target/bin
  ln -sf bzip2 "$pkgdir"/usr/$_target/bin/bunzip2
  ln -sf bzip2 "$pkgdir"/usr/$_target/bin/bzcat

  cp -a libbz2.so* "$pkgdir"/usr/$_target/lib
  ln -s libbz2.so.$pkgver "$pkgdir"/usr/$_target/lib/libbz2.so
  ln -s libbz2.so.$pkgver "$pkgdir"/usr/$_target/lib/libbz2.so.1 # For compatibility with some other distros

  install -m644 bzlib.h "$pkgdir"/usr/$_target/include/

  install -m644 bzip2.1 "$pkgdir"/usr/$_target/share/man/man1/
  ln -sf bzip2.1 "$pkgdir"/usr/$_target/share/man/man1/bunzip2.1
  ln -sf bzip2.1 "$pkgdir"/usr/$_target/share/man/man1/bzcat.1
  ln -sf bzip2.1 "$pkgdir"/usr/$_target/share/man/man1/bzip2recover.1
}
