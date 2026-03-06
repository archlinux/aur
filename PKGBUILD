# Maintainer: Jacko Dirks <jacko dot dirks at gmail dot com>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Martin Schmölzer <mschmoelzer@gmail.com>

_target=riscv-none-elf
pkgname=$_target-binutils
pkgver=2.46.0
pkgrel=1
pkgdesc='A set of programs to assemble and manipulate binary and object files for the RISC-V (bare-metal) target'
arch=(x86_64)
url='https://www.gnu.org/software/binutils/'
license=(GPL)
depends=(zlib libelf)
source=(https://ftp.gnu.org/gnu/binutils/binutils-$pkgver.tar.xz{,.sig})
sha512sums=(
    '32f880bb4f69351f4ae54a5d00359625c6c49d8e76624fb5cffdf174c79c8d3212f66225b81c12933c6ed59604ab652560773dd92fab384b930c97a9d4e1fdf2'
    '018464031b1fb9031e7dce39fed33a12cc91eb77a931d218c885dee01154ead5d45b237c5670eff2c487e6d957a760bc6f2d7e9072b86ba5ae24dc776dd21908'
)
validpgpkeys=('3A24BC1E8FB409FA9F14371813FCEF89DD9E3C4F' # Nick Clifton (Chief Binutils Maintainer) <nickc@redhat.com>
              '5EF3A41171BB77E6110ED2D01F3D03348DB1A3E2') # Sam James <sam@cmpct.info>

prepare() {
  cd binutils-$pkgver
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure
}

build() {

  CFLAGS="${CFLAGS} -Wno-error"
  cd binutils-$pkgver

  ./configure --target=$_target \
              --with-sysroot=/usr/$_target \
              --prefix=/usr \
              --enable-multilib \
              --enable-interwork \
              --with-gnu-as \
              --with-gnu-ld \
              --disable-nls \
              --enable-ld=default \
              --enable-gold \
              --enable-plugins \
              --enable-deterministic-archives

  make
}

check() {
  cd binutils-$pkgver

  # unset LDFLAGS as testsuite makes assumptions about which ones are active
  # do not abort on errors - manually check log files
  make LDFLAGS="" -k check || true
}

package() {
  cd binutils-$pkgver

  make DESTDIR="$pkgdir" install

  # Remove file conflicting with host binutils and manpages for MS Windows tools
  rm "$pkgdir"/usr/share/man/man1/$_target-{dlltool,windres,windmc}*
  rm "$pkgdir"/usr/lib/bfd-plugins/libdep.so

  # Remove info documents that conflict with host version
  rm -r "$pkgdir"/usr/share/info
}
