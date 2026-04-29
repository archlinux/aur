# Maintainer: Xiaotian Wu <yetist@gmail.com>

_target=loongarch64-linux-gnu
pkgname=$_target-binutils
pkgver=2.44
pkgrel=1
pkgdesc='Assemble and manipulate binary and object files for 64-bit LoongArch'
arch=(x86_64)
url='https://www.gnu.org/software/binutils/'
license=(GPL)
groups=(loongarch)
depends=(
  glibc
  libelf
  zlib libz.so
  zstd libzstd.so
)
makedepends=(setconf)
source=(https://ftpmirror.gnu.org/gnu/binutils/binutils-$pkgver.tar.bz2{,.sig})
sha256sums=('f66390a661faa117d00fab2e79cf2dc9d097b42cc296bf3f8677d1e7b452dc3a'
  'SKIP')
validpgpkeys=('3A24BC1E8FB409FA9F14371813FCEF89DD9E3C4F') # Nick Clifton (Chief Binutils Maintainer) <nickc@redhat.com>

prepare() {
  setconf binutils-$pkgver/libiberty/configure ac_cpp "'\$CPP \$CPPFLAGS -O2'"
}

build() {
  cd "binutils-$pkgver"

  unset CPPFLAGS
  ./configure \
    --disable-gprofng \
    --disable-nls \
    --enable-deterministic-archives \
    --enable-gold \
    --enable-ld=default \
    --disable-multilib \
    --enable-new-dtags \
    --enable-plugins \
    --prefix=/usr \
    --target=$_target \
    --with-gnu-as \
    --with-gnu-ld \
    --with-sysroot=/usr/$_target \
    --with-system-zlib
  make -O
}

check() {
  # * Unset LDFLAGS as testsuite makes assumptions about which ones are active.
  # * Do not abort on errors - manually check log files.
  make -O -C "binutils-$pkgver" LDFLAGS="" -k check || true
}

package() {
  make -C "binutils-$pkgver" DESTDIR="$pkgdir" install

  # Remove info documents that conflict with host version
  rm -r "$pkgdir/usr/share/info"

  rm "$pkgdir"/usr/lib/bfd-plugins/libdep.so
}
