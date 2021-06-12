# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_pkgname=boost
_pkg_arch=armv7a-eabi
_android_arch=armeabi-v7a
_android_toolchain=arm-linux-androideabi
_andoird_toolchain_dir=$_android_toolchain
_android_platform=24 # https://developer.android.com/about/dashboards/
_android_target=armv7a-linux-androideabi$_android_platform
_android_prefix=/opt/android-libs/$_pkg_arch
_android_ndk_path=/opt/android-ndk
_boost_arch=arm
_boost_address_model=32

pkgname=android-$_pkg_arch-$_pkgname
pkgver=1.76.0
_srcname=boost_${pkgver//./_}
pkgrel=1
url='https://www.boost.org/'
arch=('any')
license=('custom')
pkgdesc="Free peer-reviewed portable C++ source libraries (Android, $_pkg_arch)"
depends=("android-$_pkg_arch-libiconv")
options=(!buildflags staticlibs !strip !emptydirs)
makedepends=('bzip2' 'zlib' 'android-ndk' 'android-sdk')
conflicts=("android-$_pkgname-$_android_arch")
replaces=("android-$_pkgname-$_android_arch")
source=(https://boostorg.jfrog.io/artifactory/main/release/$pkgver/source/$_srcname.tar.gz
        $_pkgname-ublas-c++20-iterator.patch::https://github.com/boostorg/ublas/commit/a31e5cffa85f.patch
        no-versioned-shlibs.patch)
sha256sums=('7bd7ddceec1a1dfdcbdb3e609b60d01739c38390a5f956385a12f3122049f0ca'
            'aa38addb40d5f44b4a8472029b475e7e6aef1c460509eb7d8edf03491dc1b5ee'
            'd82d0f15064812dcabb3456a7bcb1db0e0f6145980e4728e638372e0fd35af23')

prepare() {
  cd ${_srcname}
  # https://github.com/boostorg/ublas/pull/97
  patch -Np2 -i ../$_pkgname-ublas-c++20-iterator.patch

  patch -i ../no-versioned-shlibs.patch
}

build() {
  local _stagedir="${srcdir}/stagedir"
  local jobs="$(sed -e 's/.*\(-j *[0-9]\+\).*/\1/' <<< ${MAKEFLAGS})"
  local target_flags=" \
    --target=$_android_target"
  local common_flags=" \
    $target_flags \
    -isystem $_android_ndk_path/toolchains/llvm/prebuilt/linux-x86_64/sysroot/usr/include/c++/v1 \
    -isystem $_android_ndk_path/toolchains/llvm/prebuilt/linux-x86_64/sysroot/usr/include \
    -isystem $_android_ndk_path/toolchains/llvm/prebuilt/linux-x86_64/sysroot/usr/include/$_android_toolchain \
    -fexceptions \
    -no-canonical-prefixes \
    -D__ANDROID_API__=$_android_platform \
    -O3 \
    -fPIC \
    -DBOOST_ASIO_HAS_STD_STRING_VIEW=1"
  local ld_flags=" \
    $target_flags \
    -fexceptions \
    $_android_ndk_path/sources/cxx-stl/llvm-libc++/libs/$_android_arch/libc++_shared.so \
    -nostdlib++"

  cd ${_srcname}

  ./bootstrap.sh --with-toolset=gcc

  install -Dm755 tools/build/src/engine/b2 "${_stagedir}"/bin/b2

  # Support for OpenMPI
  echo "using mpi ;" >> project-config.jam

  # boostbook is needed by quickbook
  install -dm755 "${_stagedir}"/share/boostbook
  cp -a tools/boostbook/{xsl,dtd} "${_stagedir}"/share/boostbook/

  export PATH=$_android_ndk_path/toolchains/llvm/prebuilt/linux-x86_64/bin:$PATH

  # default "minimal" install: "release link=shared,static
  # runtime-link=shared threading=single,multi"
  # --layout=tagged will add the "-mt" suffix for multithreaded libraries
  # and installs includes in $_android_prefix/include/boost.
  # --layout=system no longer adds the -mt suffix for multi-threaded libs.
  # install to ${_stagedir} for consistency with regular boost package
  "${_stagedir}"/bin/b2 \
    --with-atomic \
    --with-chrono \
    --with-container \
    --with-date_time \
    --with-exception \
    --with-fiber \
    --with-filesystem \
    --with-graph \
    --with-graph_parallel \
    --with-iostreams \
    --with-locale \
    --with-log \
    --with-math \
    --with-mpi \
    --with-program_options \
    --with-random \
    --with-regex \
    --with-serialization \
    --with-system \
    --with-test \
    --with-thread \
    --with-timer \
    --with-type_erasure \
    --with-wave \
    --with-stacktrace \
    variant=release \
    debug-symbols=off \
    threading=multi \
    runtime-link=shared \
    link=shared,static \
    target-os=android \
    toolset=clang-android \
    architecture=$_boost_arch \
    address-model=$_boost_address_model \
    -sICONV_PATH="/opt/android-libs/$_pkg_arch" \
    cflags="$common_flags" \
    cxxflags="$common_flags -frtti -std=c++14" \
    linkflags="$ld_flags" \
    --layout=system \
    ${jobs} \
    \
    --prefix="${_stagedir}" \
    install
}

package() {
  local _stagedir="${srcdir}/stagedir"
  install -dm755 "${pkgdir}"$_android_prefix
  cp -a "${_stagedir}"/{include,share} "${pkgdir}"$_android_prefix

  local libdir="${pkgdir}"$_android_prefix/lib
  install -d "${libdir}"
  cp -a "${_stagedir}"/lib/*.a "${libdir}"/

  install -dm755 "${pkgdir}"$_android_prefix
  cp -a "${_stagedir}"/lib "${pkgdir}"$_android_prefix

  install -Dm644 "${srcdir}/"${_srcname}/LICENSE_1_0.txt \
      "${pkgdir}"$_android_prefix/share/licenses/boost/LICENSE_1_0.txt

  local strip=$_android_ndk_path/toolchains/$_android_toolchain-4.9/prebuilt/linux-x86_64/bin/$_android_toolchain-strip
  find "${libdir}" -iname '*.a' -exec $strip -g {} \;
  find "${libdir}" -iname '*.so' -exec $strip --strip-unneeded {} \;
}

# vim: ts=2 sw=2 et:
