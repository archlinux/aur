# Maintainer: Andris Pavenis <andris dot pavenis iki fi>
# Maintainer: carstene1ns <arch carsten-teibes de>
# Contributor: felix <base64 -d <<< ZmVsaXgudm9uLnNAcG9zdGVvLmRlCg==>

pkgname=djgpp-binutils
pkgver=2.29.1
pkgrel=1
pkgdesc="Binutils for the djgpp cross-compiler"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/binutils"
license=('GPL3')
groups=('djgpp')
options=('!libtool' '!emptydirs')
source=("http://ftp.gnu.org/gnu/binutils/binutils-${pkgver}.tar.xz"
	"http://ftp.gnu.org/gnu/binutils/binutils-${pkgver}.tar.xz.sig"
	"binutils-bfd-djgpp.patch"
	"binutils-djgpp.patch"
	"lto-discard.patch")
sha256sums=('e7010a46969f9d3e53b650a518663f98a5dde3c3ae21b7d71e5e6803bc36b577'
            'SKIP'
            '1204757839cfd97383151bfa67f10e04173ad4c70559ba3544e3f629052b8ebe'
            'a8a478da13137d2995dd67d24194f68c7499cf1fe7ab7ef5b686856ce484ee13'
            '358cab5b397662718260f41c8a4139c97676600fa5ef9f3aa699bfe27606c434')
validpgpkeys=(3A24BC1E8FB409FA9F14371813FCEF89DD9E3C4F)
_target="i686-pc-msdosdjgpp"

prepare() {
  cd binutils-${pkgver}

  # Apply DJGPP related patches from
  # ftp://ftp.delorie.com/pub/djgpp/current/v2gnu/bnu2291s.zip
  patch -Np1 <${srcdir}/binutils-djgpp.patch
  patch -Np1 <${srcdir}/binutils-bfd-djgpp.patch
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
