# Maintainer: Martchus <martchus@gmx.net>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Jeff 'codemac' Mickey <jeff@archlinux.org>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_pkgname=cppunit
_pkg_arch=armv7a-eabi
_android_arch=armeabi-v7a
_android_toolchain=arm-linux-androideabi
_android_ndk_path=/opt/android-ndk
_android_api_level=28
_android_platform_arch=arch-arm
_android_platform_dir=android-$_android_api_level/${_android_platform_arch}
_android_prefix=${_android_ndk_path}/toolchains/${_android_toolchain}-4.9/prebuilt/linux-x86_64
_android_sysroot=${_android_ndk_path}/platforms/android-$_android_api_level/${_android_platform_arch}
_android_gcc_toolchain_path=$_android_ndk_path/toolchains/$_android_toolchain-4.9/prebuilt/linux-x86_64
_android_gcc_tool_prefix=${_android_gcc_toolchain_path}/bin/${_android_toolchain}
_android_clang_toolchain_path=$_android_ndk_path/toolchains/llvm/prebuilt/linux-x86_64/bin
_install_prefix=/opt/android-libs/$_pkg_arch

pkgname=android-$_pkg_arch-$_pkgname
pkgver=1.15.0
pkgrel=1
pkgdesc="A C++ unit testing framework (Android, $_android_arch)"
arch=('any')
url="https://www.freedesktop.org/wiki/Software/cppunit"
license=('LGPL')
depends=('android-ndk')
conflicts=("android-$_pkgname-$_android_arch")
replaces=("android-$_pkgname-$_android_arch")
options=(!strip !buildflags !libtool staticlibs !emptydirs)
source=("https://dev-www.libreoffice.org/src/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('1c61dfdb430e04ebb411e4b80fbd49fe7e63a1be0209a76d7c07501f02834922')

build() {
  # configure flags
  local target_flags=" \
    --target=$_android_toolchain \
    --gcc-toolchain=$_android_gcc_toolchain_path \
    --sysroot=$_android_sysroot/usr"
  local common_flags=" \
    $target_flags \
    -isystem $_android_ndk_path/sources/android/support/include \
    -isystem $_android_ndk_path/sources/cxx-stl/llvm-libc++/include \
    -isystem $_android_ndk_path/sources/cxx-stl/llvm-libc++abi/include \
    -isystem $_android_ndk_path/sysroot/usr/include \
    -isystem $_android_ndk_path/sysroot/usr/include/$_android_toolchain \
    -funwind-tables \
    -no-canonical-prefixes \
    -D__ANDROID_API__=$_android_api_level \
     -O3 \
    -fPIC \
    -DCPPUNIT_HAVE_LIBDL=1 \
    -Wno-unused-command-line-argument \
    -Wno-defaulted-function-deleted"
  local ld_flags=" \
    $_android_ndk_path/sources/cxx-stl/llvm-libc++/libs/$_android_arch/libc++_shared.so \
    -nostdlib++"
  export CPPFLAGS="$common_flags"
  export CFLAGS="$common_flags $ld_flags"
  export CXXFLAGS="$common_flags -fexceptions -frtti -std=c++14 $ld_flags"
  export LDFLAGS="$target_flags $ld_flags"

  # configure tools
  export AR=${_android_gcc_tool_prefix}-ar
  export AS=${_android_gcc_tool_prefix}-as
  export NM=${_android_gcc_tool_prefix}-nm
  export CC=${_android_clang_toolchain_path}/clang
  export CXX=${_android_clang_toolchain_path}/clang++
  export LD=${_android_gcc_tool_prefix}-ld
  export RANLIB=${_android_gcc_tool_prefix}-ranlib
  export STRIP=${_android_gcc_tool_prefix}-strip

  mkdir -p "${srcdir}/${_pkgname}-${pkgver}/build-${_android_toolchain}"
  cd "${srcdir}/${_pkgname}-${pkgver}/build-${_android_toolchain}"

  ../configure \
    --host=$_android_toolchain \
    --target=$_android_toolchain \
    --build="$CHOST" \
    --with-sysroot="$_android_sysroot" \
    --prefix="$_install_prefix" \
    --libdir="$_install_prefix/lib" \
    --includedir="$_install_prefix/include" \
    --enable-shared=yes \
    --enable-static=yes

  # make sure the LDFLAGS are actually used and no unsuitable ones are added
  sed -i "s:-shared -nostdlib:-shared $LDFLAGS:g" libtool
  sed -i 's:\\$predep_objects \\$libobjs \\$deplibs \\$postdep_objects \\$compiler_flags:\\$libobjs:g' libtool

  # make only the actual cppunit library (DllPlugInTester does not build but I also don't need it)
  cd src/cppunit
  make V=1
}

package() {
  mkdir -p "${srcdir}/${_pkgname}-${pkgver}/build-${_android_toolchain}"
  cd "${srcdir}/${_pkgname}-${pkgver}/build-${_android_toolchain}"

  cd src/cppunit
  make DESTDIR="${pkgdir}" install
  cd ../..
  make DESTDIR="${pkgdir}" install-data
  rm -rf "${pkgdir}/$_install_prefix/share/"

  # strip binaries
  find "$pkgdir" -name 'lib*.so' -type f -exec "${_android_gcc_tool_prefix}-strip" --strip-unneeded {} \;
  find "$pkgdir" -name 'lib*.a' -type f -exec "${_android_gcc_tool_prefix}-strip" -g {} \;
}
