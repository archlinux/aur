# Contributor: carstene1ns <arch carsten-teibes de>
# Contributor: felix <base64 -d <<< ZmVsaXgudm9uLnNAcG9zdGVvLmRlCg==>
# Contributor: janezz55

pkgname=dosbox-binutils
pkgver=2.35
pkgrel=8
pkgdesc="binutils for the djgpp dosbox cross-compiler"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/binutils"
license=('GPL')
groups=('djgpp')
depends=('zlib' 'patch')
options=('!libtool' '!emptydirs')
source=("http://ftp.gnu.org/gnu/binutils/binutils-$pkgver.tar.xz"
      	"binutils-bfd-djgpp.patch"
	      "binutils-djgpp.patch")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')
_target="i586-pc-msdosdjgpp"

prepare() {
  cd binutils-$pkgver
  patch -Np1 <${srcdir}/binutils-djgpp.patch
  patch -Np1 <${srcdir}/binutils-bfd-djgpp.patch
}

build() {
  mkdir -p binutils-$_target
  cd binutils-$_target
  CPPFLAGS="$CPPFLAGS -Ofast" \
  ../binutils-$pkgver/configure \
    --prefix=/usr \
    --target="$_target" \
    --infodir="/usr/share/info/$_target" \
    --datadir="/usr/$_target/share" \
    --disable-install-libiberty \
    --disable-multilib \
    --disable-nls \
    --disable-plugins \
    --disable-werror \
    --enable-lto
  make
}

package() {
  make -C binutils-$_target DESTDIR="$pkgdir/" install
  rm -rf $pkgdir/usr/share/{man,info}
}
