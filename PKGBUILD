# Maintainer: Jacko Dirks <jacko dot dirks at gmail dot com>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Martin Schmölzer <mschmoelzer@gmail.com>

_target=riscv-none-elf
pkgname=$_target-binutils
pkgver=2.42
pkgrel=1
pkgdesc='A set of programs to assemble and manipulate binary and object files for the RISC-V (bare-metal) target'
arch=(x86_64)
url='https://www.gnu.org/software/binutils/'
license=(GPL)
depends=(zlib libelf)
source=(https://ftp.gnu.org/gnu/binutils/binutils-$pkgver.tar.bz2{,.sig})
sha1sums=('ead6f01f47cf1a6c39bfaf83ab84ac99bc6d70c8'
          'SKIP')
sha256sums=('aa54850ebda5064c72cd4ec2d9b056c294252991486350d9a97ab2a6dfdfaf12'
            'SKIP')
validpgpkeys=('3A24BC1E8FB409FA9F14371813FCEF89DD9E3C4F') # Nick Clifton (Chief Binutils Maintainer) <nickc@redhat.com>

prepare() {
  cd binutils-$pkgver
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure
}

build() {
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
