# Maintainer: Danila Kiver <danila.kiver@mail.ru>
# Contributor: Tavian Barnes <tavianator@tavianator.com>

pkgname=java14-openjdk-hsdis
_java_major=14
_java_minor=0
_java_patch=1
_java_build=7
_binutils_ver=2.34
pkgver=${_java_major}.${_java_minor}.${_java_patch}
_repo_ver=jdk-${_java_major}.${_java_minor}.${_java_patch}+${_java_build}
pkgrel=1
pkgdesc="Disassembler for HotSpot"
arch=('i686' 'x86_64')
url='http://openjdk.java.net/'
license=('GPL2')
_url_src=http://hg.openjdk.java.net/jdk-updates/jdk14u
source=(openjdk-${_repo_ver}.tar.gz::${_url_src}/archive/${_repo_ver}.tar.gz
        http://ftp.gnu.org/gnu/binutils/binutils-${_binutils_ver}.tar.bz2
        binutils-compat.patch)
sha256sums=('301203cbda9c40a5fc496b3299806995ac4833b39c6d2e8470fd85a35461afd4'
            '89f010078b6cf69c23c27897d686055ab89b198dddf819efb0a4f2c38a0b36e6'
            '3b1bd383cdfef4a6cfd9ed0dafeeee956670ad7fb797323f72e56bb7bc0cebaa')

prepare() {
  cd "${srcdir}/binutils-${_binutils_ver}"

  # hack! - libiberty configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure

  cd "${srcdir}/jdk14u-${_repo_ver}/src/utils/hsdis"
  mkdir -p build
  ln -sf "${srcdir}/binutils-${_binutils_ver}" build/binutils

  # The upstream is currently stuck with binutils 2.31. This patch provides the
  # compatibility with least recent binutils versions. Remove it once the upstream
  # updates the binutils version in use.
  cd "${srcdir}/jdk14u-${_repo_ver}"
  patch -N -p 1 -i "${srcdir}/binutils-compat.patch"
}

build() {
  cd "${srcdir}/jdk14u-${_repo_ver}/src/utils/hsdis"

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
  cd "${srcdir}/jdk14u-${_repo_ver}/src/utils/hsdis"

  if [ "$CARCH" = "x86_64" ]; then
    install -D -m755 build/linux-amd64/hsdis-amd64.so "${pkgdir}/usr/lib/jvm/java-14-openjdk/lib/hsdis-amd64.so"
  else
    install -D -m755 build/linux-i586/hsdis-i586.so "${pkgdir}/usr/lib/jvm/java-14-openjdk/lib/hsdis-i586.so"
  fi
}
