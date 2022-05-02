# Maintainer: Rafael Silva (perigoso) <perigoso@riseup.net>

_target=ft32-elf
pkgname=$_target-binutils
pkgver=2.37
pkgrel=2
pkgdesc='A set of programs to assemble and manipulate binary and object files for the Bridgetek FT9xx (bare-metal) target'
arch=(x86_64)
url='https://www.gnu.org/software/binutils/'
license=(GPL)
depends=(zlib)
source=("https://ftp.gnu.org/gnu/binutils/binutils-$pkgver.tar.bz2"{,.sig}
		'SORT_NONE.patch')
sha512sums=('b3f5184697f77e94c95d48f6879de214eb5e17aa6ef8e96f65530d157e515b1ae2f290e98453e4ff126462520fa0f63852b6e1c8fbb397ed2e41984336bc78c6'
            'SKIP'
            'fae89927035f2e9e1f83183d1e39c510d0e6124cd20493e705e70f3752f6fb8c7a8d5c88cc187978493ae39b619c0f9f5016d154c94a8aeca0006cc29e878d7a')
validpgpkeys=('EAF1C276A747E9ED86210CBAC3126D3B4AE55E93'  # Tristan Gingold <gingold@adacore.com>
              '3A24BC1E8FB409FA9F14371813FCEF89DD9E3C4F') # Nick Clifton (Chief Binutils Maintainer) <nickc@redhat.com>

prepare() {
  cd binutils-$pkgver

  # Patch bad linker
  patch --strip=1 --input="$srcdir/SORT_NONE.patch"

  # hack! - libiberty configure tests for header files using "$CPP $CPPFLAGS"
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
