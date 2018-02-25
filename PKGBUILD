# Maintainer: Andris Pavenis <andris dot pavenis iki fi>
# Maintainer: carstene1ns <arch carsten-teibes de>
# Contributor: felix <base64 -d <<< ZmVsaXgudm9uLnNAcG9zdGVvLmRlCg==>

pkgname=djgpp-binutils
pkgver=2.30
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
sha256sums=('6e46b8aeae2f727a36f0bd9505e405768a72218f1796f0d09757d45209871ae6'
            '81d5e555e52f84f7006ba7e8a888eff9a9590f2e20377396ed143581c723a799'
            '2ece4649f6bf938945db4d40ce5aa8ce4cf0c7be138af8373daa0220c4936afe'
            '358cab5b397662718260f41c8a4139c97676600fa5ef9f3aa699bfe27606c434')
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
