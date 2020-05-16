# Maintainer: Andris Pavenis <andris dot pavenis iki fi>
# Maintainer: carstene1ns <arch carsten-teibes de>
# Contributor: felix <base64 -d <<< ZmVsaXgudm9uLnNAcG9zdGVvLmRlCg==>

pkgname=djgpp-binutils
pkgver=2.34
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
sha256sums=('f00b0e8803dc9bab1e2165bd568528135be734df3fabf8d0161828cd56028952'
            '1c2000eab25c4f4c3d9962ea4b32a7f0067c23478980c1b73663f237929ad036'
            '1c786d5e7a313533ec2b54fc56248bcfceb64f5231ef7722a84524f8ce11ead3'
            '4cd5c23535918d19579533a027a643e4caaf5fc43563beb74c2d6b4dfd5ca768')
_target="i686-pc-msdosdjgpp"

prepare() {
  cd binutils-${pkgver}

  # Apply DJGPP related patches from
  # ftp://ftp.delorie.com/pub/djgpp/current/v2gnu/bnu234s.zip
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
