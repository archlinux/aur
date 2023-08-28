# Maintainer: Jaap Aarts <jaap.aarts1@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Emil Renner Berthing <aur@esmil.dk>

_target=riscv64-linux-uclibc
pkgname=$_target-binutils
pkgver=2.39
pkgrel=1
pkgdesc='Assemble and manipulate binary and object files for 32-bit and 64-bit RISC-V'
arch=(x86_64)
url='https://gnu.org/software/binutils/'
license=(GPL)
groups=(risc-v)
depends=(libelf)
makedepends=(setconf)
source=("https://ftp.gnu.org/gnu/binutils/binutils-$pkgver.tar.xz"
        "https://ftp.gnu.org/gnu/binutils/binutils-2.33.1.tar.xz"
        "git+https://github.com/floatious/elf2flt.git#commit=a8c9f650b82109abf7aa730f298ea5182ed62613")
sha512sums=("68e038f339a8c21faa19a57bbc447a51c817f47c2e06d740847c6e9cc3396c025d35d5369fa8c3f8b70414757c89f0e577939ddc0d70f283182504920f53b0a3"
            "b7a6767c6c7ca6b5cafa7080e6820b7bb3a53b7148348c438d99905defbdf0d30c9744a484ee01c9441a8153901808513366b15ba9533e20c9673c262ade36ac"
            "SKIP")

prepare() {
  setconf binutils-$pkgver/libiberty/configure ac_cpp "'\$CPP \$CPPFLAGS -O2'"
}

build() {
  cd "binutils-$pkgver"

  unset CPPFLAGS
  ./configure \
    --disable-nls \
    --enable-deterministic-archives \
    --enable-gold \
    --enable-ld=default \
    --enable-multilib \
    --enable-plugins \
    --prefix=/usr \
    --target=$_target \
    --with-gnu-as \
    --with-gnu-ld \
    --with-sysroot=/usr/$_target \
    --with-system-zlib
  make -O
  binutilsdir="binutils-2.33.1"
  cd ../"$binutilsdir"
  ./configure \
		--disable-werror \
		--disable-nls \
		--without-zlib \
		--disable-shared \
		--enable-static \
		--disable-plugins \
    --target=$_target
  make all-{libiberty,bfd}
  cd ../
  e2futils="binutils-elf2flt"
  mkdir -p "${e2futils}"/{bfd,include/elf,libiberty}
  cp "${binutilsdir}"/bfd/{bfd,bfd_stdint}.h "${binutilsdir}/bfd/libbfd.a" "${e2futils}"/bfd/
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
