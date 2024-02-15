#!/bin/bash
#
# Based on https://gitlab.archlinux.org/archlinux/packaging/packages/chromium.
# Maintainer: Ľubomír 'the-k' Kučera <lubomir.kucera.jr at gmail.com>

pkgname=cronet
pkgver=122.0.6261.39
pkgrel=1
_manual_clone=0
_system_clang=1
pkgdesc="The networking stack of Chromium put into a library"
arch=('x86_64')
url="https://chromium.googlesource.com/chromium/src/+/refs/heads/main/components/cronet"
license=('BSD-3-Clause')
depends=('nss' 'libffi')
makedepends=('python' 'gn' 'ninja' 'clang' 'lld' 'gperf' 'rust' 'git')
options=('!lto') # Chromium adds its own flags for ThinLTO
source=(https://commondatastorage.googleapis.com/chromium-browser-official/chromium-$pkgver.tar.xz
        https://gitlab.com/Matt.Jolly/chromium-patches/-/archive/${pkgver%%.*}/chromium-patches-${pkgver%%.*}.tar.bz2
        drop-flags-unsupported-by-clang16.patch
        compiler-rt-16.patch
        abseil-remove-unused-targets.patch
        disable-logging.patch
        fix-no-matching-strcat.patch
        fix-numeric_limits.patch
        fix-undeclared-isnan.patch)
sha256sums=('30fc98bdb497d98e63fcb4d8e76acf5201eddf7e65ee907ecf4041cc8e121be3'
            '1f6acf165578288dc84edc7d9dcfabf7d38f55153b63a37ee5afa929f0e2baad'
            '53774fd7f807ad42f77d45cab9e5480cc2bcb0a5c5138110a434407521af9607'
            '8a2649dcc6ff8d8f24ddbe40dc2a171824f681c6f33c39c4792b645b87c9dcab'
            SKIP
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
  # Abseil needs libstdc++.
  # [absl_algorithm]=
  # [absl_base]=abseil-cpp
  # [absl_cleanup]=
  # [absl_container]=
  # [absl_debugging]=
  # [absl_flags]=
  # [absl_functional]=
  # [absl_hash]=
  # [absl_log]=
  # [absl_log_internal]=
  # [absl_memory]=
  # [absl_meta]=
  # [absl_numeric]=
  # [absl_random]=
  # [absl_status]=
  # [absl_strings]=
  # [absl_synchronization]=
  # [absl_time]=
  # [absl_types]=
  # [absl_utility]=
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
  # Abseil needs libstdc++.
  # third_party/abseil-cpp/absl/algorithm
  # third_party/abseil-cpp/absl/base
  # third_party/abseil-cpp/absl/cleanup
  # third_party/abseil-cpp/absl/container
  # third_party/abseil-cpp/absl/debugging
  # third_party/abseil-cpp/absl/flags
  # third_party/abseil-cpp/absl/functional
  # third_party/abseil-cpp/absl/hash
  # third_party/abseil-cpp/absl/log
  # third_party/abseil-cpp/absl/log/internal
  # third_party/abseil-cpp/absl/memory
  # third_party/abseil-cpp/absl/meta
  # third_party/abseil-cpp/absl/numeric
  # third_party/abseil-cpp/absl/random
  # third_party/abseil-cpp/absl/status
  # third_party/abseil-cpp/absl/strings
  # third_party/abseil-cpp/absl/synchronization
  # third_party/abseil-cpp/absl/time
  # third_party/abseil-cpp/absl/types
  # third_party/abseil-cpp/absl/utility
  third_party/brotli
  third_party/crc32c
  third_party/dav1d
  base/third_party/double_conversion
  third_party/ffmpeg
  third_party/flac
  third_party/flatbuffers
  third_party/fontconfig
  build/config/freetype
  third_party/harfbuzz-ng
  third_party/highway
  third_party/icu
  third_party/jsoncpp
  third_party/libaom
  third_party/libavif
  third_party/libdrm
  third_party/libevent
  third_party/libjpeg_turbo
  third_party/libpng
  third_party/libsecret
  third_party/libusb
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
  third_party/vulkan_memory_allocator
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

  if (( _system_clang )); then
    # Drop compiler flags that need newer clang
    patch -Np1 -i ../drop-flags-unsupported-by-clang16.patch

    # Allow libclang_rt.builtins from compiler-rt 16 to be used
    patch -Np1 -i ../compiler-rt-16.patch
  fi

  # Fixes the build crashing with the following error:
  # ../../components/cronet/native/engine.cc:155:8: error: use of undeclared identifier 'isnan'
  patch -p0 -i ../fix-undeclared-isnan.patch

  # Disables logging as it's unconfigurable, which is undesired in a library
  patch -p0 -i ../disable-logging.patch

  # Fixes building with system Abseil (needs libstdc++)
  # patch -p0 -i ../abseil-remove-unused-targets.patch

  # Fixes `implicit instantiation of undefined template 'std::numeric_limits<unsigned long>'` error
  patch -p0 -i ../fix-numeric_limits.patch

  # Fixes the following error:
  # ../../net/third_party/quiche/src/quiche/web_transport/encapsulated/encapsulated_web_transport.cc:351:16: error: no matching function for call to 'StrCat'
  patch -p0 -i ../fix-no-matching-strcat.patch

  # Make building with system zstd possible
  rm -f build/linux/unbundle/zstd.gn
  patch -Np1 -i ../chromium-patches-*/chromium-117-system-zstd.patch

  if (( !_system_clang )); then
    # Use prebuilt rust as system rust cannot be used due to the error:
    #   error: the option `Z` is only accepted on the nightly compiler
    ./tools/rust/update_rust.py

    # To link to rust libraries we need to compile with prebuilt clang
    ./tools/clang/scripts/update.py
  fi

  # Remove bundled libraries for which we will use the system copies; this
  # *should* do what the remove_bundled_libraries.py script does, with the
  # added benefit of not having to list all the remaining libraries
  local _lib
  for _lib in ${_unwanted_bundled_libs[@]}; do
    find "$_lib" -type f \
      \! -path "$_lib/chromium/*" \
      \! -path "$_lib/google/*" \
      \! -regex '.*\.\(gn\|gni\|isolate\)' \
      -delete
  done

  ./build/linux/unbundle/replace_gn_files.py \
    --system-libraries "${!_system_libs[@]}" "${!_system_make_libs[@]}"
}

build() {
  cd chromium-$pkgver

  if (( _system_clang )); then
    export CC=clang
    export CXX=clang++
    export AR=ar
    export NM=nm
  else
    local _clang_path="$PWD/third_party/llvm-build/Release+Asserts/bin"
    export CC=$_clang_path/clang
    export CXX=$_clang_path/clang++
    export AR=$_clang_path/llvm-ar
    export NM=$_clang_path/llvm-nm
  fi

  local _flags=(
    'custom_toolchain="//build/toolchain/linux/unbundle:default"'
    'host_toolchain="//build/toolchain/linux/unbundle:default"'
    'is_official_build=true' # implies is_cfi=true on x86_64
    'symbol_level=0' # sufficient for backtraces on x86(_64)
    'treat_warnings_as_errors=false'
    'disable_fieldtrial_testing_config=true'
    'use_custom_libcxx=true' # https://github.com/llvm/llvm-project/issues/61705
    'use_sysroot=false'
    'use_system_libffi=true'
    'enable_nacl=false'
  )

  if (( _system_clang )); then
     local _clang_version=$(
       clang --version | grep -m1 version | sed 's/.* \([0-9]\+\).*/\1/')

    _flags+=(
      'clang_base_path="/usr"'
      'clang_use_chrome_plugins=false'
      "clang_version=\"$_clang_version\""
      'chrome_pgo_phase=0' # needs newer clang to read the bundled PGO profile
    )

    # Allow the use of nightly features with stable Rust compiler
    # https://github.com/ungoogled-software/ungoogled-chromium/pull/2696#issuecomment-1918173198
    export RUSTC_BOOTSTRAP=1

    _flags+=(
      'rust_sysroot_absolute="/usr"'
      "rustc_version=\"$(rustc --version)\""
    )
  fi

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

  gn gen out/Release --args="${_flags[*]}"
  ninja -C out/Release cronet_package
}

package() {
  cd chromium-$pkgver/out/Release/cronet

  install -D "libcronet.${pkgver}.so" "${pkgdir}/usr/lib/libcronet.${pkgver}.so"
  ln -s "libcronet.${pkgver}.so" "${pkgdir}/usr/lib/libcronet.so"

  cp -r include "${pkgdir}/usr"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/cronet/LICENSE"
}

# vim:set ts=2 sw=2 et:
