# Maintainer: Nicolas Farmer <nicolas dot farmer at proton dot me>

_target=ia64-linux-gnu
pkgname=$_target-binutils
pkgver=2.42
pkgrel=1
pkgdesc='GNU binutils for IA64 (Itanium)'
arch=('aarch64' 'x86_64')
url='https://www.gnu.org/software/binutils/'
license=(GPL)
depends=('libelf' 'zlib')
makedepends=('setconf')
source=(https://ftp.gnu.org/gnu/binutils/binutils-${pkgver}.tar.xz{,.sig})
sha256sums=('f6e4d41fd5fc778b06b7891457b3620da5ecea1006c6a4a41ae998109f85a800'
	    'SKIP')
validpgpkeys=(3A24BC1E8FB409FA9F14371813FCEF89DD9E3C4F) # Nick Clifton (Chief Binutils Maintainer) <nickc@redhat.com>

build() {
  cd "binutils-$pkgver"

  unset CPPFLAGS
  ./configure \
    --disable-nls \
    --enable-deterministic-archives \
    --enable-gold \
    --enable-ld=default \
    --disable-multilib \
    --enable-plugins \
    --prefix=/usr \
    --target=$_target \
    --with-gnu-as \
    --with-gnu-ld \
    --with-sysroot=/usr/$_target \
    --with-system-zlib
  make -O -j`nproc`
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
  rm -rf "$pkgdir"/usr/share/{gdb,man}
}
