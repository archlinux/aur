# Contributor: carstene1ns <arch carsten-teibes de>
# Contributor: felix <base64 -d <<< ZmVsaXgudm9uLnNAcG9zdGVvLmRlCg==>
# Contributor: janezz55

pkgname=dosbox-binutils
pkgver=2.31.1
pkgrel=1
pkgdesc="binutils for the djgpp dosbox cross-compiler"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/binutils"
license=('GPL')
groups=('djgpp')
depends=('zlib' 'patch')
options=('!libtool' '!emptydirs')
source=("http://ftp.gnu.org/gnu/binutils/binutils-$pkgver.tar.xz"
      	"binutils-bfd-djgpp.patch"
	      "binutils-djgpp.patch"
        "lto-discard.patch")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')
validpgpkeys=('EAF1C276A747E9ED86210CBAC3126D3B4AE55E93') # Tristan Gingold <adacore dot com, gingold>
_target="i586-pc-msdosdjgpp"

prepare() {
  cd binutils-$pkgver

  # hack! - libiberty configure tests for header files break with FORTIFY_SOURCE
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure

  patch -Np1 <${srcdir}/binutils-djgpp.patch
  patch -Np1 <${srcdir}/binutils-bfd-djgpp.patch
  patch -Np2 <${srcdir}/lto-discard.patch
}

build() {
  mkdir -p binutils-$_target

  export CPPFLAGS="$CPPFLAGS -Ofast"
  cd binutils-$_target
  ../binutils-$pkgver/configure --prefix=/usr \
    --target="$_target" \
    --infodir="/usr/share/info/$_target" \
    --datadir="/usr/$_target/share" \
    --enable-lto --enable-plugins \
    --disable-install-libiberty \
    --disable-multilib --disable-nls \
    --disable-werror
  make
}

package() {
  make -C binutils-$_target DESTDIR="$pkgdir/" install
}
