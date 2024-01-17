# Maintainer: Danila Kiver <danila.kiver@mail.ru>
# Contributor: Tavian Barnes <tavianator@tavianator.com>

pkgname=java17-openjdk-hsdis
_major_ver=17
_minor_ver=0
_patch_ver=10
_update_ver=7
_git_tag=jdk-${_major_ver}.${_minor_ver}.${_patch_ver}+${_update_ver}
_binutils_ver=2.34
pkgver=${_major_ver}.${_minor_ver}.${_patch_ver}.u${_update_ver}
pkgrel=1
pkgdesc="Disassembler for HotSpot"
arch=('i686' 'x86_64')
url='http://openjdk.java.net/'
license=('GPL2')
source=(https://github.com/openjdk/jdk${_major_ver}u/archive/${_git_tag}.tar.gz
        http://ftp.gnu.org/gnu/binutils/binutils-${_binutils_ver}.tar.bz2)
sha256sums=('a310a8666d2d7770a7b29fe4750c275b9b33a07bfcc925348040a8bca745c874'
            '89f010078b6cf69c23c27897d686055ab89b198dddf819efb0a4f2c38a0b36e6')

_jdk_src_root=jdk${_major_ver}u-jdk-${_major_ver}.${_minor_ver}.${_patch_ver}-${_update_ver}
_hsdis_src_root=${_jdk_src_root}/src/utils/hsdis

prepare() {
  cd "${srcdir}/binutils-${_binutils_ver}"

  # hack! - libiberty configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure

  cd "${srcdir}/${_hsdis_src_root}"
  mkdir -p build
  ln -sf "${srcdir}/binutils-${_binutils_ver}" build/binutils
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

  install -D -m755 build/linux-amd64/hsdis-amd64.so "${pkgdir}/usr/lib/jvm/java-17-openjdk/lib/hsdis-amd64.so"
}
