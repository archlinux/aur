# Contributor: carstene1ns <arch carsten-teibes de>
# Contributor: felix <base64 -d <<< ZmVsaXgudm9uLnNAcG9zdGVvLmRlCg==>
# Contributor: janezz55

pkgname=dosbox-gcc
pkgver=7.2.0
_target="i586-pc-msdosdjgpp"
_islver=0.18
_djver=2.05
_zlver=1.2.11
pkgrel=1
pkgdesc="djgpp cross-compiler for the dosbox environment"
arch=('i686' 'x86_64')
url="http://gcc.gnu.org"
license=('GPL' 'LGPL' 'FDL' 'custom')
groups=('djgpp')
depends=('zlib' 'libmpc' 'dosbox-binutils')
makedepends=('unzip')
optdepends=('dosbox-djcrx: headers and utilities')
options=('!strip' 'staticlibs' '!emptydirs')
source=("https://ftp.gnu.org/gnu/gcc/gcc-${pkgver}/gcc-$pkgver.tar.xz"
        "http://www.delorie.com/pub/djgpp/current/v2/djcrx${_djver//./}.zip"
        "http://isl.gforge.inria.fr/isl-${_islver}.tar.xz"
        "https://zlib.net/zlib-${_zlver}.tar.gz"
        "lto.patch")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'c03dbd61274e1ce14f84366abf348d75779bbd6e0bc32b9f4fd74f1ce54a5ef0')
noextract=("djcrx${_djver//./}.zip")

prepare() {
  cd gcc-$pkgver

  # link isl for in-tree build
  ln -fs "../isl-${_islver}" isl

  # build the lto plugin
  patch -Np0 < ../lto.patch

  # extract bootstrap djcrx
  mkdir -p ../gcc-build-$_target/lib/gcc/$_target/$pkgver
  cd ../gcc-build-${_target}/lib/gcc/$_target/$pkgver
  unzip -qoW "$srcdir/djcrx${_djver//./}.zip" 'include/**' 'lib/*.[oa]'
  mv lib/* .
  # ???
  ln -fs /bin/true stubify

  # monkeypatch libc to prepare for building without an ldscript
  echo '.comm __environ,16' > environ.s
  i586-pc-msdosdjgpp-as environ.s -o environ.o
  i586-pc-msdosdjgpp-ar q libc.a environ.o
}

build() {
  cd gcc-build-$_target
  ../gcc-$pkgver/configure --prefix=/usr --libexecdir=/usr/lib \
    --target="$_target" \
    --enable-languages=c,c++ \
    --enable-shared --enable-static \
    --enable-threads=no \
    --enable-libstdcxx-threads \
    --with-system-zlib --with-isl \
    --enable-lto --disable-dw2-exceptions --disable-libgomp \
    --disable-multilib --enable-checking=release
  make all-gcc

  export PATH=../gcc-build-$_target/gcc:$PATH

  # build zlib
  cd ../zlib-${_zlver}
  CC=../gcc-build-$_target/gcc/xgcc \
  CHOST=${_target} \
  CFLAGS="-march=i586 -Ofast -I../gcc-build-${_target}/lib/gcc/$_target/$pkgver/include -pipe"\
  ../zlib-${_zlver}/configure --const --prefix=/usr/$_target --static
  sed -i 's/-DNO_STRERROR -DNO_vsnprintf//' Makefile
  make libz.a

  # build wattcp
  # build pth

  cd ../gcc-build-$_target
  make all
}

package_dosbox-gcc() {
  make -C gcc-build-$_target DESTDIR="$pkgdir/" install
  make -C zlib-${_zlver} DESTDIR="$pkgdir/" install

  # strip manually, djgpp libs spew errors otherwise
  strip -s "$pkgdir"/usr/bin/$_target-*
  strip -s "$pkgdir"/usr/lib/gcc/$_target/$pkgver/{cc1*,collect2,lto*}

  # for compatibility
  ln -s $_target-gcc "$pkgdir"/usr/bin/$_target-cc

  # remove unnecessary files
  rm -rf "$pkgdir"/usr/$_target/share/{man,info,locale}
  rm -rf "$pkgdir"/usr/share/{man,info,locale}
  rm -rf "$pkgdir"/usr/lib/gcc/$_target/$pkgver/include-fixed
  rm -f "$pkgdir"/usr/lib/libcc1.*
}
