# Contributor: carstene1ns <arch carsten-teibes de>
# Contributor: felix <base64 -d <<< ZmVsaXgudm9uLnNAcG9zdGVvLmRlCg==>
# Contributor: Schala
# Contributor: janezz55

pkgname=dosbox-djcrx
pkgver=2.05
pkgrel=25
libmver=0.8.1
pkgdesc="Headers and utilities for the djgpp dosbox cross-compiler"
arch=('i686' 'x86_64')
url="http://www.delorie.com/djgpp/"
depends=('glibc' 'gcc-libs')
license=('GPL' 'LGPL' 'custom:djgpp')
source=("ftp://www.delorie.com/pub/djgpp/current/v2/djcrx${pkgver//./}.zip"
        "ftp://www.delorie.com/pub/djgpp/current/v2/djlsr${pkgver//./}.zip"
        "https://github.com/JuliaMath/openlibm/archive/refs/tags/v${libmver}.zip"
        ttyscrn.patch
        nmemalign.patch
        fseeko64.patch
        asm.patch
        dxegen.patch
        djgpp-djcrx-gcccompat.patch)
makedepends=('dosbox-gcc' 'bison' 'sed')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')
options=('!buildflags' '!makeflags' '!strip')
_target='i586-pc-msdosdjgpp'

prepare() {
  # fix build with gcc >= 8 
  patch -Np1 < djgpp-djcrx-gcccompat.patch

  # gcc provides its own float.h which masks this one
  ln -fs float.h include/djfloat.h
  sed -i 's/<float\.h>/<djfloat.h>/' src/libc/{go32/dpmiexcp,emu387/npxsetup}.c src/utils/redir.c

  # fix libc bugs
  patch -Np0 < ttyscrn.patch
  patch -Np0 < nmemalign.patch
  patch -Np0 < fseeko64.patch
  patch -Np0 < asm.patch

  # allow using dxe3gen without DJDIR and without dxe3res in PATH
  patch -Np0 < dxegen.patch

  sed -i 's/ln/ln -f/' src/dxe/makefile.dxe
  sed -i 's/O2/O3/g;s/i[[:digit:]]86/i586/g;s/Werror/Wno-error/g' src/makefile src/makefile.cfg src/makefile.def src/dxe/makefile.dxe
  sed -i 's/-I$(GCC_INC_DIR)/-isystem$(GCC_INC_DIR)/' src/makefile.inc

  # be verbose
  #sed -i '/@$(MISC) echo - / d; s/^\t@/\t/' src/makefile.inc src/libc/makefile src/utils/makefile

  #
  sed -i 's/-std=c99/-std=gnu99/' openlibm-${libmver}/Make.inc
  sed -i 's/override ARCH := i387//' openlibm-${libmver}/Make.inc
  sed -i 's/ifneq ($(filter $(ARCH),i387 amd64/ifneq ($(filter $(ARCH),i586 amd64/' openlibm-${libmver}/Make.inc
  sed -i 's/SUBDIRS = src $(ARCH) bsdsrc/SUBDIRS = src bsdsrc/' openlibm-${libmver}/Makefile
  sed -i 's/ifneq ($(filter $(ARCH),i387 amd64),)/ifneq ($(filter $(ARCH),i586 amd64),)/' openlibm-${libmver}/Makefile
}

build() {
  cd openlibm-${libmver}
  make clean
  CC=${_target}-gcc make ARCH=i586 MARCH=i586 CFLAGS="-nostdinc -isystem$srcdir/include -s" libopenlibm.a
  mv libopenlibm.a ../lib/
  cp include/*.h ../include/
  cd ..

  cd src
  make clean
  make -j1

  cd dxe
  make -f makefile.dxe

  cd $srcdir/lib
  mv libopenlibm.a libm.a

  cd ../include
  rm -f math.h complex.h fenv.h libm/math.h
  ln -s openlibm_math.h math.h
  ln -s openlibm_math.h libm/math.h
  ln -s openlibm_complex.h complex.h
  ln -s openlibm_fenv.h fenv.h

  sed -i 's/\/\/typedef	__double_t	double_t/typedef	double	double_t/' math.h
  sed -i 's/\/\/typedef	__float_t	float_t/typedef	float	float_t/' math.h
}

package() {
  install -d $pkgdir/usr/bin
  install -d $pkgdir/usr/$_target/bin

  cp -r lib include $pkgdir/usr/$_target

  cd hostbin
  for _file in djasm mkdoc stubedit stubify; do
    install -m0755 $_file.exe $pkgdir/usr/$_target/bin/$_file
    ln -s ../$_target/bin/$_file $pkgdir/usr/bin/$_target-$_file
  done

  cd ../src/dxe
  for _file in dxe3gen dxe3res; do
    install -m0755 $_file $pkgdir/usr/$_target/bin/$_file
    ln -s ../$_target/bin/$_file $pkgdir/usr/bin/$_target-$_file
  done
  ln -s dxe3gen $pkgdir/usr/$_target/bin/dxegen

  cd $srcdir
  install -Dm644 copying.dj $pkgdir/usr/share/licenses/$pkgname/copying.dj

  #${_target}-strip -s $pkgdir/usr/$_target/lib/*.a
}
