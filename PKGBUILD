#!/bin/bash
#
# Based on https://github.com/lubo/archlinux-chromium.
# Maintainer: Ľubomír 'the-k' Kučera <lubomir.kucera.jr at gmail.com>

pkgname=cronet
pkgver=143.0.7499.146
pkgrel=1
_manual_clone=0
# The following error occures on Abseil 20250512.0:
# Protoc has returned non-zero status: -4
_system_abseil=0
_system_clang=1
_system_stdlib=
pkgdesc="The networking stack of Chromium put into a library"
arch=('x86_64')
url="https://chromium.googlesource.com/chromium/src/+/refs/heads/main/components/cronet"
license=('BSD-3-Clause')
depends=('nss' 'libffi')
makedepends=('python' 'gn' 'ninja' 'clang' 'lld' 'rust' 'rust-bindgen' 'git' 'compiler-rt')
options=('!lto') # Chromium adds its own flags for ThinLTO
source=(https://commondatastorage.googleapis.com/chromium-browser-official/chromium-$pkgver-lite.tar.xz
        chromium-138-rust-1.86-mismatched_lifetime_syntaxes.patch
        compiler-rt-adjust-paths.patch
        increase-fortify-level.patch
        abseil-fix-missing-algorithm.patch
        abseil-remove-unused-targets.patch
        disable-logging.patch
        fix-no-matching-strcat.patch
        fix-numeric_limits.patch
        fix-trust-store-segfault.patch
        fix-undeclared-isnan.patch
)
sha256sums=('d79916348f34ecb154201ba2908a0c1ffaf8ae9670215c575b76cf95b10fb076'
            '5abc8611463b3097fc5ce58017ef918af8b70d616ad093b8b486d017d021bbdf'
            'ec8e49b7114e2fa2d359155c9ef722ff1ba5fe2c518fa48e30863d71d3b82863'
            'd634d2ce1fc63da7ac41f432b1e84c59b7cceabf19d510848a7cff40c8025342'
            SKIP
            SKIP
            SKIP
            SKIP
            SKIP
            SKIP
            SKIP
)

if (( _manual_clone )); then
  source[0]=fetch-chromium-release
  makedepends+=('python-httplib2' 'python-pyparsing' 'python-six')
fi

# Possible replacements are listed in build/linux/unbundle/replace_gn_files.py
# Keys are the names in the above script; values are the dependencies in Arch
declare -gA _system_libs=(
  [brotli]=brotli
  [double-conversion]=double-conversion
  [icu]=icu
  [zlib]=minizip
  [zstd]=zstd
)
declare -gA _system_make_libs=(
  [jsoncpp]=jsoncpp
)
_unwanted_bundled_libs=(
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
  third_party/libdrm
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
  third_party/snappy
  third_party/swiftshader/third_party/SPIRV-Headers
  third_party/swiftshader/third_party/SPIRV-Tools
  third_party/spirv-headers/src
  third_party/spirv-tools/src
  third_party/vulkan_memory_allocator
  third_party/woff2
  third_party/zlib
  third_party/zstd

  third_party/node
  third_party/jdk
)

# System Abseil needs libstdc++.
# https://stackoverflow.com/q/12542971
if [[ "${_system_stdlib}" != libstdc++ ]]; then
  _system_abseil=0
fi
if (( _system_abseil )); then
  _system_libs+=(
    [absl_algorithm]=
    [absl_base]="abseil-cpp>=20240722.0"
    [absl_cleanup]=
    [absl_container]=
    [absl_crc]=
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
  )
  _unwanted_bundled_libs+=(
    third_party/abseil-cpp/absl/algorithm
    third_party/abseil-cpp/absl/base
    third_party/abseil-cpp/absl/cleanup
    third_party/abseil-cpp/absl/container
    third_party/abseil-cpp/absl/crc
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
  )
fi

case "${_system_stdlib}" in
libstdc++)
  _system_libs+=(
    [re2]=re2
  )
  _unwanted_bundled_libs+=(
    third_party/re2
  )
  ;;
esac

depends+=(${_system_libs[@]})
makedepends+=("${_system_make_libs[@]}")

case "${_system_stdlib}" in
libc++)
  depends+=(
    libc++
  )
  ;&
libstdc++)
  _unwanted_bundled_libs+=(
    third_party/libc++
    third_party/libc++abi
  )
  ;;
esac

prepare() {
  if (( _manual_clone )); then
    ./fetch-chromium-release $pkgver
  fi
  cd chromium-$pkgver

  # Allow building against system libraries in official builds
  sed -i 's/OFFICIAL_BUILD/GOOGLE_CHROME_BUILD/' \
    tools/generate_shim_headers/generate_shim_headers.py

  # Upstream fixes

  # Fixes from NixOS
  patch -Np1 -i ../chromium-138-rust-1.86-mismatched_lifetime_syntaxes.patch

  if (( _system_clang )); then
    # Allow libclang_rt.builtins from compiler-rt >= 16 to be used
    patch -Np1 -i ../compiler-rt-adjust-paths.patch
  fi

  # Increase _FORTIFY_SOURCE level to match Arch's default flags
  patch -Np1 -i ../increase-fortify-level.patch

  # Fixes for building with libstdc++ instead of libc++

  # Fixes the build crashing with the following error:
  # ../../components/cronet/native/engine.cc:155:8: error: use of undeclared identifier 'isnan'
  patch -p0 -i ../fix-undeclared-isnan.patch

  # Disables logging as it's unconfigurable, which is undesired in a library
  patch -p0 -i ../disable-logging.patch

  if (( _system_abseil )); then
    # Fixes building with system Abseil
    patch -p0 -i ../abseil-fix-missing-algorithm.patch
    patch -p0 -i ../abseil-remove-unused-targets.patch
  fi

  # Fixes `implicit instantiation of undefined template 'std::numeric_limits<unsigned long>'` error
  patch -p0 -i ../fix-numeric_limits.patch

  # Fixes the following error:
  # ../../net/third_party/quiche/src/quiche/web_transport/encapsulated/encapsulated_web_transport.cc:351:16: error: no matching function for call to 'StrCat'
  patch -p0 -i ../fix-no-matching-strcat.patch

  # Fixes segfault caused by `command_line` being null
  patch -p0 -i ../fix-trust-store-segfault.patch

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
      \! -path "third_party/abseil-cpp/absl/base/internal/raw_logging.h" \
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
    'fatal_linker_warnings=false'
    'disable_fieldtrial_testing_config=true'
    'use_sysroot=false'
    'use_system_libffi=true'
    'use_clang_modules=false'
  )

  if [[ -n ${_system_libs[icu]+set} ]]; then
    _flags+=('icu_use_data_file=false')
  fi

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
      'rust_bindgen_root="/usr"'
      "rustc_version=\"$(rustc --version)\""
    )
  fi

  case "${_system_stdlib}" in
  libc++)
    CXXFLAGS+=' -stdlib=libc++'
    LDFLAGS+=' -stdlib=libc++'
    ;&
  libstdc++)
    _flags+=(
      'use_custom_libcxx=false'
    )
    ;;
  esac

  if (( _system_abseil )); then
    # Fixes https://github.com/abseil/abseil-cpp/issues/1747
    # ld.lld: error: undefined symbol: absl::lts_20250127::log_internal::LogMessage& absl::lts_20250127::log_internal::LogMessage::operator<<<unsigned long, 0>(unsigned long const&)
    CXXFLAGS+=' -fclang-abi-compat=17'
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

  if [[ $CARCH == aarch64 ]] || [[ $CARCH == riscv64 ]]; then
    # On aarch64 and riscv64, certain files (e.g. in libvpx and libyuv) needs to
    # be compiled with additional arch features (e.g. dotprod, sve, sme, rvv)
    # Having an arch setting in the C(XX)FLAGS overrides those
    # and causes compilation failure
    CFLAGS="${CFLAGS/-march=*([^ ]) }"
    CXXFLAGS="${CXXFLAGS/-march=*([^ ]) }"
  fi

  gn gen out/Release --args="${_flags[*]}"
  ninja -C out/Release cronet_package
}

package() {
  cd chromium-$pkgver/out/Release/cronet

  install -D "libcronet.${pkgver}.so" "${pkgdir}/usr/lib/libcronet.${pkgver}.so"
  ln -s "libcronet.${pkgver}.so" "${pkgdir}/usr/lib/libcronet.so"

  cp -r include "${pkgdir}/usr"

  install -Dvm644 LICENSE "${pkgdir}/usr/share/licenses/cronet/LICENSE"
}

# vim:set ts=2 sw=2 et:
