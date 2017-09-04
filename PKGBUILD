# Contributor: carstene1ns <arch carsten-teibes de>
# Contributor: felix <base64 -d <<< ZmVsaXgudm9uLnNAcG9zdGVvLmRlCg==>
# Contributor: Schala
# Contributor: janezz55

pkgname=dosbox-djcrx
pkgver=2.05
pkgrel=7
pkgdesc="Headers and utilities for the dosbox gcc cross-compiler"
arch=('i686' 'x86_64')
url="http://www.delorie.com/djgpp/"
depends=('glibc' 'gcc-libs')
license=('GPL' 'LGPL' 'custom:djgpp')
source=("http://www.delorie.com/pub/djgpp/current/v2/djcrx${pkgver//./}.zip"
        "http://www.delorie.com/pub/djgpp/current/v2/djlsr${pkgver//./}.zip"
        ttyscrn.patch
        nmemalign.patch
        fseeko64.patch
        asm.patch
        dxegen.patch
        gcc-no-werror.patch
        environ.c)
makedepends=('dosbox-gcc')
sha256sums=('22274ed8d5ee57cf7ccf161f5e1684fd1c0192068724a7d34e1bde168041ca60'
            '80690b6e44ff8bc6c6081fca1f4faeba1591c4490b76ef0ec8b35847baa5deea'
            '83bc02407566c0613c2eeb86d78f2968c11256dfc8d3c2805a5488540e059124'
            'ffdbab52eb13dde716fbcce54154f7c95644afd6333f4931b2cceeb95935c675'
            '536684b0152f7ad77b99bcc5ea535ca8339832399c4582b944ccd882e4b261a1'
            '693810c3242f4e23cdc55d3101281721da9407851e5d29459ad59405e534b916'
            '0debe0161e27aeb004e89a43915d6d77bcd07a5db2c67e2798568535fe9143f1'
            'e768d4f2ac8c5b2f21afd7a0dddfc1921377a6675ca099e78baffe9ecab081db'
            '4d5a1448a12fdcebc37578da8a29a1924f68495d4c27b75297ead8ac0542e816')
options=('!buildflags' '!strip')
_target='i586-pc-msdosdjgpp'

prepare() {
  sed -i "s/i586-pc-msdosdjgpp/$_target/" src/makefile.def src/dxe/makefile.dxe
  sed -i 's/ln/ln -f/' src/dxe/makefile.dxe

  # enable building without an ldscript
  ln -fs ../../../environ.c src/libc/crt0/environ.c
  sed -i '/dfinfo\.c/ a \
SRC += environ.c' src/libc/crt0/makefile

  # fix build with gcc > 6
  patch -Np0 < gcc-no-werror.patch

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

  # be verbose
  #sed -i '/@$(MISC) echo - / d; s/^\t@/\t/' src/makefile.inc src/libc/makefile src/utils/makefile
}

build() {
  cd src
  make clean
  make -j1

  cd dxe
  make -f makefile.dxe
}

package() {
  install -d "$pkgdir"/usr/bin
  install -d "$pkgdir"/usr/$_target/bin

  cp -r lib include "$pkgdir"/usr/$_target

  cd hostbin
  for _file in djasm mkdoc stubedit stubify; do
    install -m0755 $_file.exe "$pkgdir"/usr/$_target/bin/$_file
    ln -s ../$_target/bin/$_file "$pkgdir"/usr/bin/$_target-$_file
  done

  cd ../src/dxe
  for _file in dxe3gen dxe3res; do
    install -m0755 $_file "$pkgdir"/usr/$_target/bin/$_file
    ln -s ../$_target/bin/$_file "$pkgdir"/usr/bin/$_target-$_file
  done
  ln -s dxe3gen "$pkgdir"/usr/$_target/bin/dxegen

  cd "$srcdir"
  install -Dm644 copying.dj "$pkgdir"/usr/share/licenses/$pkgname/copying.dj

  cd info
  for _file in *.info; do
    install -Dm0644 $_file "$pkgdir"/usr/share/info/djgpp-$_file
  done
}
