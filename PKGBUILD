# Maintainer: Andris Pavenis <andris.pavenis iki fi>
# Maintainer: carstene1ns <arch carsten-teibes de>
# Contributor: felix <base64 -d <<< ZmVsaXgudm9uLnNAcG9zdGVvLmRlCg==>

pkgname=djgpp-gcc
pkgver=12.2.0
_target="i686-pc-msdosdjgpp"
_djver=2.05
_build_ada=no
pkgrel=2
pkgdesc="GCC for the djgpp cross-compiler"
arch=('i686' 'x86_64')
url="http://gcc.gnu.org"
license=('GPL3' 'LGPL3')
groups=('djgpp')
depends=('zlib' 'libmpc' 'libisl' 'djgpp-binutils>=2.30' 'djgpp-djcrx' 'gcc-ada')
makedepends=('unzip')
optdepends=('djgpp-djcrx: headers and utilities')
optdepends+=('djgpp-djcrx-bootstrap: first build of djgpp-gcc before djgpp-djcrx is built')
options=('!strip' 'staticlibs' '!emptydirs' '!buildflags')
source=("https://ftp.gnu.org/gnu/gcc/gcc-$pkgver/gcc-$pkgver.tar.xz"
        "lto.patch"
	"gcc-djgpp.diff")
sha256sums=('e549cf9cf3594a00e27b6589d4322d70e0720cdd213f39beb4181e06926230ff'
            'c03dbd61274e1ce14f84366abf348d75779bbd6e0bc32b9f4fd74f1ce54a5ef0'
            '0c93c245f791d638cd775b00f9919873b229a4dda04a7a4072735d12d47737ce')

prepare() {
  cd gcc-$pkgver

  # build the lto plugin
  patch -Np0 < ../lto.patch

  # Other DJGPP related changes
  patch -Np1 < ../gcc-djgpp.diff
}

build() {
  export CPPFLAGS="$CPPFLAGS -O2"
  rm -rf gcc-build-native gcc-install-native gcc-build-$_target
  if [ "$_build_ada" == "yes" ] ; then
     _bootstrap_languages=c,c++,ada
     _build_languages=c,c++,fortran,objc,obj-c++,ada
  else
     _bootstrap_languages=c,c++
     _build_languages=c,c++,fortran,objc,obj-c++
  fi
  if [ "$(gcc -dumpversion | sed -e 's:\..*::')" != "$(echo $pkgver | sed -e 's:\..*::')" ] ; then
     echo "Different GCC major version: building native compiler at first"
     mkdir -p gcc-build-native
     _tmpinst=$(pwd)/gcc-install-native
     mkdir -p ${_tmpinst}
     cd gcc-build-native
     ../gcc-$pkgver/configure --prefix=${_tmpinst} --enable-languages=${_bootstrap_languages} --disable-multilib --enable-__cxa_atexit --disable-plugin --disable-libsanitizer
     make bootstrap
     make install
     cd ..
     export PATH=${_tmpinst}/bin:$PATH
  fi
  mkdir gcc-build-$_target
  test "$(gcc -dumpversion | sed -e 's:\..*::')" == "$(echo $pkgver | sed -e 's:\..*::')" || exit 1
  cd gcc-build-$_target
  ../gcc-$pkgver/configure --prefix=/usr --libexecdir=/usr/lib \
    --target="$_target" \
    --enable-languages=${_build_languages} \
    --enable-shared --enable-static \
    --enable-threads=no --with-system-zlib --with-isl \
    --enable-lto --disable-libgomp \
    --disable-multilib --enable-checking=release \
    --disable-libstdcxx-pch \
    --enable-libstdcxx-filesystem-ts \
    --disable-install-libiberty
  make all
}

package_djgpp-gcc() {
  make -C gcc-build-$_target DESTDIR="$pkgdir/" install

  # strip manually, djgpp libs spew errors otherwise
  for fn in cc1 cc1plus cc1obj cc1objplus f951 lto1 lto-wrapper gnat1; do
    file=$pkgdir/usr/lib/gcc/$_target/$pkgver/$fn
    if [ -f $file ] ; then strip $file; else echo $file not found; fi
  done

  ${_target}-strip -v -g $pkgdir/usr/lib/gcc/i686-pc-msdosdjgpp/$pkgver/*.a
  ${_target}-strip -v -g $pkgdir/usr/i686-pc-msdosdjgpp/lib/*.a

  # for compatibility
  ln -s $_target-gcc "$pkgdir"/usr/bin/$_target-cc

  # remove unnecessary files
  rm -rf "$pkgdir"/usr/share/{man/man7,info,locale}
  rm -rf "$pkgdir"/usr/share/gcc-$pkgver/python
  rm -rf "$pkgdir"/usr/lib/gcc/$_target/$pkgver/include-fixed
  rm -f "$pkgdir"/usr/lib*/libcc1.*
}
