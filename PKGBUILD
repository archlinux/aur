# Maintainer: Martchus <martchus@gmx.net>
# Contributor: Arthur Darcet <arthur.darcet at m4x.org>
# Contributor: Techlive Zheng <techlivezheng at gmail.com>

_pkgname=libiconv
_pkg_arch=armv7a-eabi
_android_arch=armeabi-v7a
_android_toolchain=arm-linux-androideabi
_android_platform=21
_android_platform_arch=arch-arm
_prefix=/opt/android-libs/$_pkg_arch
_android_ndk_path=/opt/android-ndk
_android_gcc_toolchain_path=$_android_ndk_path/toolchains/$_android_toolchain-4.9/prebuilt/linux-x86_64
_android_gcc_tool_prefix=${_android_gcc_toolchain_path}/bin/${_android_toolchain}
_android_clang_toolchain_path=$_android_ndk_path/toolchains/llvm/prebuilt/linux-x86_64/bin
_android_sysroot=${_android_ndk_path}/platforms/android-$_android_platform/${_android_platform_arch}

pkgname=android-$_pkg_arch-$_pkgname
pkgver=1.16
pkgrel=1
pkgdesc="Provides libiconv.so and libcharset.so (Android $_pkg_arch)"
arch=('any')
url='http://www.gnu.org/software/libiconv/'
license=('LGPL')
makedepends=('android-ndk')
conflicts=("android-$_pkgname-$_android_arch")
replaces=("android-$_pkgname-$_android_arch")
source=("http://ftp.gnu.org/pub/gnu/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('e6a1b1b589654277ee790cce3734f07876ac4ccfaecbee8afa0b649cf529cc04')
options=(!libtool !buildflags staticlibs !strip !emptydirs)

build() {
  cd $srcdir/${_pkgname}-${pkgver}
  sed '/LD_RUN_PATH/d' -i Makefile.in

  # configure tools
  export CPP=${PWD}/cpp.sh
  export AR=${_android_gcc_tool_prefix}-ar
  export AS=${_android_gcc_tool_prefix}-as
  export NM=${_android_gcc_tool_prefix}-nm
  export CC=${_android_clang_toolchain_path}/clang
  export CXX=${_android_clang_toolchain_path}/clang++
  export LD=${_android_gcc_tool_prefix}-ld
  export RANLIB=${_android_gcc_tool_prefix}-ranlib
  export STRIP=${_android_gcc_tool_prefix}-strip

  # configure flags
  export CFLAGS="${CFLAGS} --target=${_android_toolchain} --gcc-toolchain=${_android_gcc_toolchain_path} --sysroot=${_android_sysroot} -I${_android_ndk_path}/sysroot/usr/include -I${_android_ndk_path}/sysroot/usr/include/${_android_toolchain} -I${_android_sysroot}/usr/include -I${_android_gcc_toolchain_path}/include -fexceptions -frtti"
  export CPPFLAGS="${CFLAGS}"
  export LDFLAGS="${LDFLAGS} -L${_android_sysroot}/usr/lib"

  # setup preprocessor (because the NDK doesn't provide a wrapper like for gcc and g++)
  printf "#!/bin/bash\nexec \"$CXX\" --target=${_android_toolchain} -E \"\$@\"" > "$CPP"
  chmod +x "$CPP"

  ./configure \
    --host=$_android_toolchain \
    --target=$_android_toolchain \
    --build="$CHOST" \
    --with-sysroot="${_android_sysroot}" \
    --prefix="$_prefix" \
    --libdir="$_prefix/lib" \
    --includedir="$_prefix/include" \
    --enable-shared=yes \
    --enable-static=yes

  # make sure the LDFLAGS are actually used (LDFLAGS are not passed otherwise)
  local libtool_subst="s:\\\$CC -shared:\\\$CC -shared --target=${_android_toolchain} --gcc-toolchain=${_android_gcc_toolchain_path} --sysroot=${_android_sysroot} $LDFLAGS:g"
  sed -i "$libtool_subst" libtool
  sed -i "$libtool_subst" libcharset/libtool

  # build target lib/localcharset.h and directory lib to experience less brokenness
  make lib/localcharset.h
  cd lib
  make
}

package() {
  cd $srcdir/${_pkgname}-${pkgver}/lib
  make DESTDIR="$pkgdir" LIBDIR="$_prefix/lib" install
  cp libcharset.a "$pkgdir/$_prefix/lib/libcharset.a"
  cp libcharset.so "$pkgdir/$_prefix/lib/libcharset.so"
  cd ..
  mkdir -p "$pkgdir/$_prefix"/include
  mv include/iconv.h "$pkgdir/$_prefix"/include
  cd libcharset
  mv include/libcharset.h "$pkgdir/$_prefix"/include
  mv include/localcharset.h "$pkgdir/$_prefix"/include
}
