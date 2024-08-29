# Maintainer: Jaap Aarts <jaap.aarts1@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Emil Renner Berthing <aur@esmil.dk>

_target=riscv64-linux-uclibc
pkgname=$_target-binutils
pkgver=2.43
pkgrel=1
pkgdesc='Assemble and manipulate binary and object files for 32-bit and 64-bit RISC-V'
arch=(x86_64)
url='https://gnu.org/software/binutils/'
license=(GPL-2.0-or-later GPL-3.0-or-later LGPL-2.0-or-later LGPL-3.0-or-later GFDL-1.3 FSFAP)
groups=(risc-v)
depends=(libelf)
makedepends=(setconf)
source=("https://ftp.gnu.org/gnu/binutils/binutils-$pkgver.tar.xz"
        "git+https://github.com/uclinux-dev/elf2flt.git#commit=13dbbb85982c18f0a1f356a97eb315a14361f389")
sha512sums=('93e063163e54d6a6ee2bd48dc754270bf757a3635b49a702ed6b310e929e94063958512d191e66beaf44275f7ea60865dbde138b624626739679fcc306b133bb'
            'ec483264b5b9dbd7e9b46b9cf2af77cc5e5d85000e21fbd36209ceaba29316b47e0f3688f6b163d2907394c0b2e767e419d812ef0c8d4410d7a41ab17b276636')

prepare() {
  setconf binutils-$pkgver/libiberty/configure ac_cpp "'\$CPP \$CPPFLAGS -O2'"
}

build() {
  cd "binutils-$pkgver"

  unset CPPFLAGS
  ./configure \
    --disable-nls \
	--disable-gprofng \
	--enable-deterministic-archives \
    --enable-colored-disassembly \
    --enable-default-execstack=no \
    --enable-gold \
    --enable-ld=default \
    --enable-new-dtags \
    --enable-multilib \
    --enable-plugins \
    --prefix=/usr \
	--sysconfdir="${pkgdir}"/etc \
    --target=$_target \
    --with-gnu-as \
    --with-gnu-ld \
    --with-sysroot=/usr/$_target \
    --with-system-zlib
  make -O
  make all-{libiberty,bfd}
  cd ../
  # in case elf2flat doesn't support the new binutils, check how the first version did it
  binutilsdir="binutils-2.43"
  e2futils="binutils-elf2flt"
  mkdir -p "${e2futils}"/{bfd,include/elf,libiberty}
  cp "${binutilsdir}"/bfd/bfd.h "${binutilsdir}/bfd/.libs/libbfd.a" "${e2futils}"/bfd/
  cp "${binutilsdir}/libiberty/libiberty.a" "${e2futils}"/libiberty/
  cp "${binutilsdir}"/include/{ansidecl,filenames,hashtab,libiberty,symcat}.h "${e2futils}"/include/
  cp "${binutilsdir}"/include/diagnostics.h "${e2futils}"/include/
  cp "${binutilsdir}"/include/elf/{reloc-macros,riscv}.h "${e2futils}"/include/elf/

  cd elf2flt
  ./configure --target=$_target --with-binutils-build-dir=../"${e2futils}"
  make
}

#TODO: fix tests
# check() {
  # * Unset LDFLAGS as testsuite makes assumptions about which ones are active.
  # * Do not abort on errors - manually check log files.
  # make -O -C "binutils-$pkgver" LDFLAGS="" -k check
# }

package() {
  make -C "binutils-$pkgver" DESTDIR="$pkgdir" install

  # Remove info documents that conflict with host version
  rm -r "$pkgdir/usr/share/info"
  rm "$pkgdir"/usr/lib/bfd-plugins/libdep.so

  # Install elf2flt
  mv "$pkgdir/usr/$_target/bin/ld" "$pkgdir/usr/$_target/bin/ld.real"
  # mkdir "$pkgdir/usr/lib"
  cp "$srcdir/elf2flt/ld-elf2flt" "$pkgdir/usr/$_target/bin/ld"
  cp "$srcdir/elf2flt/elf2flt" "$pkgdir/usr/$_target/bin"
  cp "$srcdir/elf2flt/elf2flt.ld" "$pkgdir/usr/$_target/lib/"
}

# getver: gnu.org/software/binutils
