# Maintainer: Danila Kiver <danila.kiver@mail.ru>
# Contributor: Tavian Barnes <tavianator@tavianator.com>

pkgname=java13-openjdk-hsdis
_java_major=13
_java_minor=0
_java_patch=2
_java_build=8
_binutils_ver=2.34
pkgver=${_java_major}.${_java_minor}.${_java_patch}
_repo_ver=jdk-${_java_major}.${_java_minor}.${_java_patch}+${_java_build}
pkgrel=2
pkgdesc="Disassembler for HotSpot"
arch=('i686' 'x86_64')
url='http://openjdk.java.net/'
license=('GPL2')
_url_src=http://hg.openjdk.java.net/jdk-updates/jdk13u
source=(openjdk-${_repo_ver}.tar.gz::${_url_src}/archive/${_repo_ver}.tar.gz
        http://ftp.gnu.org/gnu/binutils/binutils-${_binutils_ver}.tar.bz2
        binutils-compat.patch)
sha256sums=('d38fb17795782dffe84e98f21f1d6293b0a45ea8f1e9c81e99cd71acac03a4e0'
            '89f010078b6cf69c23c27897d686055ab89b198dddf819efb0a4f2c38a0b36e6'
            'c1f416b131419c7f9ef565b04d2a55872a6fae91f1e21be7868938d6ed2fa1b6')

prepare() {
  cd "${srcdir}/binutils-${_binutils_ver}"

  # hack! - libiberty configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure

  cd "${srcdir}/jdk13u-${_repo_ver}/src/utils/hsdis"
  mkdir -p build
  ln -sf "${srcdir}/binutils-${_binutils_ver}" build/binutils

  # The upstream is currently stuck with binutils 2.31. This patch provides the
  # compatibility with least recent binutils versions. Remove it once the upstream
  # updates the binutils version in use.
  cd "${srcdir}/jdk13u-${_repo_ver}"
  patch -N -p 1 -i "${srcdir}/binutils-compat.patch"
}

build() {
  cd "${srcdir}/jdk13u-${_repo_ver}/src/utils/hsdis"

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
  cd "${srcdir}/jdk13u-${_repo_ver}/src/utils/hsdis"

  if [ "$CARCH" = "x86_64" ]; then
    install -D -m755 build/linux-amd64/hsdis-amd64.so "${pkgdir}/usr/lib/jvm/java-13-openjdk/lib/hsdis-amd64.so"
  else
    install -D -m755 build/linux-i586/hsdis-i586.so "${pkgdir}/usr/lib/jvm/java-13-openjdk/lib/hsdis-i586.so"
  fi
}
