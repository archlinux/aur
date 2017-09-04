# Contributor: carstene1ns <arch carsten-teibes de>
# Contributor: felix <base64 -d <<< ZmVsaXgudm9uLnNAcG9zdGVvLmRlCg==>
# Contributor: janezz55

pkgname=dosbox-gcc
pkgver=7.2.0
_target="i586-pc-msdosdjgpp"
_islver=0.18
_djver=2.05
pkgrel=1
pkgdesc="gcc cross-compiler for the dosbox environment"
arch=('i686' 'x86_64')
url="http://gcc.gnu.org"
license=('GPL' 'LGPL' 'FDL' 'custom')
groups=('djgpp')
depends=('zlib' 'libmpc' 'dosbox-binutils')
makedepends=('unzip')
optdepends=('djgpp-djcrx: headers and utilities')
options=('!strip' 'staticlibs' '!emptydirs')
source=("https://ftp.gnu.org/gnu/gcc/gcc-$pkgver/gcc-$pkgver.tar.xz"
        "http://isl.gforge.inria.fr/isl-${_islver}.tar.bz2"
        "http://www.delorie.com/pub/djgpp/current/v2/djcrx${_djver//./}.zip"
        "lto.patch")
sha256sums=('1cf7adf8ff4b5aa49041c8734bbcf1ad18cc4c94d0029aae0f4e48841088479a'
            '6b8b0fd7f81d0a957beb3679c81bbb34ccc7568d5682844d8924424a0dadcb1b'
            '22274ed8d5ee57cf7ccf161f5e1684fd1c0192068724a7d34e1bde168041ca60'
            'c03dbd61274e1ce14f84366abf348d75779bbd6e0bc32b9f4fd74f1ce54a5ef0')
noextract=("djcrx${_djver//./}.zip")

prepare() {
  cd gcc-$pkgver

  # link isl for in-tree build
  ln -fs "../isl-${_islver}" isl

  # hack! - some configure tests for header files break with FORTIFY_SOURCE
  sed -i "/ac_cpp=/ s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,gcc}/configure

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
    --enable-threads \
    --enable-libstdcxx-threads \
    --with-system-zlib --with-isl \
    --enable-lto --disable-dw2-exceptions --disable-libgomp \
    --disable-multilib --enable-checking=release
  make all
}

package_djgpp-gcc() {
  make -C gcc-build-$_target DESTDIR="$pkgdir/" install

  # strip manually, djgpp libs spew errors otherwise
  strip "$pkgdir"/usr/bin/$_target-*
  strip "$pkgdir"/usr/lib/gcc/$_target/$pkgver/{cc1*,collect2,lto*}

  # for compatibility
  ln -s $_target-gcc "$pkgdir"/usr/bin/$_target-cc

  # remove unnecessary files
  rm -rf "$pkgdir"/usr/share/{man/man7,info,locale}
  rm -rf "$pkgdir"/usr/lib/gcc/$_target/$pkgver/include-fixed
  rm -f "$pkgdir"/usr/lib/libcc1.*
}
