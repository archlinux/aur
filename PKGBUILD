# Maintainer: Danila Kiver <danila.kiver@mail.ru>
# Contributor: Tavian Barnes <tavianator@tavianator.com>

pkgname=java8-openjdk-hsdis
_java_ver=8
_jdk_update=402
_jdk_build=06
_binutils_ver=2.34
pkgver=${_java_ver}.u${_jdk_update}
pkgrel=1
pkgdesc="Disassembler for HotSpot"
arch=('i686' 'x86_64')
url='http://openjdk.java.net/'
license=('GPL2')
source=(https://github.com/openjdk/jdk${_java_ver}u/archive/refs/tags/jdk${_java_ver}u${_jdk_update}-b${_jdk_build}.tar.gz
        http://ftp.gnu.org/gnu/binutils/binutils-${_binutils_ver}.tar.bz2
        binutils-compat.patch)
sha256sums=('8bad7ce8ab8bef779d5cb3d60e04dc676ef840a9f6cf955e4bdb323aa3c0ea79'
            '89f010078b6cf69c23c27897d686055ab89b198dddf819efb0a4f2c38a0b36e6'
            '1ce6f6dccf01aa7172f2a600384244ac7bc91a9cf1bcaa0a9d4e453c775357f5')

_hs_src_root=jdk${_java_ver}u-jdk${_java_ver}u${_jdk_update}-b${_jdk_build}/hotspot
_hsdis_src_root=${_hs_src_root}/src/share/tools/hsdis

prepare() {
  cd "${srcdir}/binutils-${_binutils_ver}"

  # hack! - libiberty configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure

  cd "${srcdir}/${_hsdis_src_root}"
  mkdir -p build
  ln -sf "${srcdir}/binutils-${_binutils_ver}" build/binutils

  # The upstream is currently stuck with binutils 2.31. This patch provides the
  # compatibility with least recent binutils versions. Remove it once the upstream
  # updates the binutils version in use.
  #
  # See also: hotspot/src/share/tools/hsdis/README in JDK source tree.
  cd "${srcdir}/${_hs_src_root}"
  patch -N -p 1 -i "${srcdir}/binutils-compat.patch"
}

build() {
  cd "${srcdir}/${_hsdis_src_root}"

  if [ "$CARCH" = "x86_64" ]; then
    mkdir -p build/linux-amd64
    cd build/linux-amd64
  else
    mkdir -p build/linux-i586
    cd build/linux-i586
  fi

  ../binutils/configure --prefix=/usr \
    --with-lib-path=/usr/lib:/usr/local/lib \
    --with-bugurl=https://bugs.archlinux.org/ \
    --enable-threads --enable-shared --with-pic \
    --enable-ld=default --enable-gold --enable-plugins \
    --disable-werror --disable-gdb --disable-nls \
    CFLAGS="$CFLAGS -fPIC"
  make all-opcodes

  cd ../..

  if [ "$CARCH" = "x86_64" ]; then
    make all LP64=1
  else
    make all
  fi
}

package() {
  cd "${srcdir}/${_hsdis_src_root}"

  if [ "$CARCH" = "x86_64" ]; then
    install -D -m755 build/linux-amd64/hsdis-amd64.so "${pkgdir}/usr/lib/jvm/java-8-openjdk/jre/lib/amd64/hsdis-amd64.so"
  else
    install -D -m755 build/linux-i586/hsdis-i586.so "${pkgdir}/usr/lib/jvm/java-8-openjdk/jre/lib/i586/hsdis-i586.so"
  fi
}
