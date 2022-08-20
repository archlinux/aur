# Contributor: carstene1ns <arch carsten-teibes de>
# Contributor: felix <base64 -d <<< ZmVsaXgudm9uLnNAcG9zdGVvLmRlCg==>
# Contributor: janezz55

pkgname=dosbox-gcc
pkgver=12.2.0
_target="i586-pc-msdosdjgpp"
_djver=2.05
pkgrel=2
pkgdesc="djgpp cross-compiler for the dosbox environment"
arch=('i686' 'x86_64')
url="http://gcc.gnu.org"
license=('GPL' 'LGPL' 'FDL' 'custom')
groups=('djgpp')
depends=('zlib' 'libisl' 'libmpc' 'dosbox-binutils')
makedepends=('unzip' 'tar' 'xz')
optdepends=('dosbox-djcrx: headers and utilities')
options=('!strip' 'staticlibs' '!emptydirs')
source=("https://ftp.gnu.org/gnu/gcc/gcc-$pkgver/gcc-$pkgver.tar.xz"
        "ftp://www.delorie.com/pub/djgpp/current/v2/djcrx${_djver//./}.zip"
        "gcc-djgpp.diff"
        "lto.patch")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')
noextract=("gcc-$pkgver.tar.xz"
           "djcrx${_djver//./}.zip")

prepare() {
  tar Jxf gcc-$pkgver.tar.xz

  # gcc hacks
  cd $srcdir/gcc-$pkgver

  # build the lto plugin
  patch -Np0 < ../lto.patch

  # Other DJGPP related changes
  patch -Np1 < ../gcc-djgpp.diff

  # extract bootstrap djcrx
  mkdir -p ../gcc-build-$_target/lib/gcc/$_target/$pkgver
  cd ../gcc-build-$_target/lib/gcc/$_target/$pkgver
  unzip -qoW "$srcdir/djcrx${_djver//./}.zip" 'include/**' 'lib/*.[oa]'
  mv lib/* .
}

build() {
  cd gcc-build-$_target
  CPPFLAGS="$CPPFLAGS -Ofast" \
  ../gcc-$pkgver/configure \
    --prefix=/usr \
    --libexecdir=/usr/lib \
    --datarootdir=/usr/$_target/share \
    --target="$_target" \
    --with-arch=i586 \
    --with-cpu=i586 \
    --with-isl \
    --with-system-zlib \
    --disable-decimal-float \
    --disable-gcov \
    --disable-install-libiberty \
    --disable-libssp \
    --disable-libquadmath \
    --disable-libquadmath-support \
    --disable-libgomp \
    --disable-libsanitizer \
    --disable-multilib \
    --disable-nls \
    --disable-plugin \
    --enable-compressed-debug-sections=all \
    --enable-gold=yes \
    --enable-languages=c,c++ \
    --enable-ld=no \
    --enable-lto \
    --enable-shared \
    --enable-static \
    --disable-threads \
    --disable-libstdcxx-pch \
    --disable-libstdcxx-threads \
    --enable-cxx-flags="-O3 -fno-plt" \
    --enable-libstdcxx-filesystem-ts \
    --enable-libstdcxx-time=no \
    --enable-checking=release
  make all-gcc

  cd $srcdir/gcc-build-$_target
  ac_cv_func_dlopen=no \
  ac_cv_func_shl_load=no \
  ac_cv_lib_dld_shl_load=no \
  ac_cv_lib_dl_dlopen=no \
  ac_cv_lib_svld_dlopen=no \
  ac_cv_lib_dld_dld_link=no \
  make all
}

package_dosbox-gcc() {
  echo ...installing
  make -C gcc-build-$_target DESTDIR=$pkgdir/ install

  # strip manually, djgpp libs spew errors otherwise
  strip -s $pkgdir/usr/bin/$_target-* $pkgdir/usr/lib/gcc/$_target/$pkgver/{cc1*,collect2,lto*}

  # for compatibility
  ln -sf $_target-gcc $pkgdir/usr/bin/$_target-cc

  # remove unnecessary files
  rm -rf $pkgdir/usr/$_target/share/{man,info,locale,gcc-$pkgver/python}
  rm -rf $pkgdir/usr/share/{man,info,locale}
  rm -rf $pkgdir/usr/lib/gcc/$_target/$pkgver/include-fixed
  rm -f $pkgdir/usr/lib/libcc1.*
}
