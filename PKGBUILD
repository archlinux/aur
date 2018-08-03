# Maintainer: Andris Pavenis <andris dot pavenis iki fi>
# Maintainer: carstene1ns <arch carsten-teibes de>
# Contributor: felix <base64 -d <<< ZmVsaXgudm9uLnNAcG9zdGVvLmRlCg==>

pkgname=djgpp-binutils
pkgver=2.31.1
pkgrel=1
pkgdesc="Binutils for the djgpp cross-compiler"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/binutils"
license=('GPL3')
groups=('djgpp')
options=('!libtool' '!emptydirs')
source=("http://ftp.gnu.org/gnu/binutils/binutils-${pkgver}.tar.xz"
	"binutils-bfd-djgpp.patch"
	"binutils-djgpp.patch"
	"lto-discard.patch")
sha256sums=('5d20086ecf5752cc7d9134246e9588fa201740d540f7eb84d795b1f7a93bca86'
            '13cc73a6042515c16ddfa2e6277d09a0c1de7a33fdb1a106f61ee0bbd665014a'
            'e968d8630825bed104d9f9b3c5ffe565ab858c5835acdc96f50ed0fccaf9f08a'
            '358cab5b397662718260f41c8a4139c97676600fa5ef9f3aa699bfe27606c434')
_target="i686-pc-msdosdjgpp"

prepare() {
  cd binutils-${pkgver}

  # Apply DJGPP related patches from
  # ftp://ftp.delorie.com/pub/djgpp/current/v2gnu/bnu2311s.zip
  patch -Np1 <${srcdir}/binutils-djgpp.patch
  patch -Np1 <${srcdir}/binutils-bfd-djgpp.patch
  #
  patch -Np2 <${srcdir}/lto-discard.patch
}

build() {
  mkdir -p binutils-$_target

  cd binutils-$_target
  export CPPFLAGS="$CPPFLAGS -O2"
  ../binutils-${pkgver}/configure --prefix=/usr \
    --target=$_target \
    --infodir="/usr/share/info/$_target" \
    --datadir="/usr/$_target/share" \
    --enable-lto --disable-nls \
    --disable-install-libiberty \
    --disable-multilib --disable-nls \
    --disable-werror
  make
}

package() {
    make -C binutils-${_target} DESTDIR=${pkgdir} install
}
