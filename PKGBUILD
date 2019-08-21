# Maintainer: Andris Pavenis <andris dot pavenis iki fi>
# Maintainer: carstene1ns <arch carsten-teibes de>
# Contributor: felix <base64 -d <<< ZmVsaXgudm9uLnNAcG9zdGVvLmRlCg==>

pkgname=djgpp-binutils
pkgver=2.32
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
sha256sums=('0ab6c55dd86a92ed561972ba15b9b70a8b9f75557f896446c82e8b36e473ee04'
            'd5d0f706d44abf4de1a578c27268522bdda9c91b146d2a8fa506f5fec97bee8a'
            '98716ca9092784e5b44f54134031e1411274f961d2a6b0bfeb702ad97de7c5bc'
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
