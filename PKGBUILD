# Contributor: carstene1ns <arch carsten-teibes de>
# Contributor: felix <base64 -d <<< ZmVsaXgudm9uLnNAcG9zdGVvLmRlCg==>
# Contributos: janezz55

pkgname=dosbox-binutils
pkgver=2.29
pkgrel=1
pkgdesc="Binutils for the gcc dosbox cross-compiler"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/binutils"
license=('GPL')
groups=('djgpp')
depends=('zlib')
options=('!libtool' '!emptydirs')
source=("http://ftp.gnu.org/gnu/binutils/binutils-$pkgver.tar.bz2"
        "http://ftp.gnu.org/gnu/binutils/binutils-$pkgver.tar.bz2.sig"
        xtors.patch
        lto-discard.patch)
sha256sums=('29a29549869039aad75fdf507ac30366da5ad0b974fbff4a8e7148dbf4f40ebf'
            'SKIP'
            'a54efa3f29f14c938fedf29fb352d4f104e8c0ec065c74b0cd3f753fe3e9d4ef'
            'a7978c3110dbccde7290fb3517121f5cae427728c04e6fb76736f36857514ec9')
validpgpkeys=('EAF1C276A747E9ED86210CBAC3126D3B4AE55E93') # Tristan Gingold <adacore dot com, gingold>
_target="i586-pc-msdosdjgpp"

prepare() {
  cd binutils-$pkgver

  # do not install libiberty
  sed -i 's/install_to_$(INSTALL_DEST) //' libiberty/Makefile.in

  # hack! - libiberty configure tests for header files break with FORTIFY_SOURCE
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure

  # put .ctors and .dtors where they belong
  patch -Np1 < ../xtors.patch

  # discard LTO sections in coff-go32-exe files
  patch -Np1 < ../lto-discard.patch
}

build() {
  mkdir -p binutils-$_target

  cd binutils-$_target
  ../binutils-$pkgver/configure --prefix=/usr \
    --target="$_target" \
    --infodir="/usr/share/info/$_target" \
    --datadir="/usr/$_target/share" \
    --enable-lto --enable-plugins \
    --disable-multilib --disable-nls \
    --disable-werror
  make
}

package() {
  make -C binutils-$_target DESTDIR="$pkgdir/" install
}
