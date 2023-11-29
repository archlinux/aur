#!/bin/bash
#
# Based on https://gitlab.archlinux.org/archlinux/packaging/packages/chromium.
# Maintainer: Ľubomír 'the-k' Kučera <lubomir.kucera.jr at gmail.com>

pkgname=cronet
pkgver=119.0.6045.199
pkgrel=1
_manual_clone=0
pkgdesc="The networking stack of Chromium put into a library"
arch=('x86_64')
url="https://chromium.googlesource.com/chromium/src/+/refs/heads/main/components/cronet"
license=('BSD')
depends=('nss' 'libffi')
makedepends=('python' 'gn' 'ninja' 'clang' 'lld' 'gperf' 'git')
options=('!lto') # Chromium adds its own flags for ThinLTO
source=(https://commondatastorage.googleapis.com/chromium-browser-official/chromium-$pkgver.tar.xz
        https://gitlab.com/Matt.Jolly/chromium-patches/-/archive/${pkgver%%.*}/chromium-patches-${pkgver%%.*}.tar.bz2
        REVERT-disable-autoupgrading-debug-info.patch
        abseil-remove-unused-targets.patch
        disable-logging.patch
        fix-numeric_limits.patch
        fix-undeclared-isnan.patch)
sha256sums=('b1ae62beb7907d99802b74821d5198bd54a7456df1116d317da653bde8ce6388'
            '09ecf142254525ddb9c2dbbb2c71775e68722412923a5a9bba5cc2e46af8d087'
            '1b782b0f6d4f645e4e0daa8a4852d63f0c972aa0473319216ff04613a0592a69'
            SKIP
            SKIP
            SKIP
            SKIP)

if (( _manual_clone )); then
  source[0]=fetch-chromium-release
  makedepends+=('python-httplib2' 'python-pyparsing' 'python-six')
fi

# Possible replacements are listed in build/linux/unbundle/replace_gn_files.py
# Keys are the names in the above script; values are the dependencies in Arch
declare -gA _system_libs=(
  [absl_algorithm]=
  [absl_base]=abseil-cpp
  [absl_cleanup]=
  [absl_container]=
  [absl_debugging]=
  [absl_flags]=
  [absl_functional]=
  [absl_hash]=
  [absl_log]=
  [absl_log_internal]=
  [absl_memory]=
  [absl_meta]=
  [absl_numeric]=
  [absl_random]=
  [absl_status]=
  [absl_strings]=
  [absl_synchronization]=
  [absl_time]=
  [absl_types]=
  [absl_utility]=
  [brotli]=brotli
  [double-conversion]=double-conversion
  [icu]=icu
  [libevent]=libevent
  [zlib]=minizip
  [zstd]=zstd
)
declare -gA _system_make_libs=(
  [jsoncpp]=jsoncpp
)
_unwanted_bundled_libs=(
  third_party/abseil-cpp/absl/algorithm
  third_party/abseil-cpp/absl/base
  third_party/abseil-cpp/absl/cleanup
  third_party/abseil-cpp/absl/container
  third_party/abseil-cpp/absl/debugging
  third_party/abseil-cpp/absl/flags
  third_party/abseil-cpp/absl/functional
  third_party/abseil-cpp/absl/hash
  third_party/abseil-cpp/absl/log
  third_party/abseil-cpp/absl/log/internal
  third_party/abseil-cpp/absl/memory
  third_party/abseil-cpp/absl/meta
  third_party/abseil-cpp/absl/numeric
  third_party/abseil-cpp/absl/random
  third_party/abseil-cpp/absl/status
  third_party/abseil-cpp/absl/strings
  third_party/abseil-cpp/absl/synchronization
  third_party/abseil-cpp/absl/time
  third_party/abseil-cpp/absl/types
  third_party/abseil-cpp/absl/utility
  third_party/brotli
  third_party/crc32c
  third_party/dav1d
  base/third_party/double_conversion
  third_party/ffmpeg
  third_party/flac
  third_party/fontconfig
  build/config/freetype
  third_party/harfbuzz-ng
  third_party/icu
  third_party/jsoncpp
  third_party/libaom
  third_party/libavif
  third_party/libdrm
  third_party/libevent
  third_party/libjpeg_turbo
  third_party/libpng
  third_party/libvpx
  third_party/libwebp
  third_party/libxml
  third_party/angle/src/third_party/libXNVCtrl
  third_party/libxslt
  third_party/libyuv
  third_party/openh264
  third_party/opus
  third_party/re2
  third_party/snappy
  third_party/swiftshader/third_party/SPIRV-Headers
  third_party/swiftshader/third_party/SPIRV-Tools
  third_party/vulkan-deps/spirv-headers/src
  third_party/vulkan-deps/spirv-tools/src
  third_party/woff2
  third_party/zlib
  third_party/zstd

  third_party/node
  third_party/jdk
)
depends+=(${_system_libs[@]})
makedepends+=("${_system_make_libs[@]}")

prepare() {
  if (( _manual_clone )); then
    ./fetch-chromium-release $pkgver
  fi
  cd chromium-$pkgver

  # Allow building against system libraries in official builds
  sed -i 's/OFFICIAL_BUILD/GOOGLE_CHROME_BUILD/' \
    tools/generate_shim_headers/generate_shim_headers.py

  # Upstream fixes

  # Revert addition of compiler flag that needs newer clang
  patch -Rp1 -i ../REVERT-disable-autoupgrading-debug-info.patch

  # Fixes for building with libstdc++ instead of libc++
  patch -Np1 -i ../chromium-patches-*/chromium-119-at-spi-variable-consumption.patch

  # Fixes the build crashing with the following error:
  # ../../components/cronet/native/engine.cc:155:8: error: use of undeclared identifier 'isnan'
  patch -p0 -i ../fix-undeclared-isnan.patch

  # Disables logging as it's unconfigurable, which is undesired in a library
  patch -p0 -i ../disable-logging.patch

  # Fixes building with system Abseil
  patch -p0 -i ../abseil-remove-unused-targets.patch

  # Fixes `implicit instantiation of undefined template 'std::numeric_limits<unsigned long>'` error
  patch -p0 -i ../fix-numeric_limits.patch

  # Make building with system zstd possible
  patch -Np1 -i ../chromium-patches-*/chromium-117-system-zstd.patch

  # Remove bundled libraries for which we will use the system copies; this
  # *should* do what the remove_bundled_libraries.py script does, with the
  # added benefit of not having to list all the remaining libraries
  local _lib
  for _lib in ${_unwanted_bundled_libs[@]}; do
    find "$_lib" -type f \
      \! -path "$_lib/chromium/*" \
      \! -path "$_lib/google/*" \
      \! -path "third_party/brotli/include/brotli/shared_dictionary.h" \
      \! -regex '.*\.\(gn\|gni\|isolate\)' \
      -delete
  done

  ./build/linux/unbundle/replace_gn_files.py \
    --system-libraries "${!_system_libs[@]}" "${!_system_make_libs[@]}"
}

build() {
  cd chromium-$pkgver/components/cronet

  export CC=clang
  export CXX=clang++
  export AR=ar
  export NM=nm

  local _flags=(
    'custom_toolchain="//build/toolchain/linux/unbundle:default"'
    'host_toolchain="//build/toolchain/linux/unbundle:default"'
    'clang_base_path="/usr"'
    'clang_use_chrome_plugins=false'
    'is_official_build=true' # implies is_cfi=true on x86_64
    'symbol_level=0' # sufficient for backtraces on x86(_64)
    'chrome_pgo_phase=0' # needs newer clang to read the bundled PGO profile
    'treat_warnings_as_errors=false'
    'disable_fieldtrial_testing_config=true'
    'use_custom_libcxx=false'
    'use_sysroot=false'
    'use_system_libffi=true'
    'enable_nacl=false'
    'enable_rust=false'
  )

  # Facilitate deterministic builds (taken from build/config/compiler/BUILD.gn)
  CFLAGS+='   -Wno-builtin-macro-redefined'
  CXXFLAGS+=' -Wno-builtin-macro-redefined'
  CPPFLAGS+=' -D__DATE__=  -D__TIME__=  -D__TIMESTAMP__='

  # Do not warn about unknown warning options
  CFLAGS+='   -Wno-unknown-warning-option'
  CXXFLAGS+=' -Wno-unknown-warning-option'

  # Let Chromium set its own symbol level
  CFLAGS=${CFLAGS/-g }
  CXXFLAGS=${CXXFLAGS/-g }

  # https://github.com/ungoogled-software/ungoogled-chromium-archlinux/issues/123
  CFLAGS=${CFLAGS/-fexceptions}
  CFLAGS=${CFLAGS/-fcf-protection}
  CXXFLAGS=${CXXFLAGS/-fexceptions}
  CXXFLAGS=${CXXFLAGS/-fcf-protection}

  # This appears to cause random segfaults when combined with ThinLTO
  # https://bugs.archlinux.org/task/73518
  CFLAGS=${CFLAGS/-fstack-clash-protection}
  CXXFLAGS=${CXXFLAGS/-fstack-clash-protection}

  # https://crbug.com/957519#c122
  CXXFLAGS=${CXXFLAGS/-Wp,-D_GLIBCXX_ASSERTIONS}

  gn gen ../../out/Release --args="${_flags[*]}"
  ninja -C ../../out/Release cronet_package
}

package() {
  cd chromium-$pkgver/out/Release/cronet

  install -D "libcronet.${pkgver}.so" "${pkgdir}/usr/lib/libcronet.${pkgver}.so"
  ln -s "libcronet.${pkgver}.so" "${pkgdir}/usr/lib/libcronet.so"

  cp -r include "${pkgdir}/usr"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/cronet/LICENSE"
}

# vim:set ts=2 sw=2 et:
