# Maintainer: Tavian Barnes <tavianator@tavianator.com>
pkgname=java8-openjdk-hsdis
_java_ver=8
_jdk_update=45
_jdk_build=14
pkgver=${_java_ver}.u${_jdk_update}
_repo_ver=jdk${_java_ver}u${_jdk_update}-b${_jdk_build}
_binutils_commit=69352378
pkgrel=1
pkgdesc="Disassembler for HotSpot"
arch=('i686' 'x86_64')
url='http://openjdk.java.net/'
license=('GPL2')
_url_src=http://hg.openjdk.java.net/jdk8u/jdk8u
source=(hotspot-${_repo_ver}.tar.gz::${_url_src}/hotspot/archive/${_repo_ver}.tar.gz
        git://sourceware.org/git/binutils-gdb.git#commit=${_binutils_commit}
        binutils-e9c1bdad.patch)
sha256sums=('1dc7c5038f57f77a1e92cf1b48a188a0291805e69f570e1164efb7adb34c5a59'
            'SKIP'
            '4dc13852d61825aa59b7436ae41c449d181e5a66b355b6ca69604e4da3e03699')

prepare() {
  cd "${srcdir}/binutils-gdb"

  # https://sourceware.org/bugzilla/show_bug.cgi?id=16992
  patch -p1 -i "${srcdir}/binutils-e9c1bdad.patch"

  # hack! - libiberty configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure

  cd "${srcdir}/hotspot-${_repo_ver}/src/share/tools/hsdis"
  mkdir -p build
  ln -sf "${srcdir}/binutils-gdb" build/binutils
}

build() {
  cd "${srcdir}/hotspot-${_repo_ver}/src/share/tools/hsdis"

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
  cd "${srcdir}/hotspot-${_repo_ver}/src/share/tools/hsdis"

  if [ "$CARCH" = "x86_64" ]; then
    install -D -m755 build/linux-amd64/hsdis-amd64.so "${pkgdir}/usr/lib/jvm/java-8-openjdk/jre/lib/amd64/hsdis-amd64.so"
  else
    install -D -m755 build/linux-i586/hsdis-i586.so "${pkgdir}/usr/lib/jvm/java-8-openjdk/jre/lib/i586/hsdis-i586.so"
  fi
}
