# Maintainer: Andris Pavenis <andris.pavenis iki fi>
# Maintainer: carstene1ns <arch carsten-teibes de>
# Contributor: felix <base64 -d <<< ZmVsaXgudm9uLnNAcG9zdGVvLmRlCg==>

pkgname=djgpp-gcc
pkgver=14.2.0
_target="i686-pc-msdosdjgpp"
_djver=2.05
_build_ada=no
pkgrel=1
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
sha256sums=('a7b39bc69cbf9e25826c5a60ab26477001f7c08d85cec04bc0e29cabed6f3cc9'
            'c03dbd61274e1ce14f84366abf348d75779bbd6e0bc32b9f4fd74f1ce54a5ef0'
            'b25fb12b24009497700b196dc32b6d2d9047ef89fd0126f99cb50e214158726b')

prepare() {
  cd gcc-$pkgver

  # build the lto plugin
  patch -Np0 < ../lto.patch

  # Other DJGPP related changes
  patch -Np1 < ../gcc-djgpp.diff
}

build() {
  #############################################################################################
  # pacman 6.1.0-3 has broken support of MAKFLAGS when options list contains '!buildflags
  # Look https://gitlab.archlinux.org/archlinux/packaging/packages/pacman/-/issues/25 for details
  # (2024/08/17) Still no new version after the problem was detected
  # Try to restore MAKEFLAGS from /etc/makepkg.conf
  export MAKEFLAGS=$( (grep -e ^MAKEFLAGS /etc/makepkg.conf; echo 'echo ${MAKEFLAGS}' ) | /bin/sh )
  #############################################################################################
  export CPPFLAGS="$CPPFLAGS -O2"
  echo MAKEFLAGS=$MAKEFLAGS
  rm -rf gcc-build-native gcc-install-native gcc-build-$_target
  if [ "$_build_ada" == "yes" ] ; then
     _bootstrap_languages=c,c++,ada
     _build_languages=c,c++,fortran,objc,obj-c++,ada,m2
  else
     _bootstrap_languages=c,c++
     _build_languages=c,c++,fortran,objc,obj-c++,m2
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
