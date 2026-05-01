# Maintainer: Christian Heusel <gromit@archlinux.org>
# Maintainer: Jonathan Grotelüschen <tippfehlr@archlinux.org>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>

# Note: This PKGBUILD and the chromium PKGBUILD are loosely kept in sync to ease maintenance.
# As such care should be taken to minimize the differences between these PKGBUILDs.
pkgname=cef-vaapi
# pkgver is updated automatically.
# To update this package, update the _cef_commit and _chromium_ver variables.
# For the CEF versioning scheme, see
# https://chromiumembedded.github.io/cef/branches_and_building#version-number-format
pkgver=147.0.10
# See https://github.com/chromiumembedded/cef/tree/<release branch>
# Also see https://chromiumembedded.github.io/cef/branches_and_building
_cef_commit=d58e84d17dd3f646c906ac633156cd0ec46638e9
# the chromium version must match CHROMIUM_BUILD_COMPATIBILITY.txt in the CEF repo
_chromium_ver=147.0.7727.118
_system_clang=1
pkgrel=1
pkgdesc="Chromium Embedded Framework (CEF), simple framework for embedding Chromium-based browsers in other applications (VAAPI-enabled variant)"
provides=("cef=$pkgver")  # provides="cef=$pkgver"
conflicts=('cef')  # conflicts='cef'
arch=('x86_64')
url="https://chromiumembedded.github.io/cef"
license=('BSD-3-Clause')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'dbus'
  'libdrm'
  'libffi'
  'libpulse'
  'libxcomposite'
  'libxdamage'
  'libxkbcommon'
  'libxrandr'
  'mesa'
  'nss'
  'pango'
  'libva'
)
optdepends=(
  'libva-mesa-driver: VAAPI driver for AMD GPUs'
  'intel-media-driver: VAAPI driver for modern Intel GPUs'
  'libva-utils: VAAPI diagnostics such as vainfo'
)

makedepends=(
  'clang'
  'compiler-rt'
  'git'
  'gn'
  'gperf'
  'java-runtime-headless'
  'lld'
  'ninja'
  'nodejs'
  'npm'
  'pipewire'
  'python'
  'python-httplib2'
  'python-pyparsing'
  'python-six'
  'rsync'
  'rust'
  'rust-bindgen'
  'libxtst'
)
options=('!lto') # Chromium adds its own flags for ThinLTO
source=("chromium-$_chromium_ver-lite.tar.xz::https://commondatastorage.googleapis.com/chromium-browser-official/chromium-$_chromium_ver-lite.tar.xz"
        "cef::git+https://github.com/chromiumembedded/cef.git#commit=${_cef_commit}"
        chromium-138-nodejs-version-check.patch
        chromium-145-fix-SYS_SECCOMP.patch
        chromium-146-drop-unknown-clang-flag.patch
        chromium-146-build-with-wasm-rollup.patch
        chromium-147-revert-clang-no-lifetime-dse-flag.patch
        chromium-147-rust-1.95-bytemuck.patch
        compiler-rt-adjust-paths.patch
        increase-fortify-level.patch
        glibc-2.42-baud-rate-fix.patch
        cef-no-sysroot.patch
        cef-no-libxml-visibility-patch.patch
        chromium-disable-font-tests.patch
        FindCEF.cmake
)
sha256sums=('713eb46feccf03417a06bb26768d0ffb6ec635b13eeffaacfe570e7ce55c5da7'
            '752d63b546d78146a3c3618eaefb0eccb22343abd7d26d76de264d52029e5638'
            '11a96ffa21448ec4c63dd5c8d6795a1998d8e5cd5a689d91aea4d2bdd13fb06e'
            '4fc040a0656a0a524dd8ad090cd129fc5b6cb21adcc66be82080165789e8c13e'
            '24535c314c7e70c52bcf409aaf604728bfc5b5c97e60087e630e1f7233b9e12d'
            '45fa20cc27ef0aa00d654d0bac84bfaa8d8090b5f8aec49cc2e8d7249d3cd7ba'
            'c382830318c5b37826ecf44f3ba9def6be8affdad1bce819ecb83f3222ff4b3a'
            'b9e6339221efe03540ffb360c161d93604a1fc93a5a1c53e5e9849066f987d05'
            'ec8e49b7114e2fa2d359155c9ef722ff1ba5fe2c518fa48e30863d71d3b82863'
            'd634d2ce1fc63da7ac41f432b1e84c59b7cceabf19d510848a7cff40c8025342'
            '1c1898f263eaacbc069a8e1a3e732852350350d1dad4cb1a6bba430e3b796cd0'
            'cdc046c3da5a57dae8fba0de49cadbe65d4f8fbfffb172f7a768222232595faa'
            '6695d7bcac489f74b8290a05dac540c2b5c5fed997ee119ae05419d36509445d'
            '44dcc0da55a8c6c6af875addcfb9c552c722b56a31479eb7d99f16d0a27f4ebb'
            'e576250c4d0f3dd307bd22c6d4f9f7aba54fdf4d5899520c0bd1c3527aec65ed')

# Possible replacements are listed in build/linux/unbundle/replace_gn_files.py
# Keys are the names in the above script; values are the dependencies in Arch
declare -gA _system_libs=(
  [brotli]=brotli
  #[dav1d]=dav1d
  #[ffmpeg]=ffmpeg    # YouTube playback stopped working in Chromium 120
  [flac]=flac
  [fontconfig]=fontconfig
  [freetype]=freetype2
  [harfbuzz-ng]=harfbuzz
  #[icu]=icu
  #[jsoncpp]=jsoncpp  # needs libstdc++
  #[libaom]=aom
  #[libavif]=libavif  # needs -DAVIF_ENABLE_EXPERIMENTAL_GAIN_MAP=ON
  [libjpeg]=libjpeg-turbo
  # [libpng]=libpng
  #[libvpx]=libvpx
  [libwebp]=libwebp
  [libxml]=libxml2
  [libxslt]=libxslt
  [opus]=opus
  #[re2]=re2          # needs libstdc++
  #[snappy]=snappy    # needs libstdc++
  #[woff2]=woff2      # needs libstdc++
  [zlib]=minizip
)
_unwanted_bundled_libs=(
  $(printf "%s\n" ${!_system_libs[@]} | sed 's/^libjpeg$/&_turbo/')
)
depends+=(${_system_libs[@]})

_validate_cef_vaapi_invariants() {
  local _pkgbuild="${BASH_SOURCE[0]}"
  local _required_flags=(
    'ffmpeg_branding="Chrome"'
    'proprietary_codecs=true'
    'rtc_use_pipewire=true'
    'link_pulseaudio=true'
    'use_vaapi=true'
  )
  local _flag _actual _flag_ok
  for _flag in "${_required_flags[@]}"; do
    _flag_ok=0
    for _actual in "${_flags[@]}"; do
      if [[ "$_actual" == "$_flag" ]]; then
        _flag_ok=1
        break
      fi
    done
    if (( ! _flag_ok )); then
      echo "ERROR: required GN flag missing or changed: ${_flag}" >&2
      exit 1
    fi
  done

  if grep -Eq '^[[:space:]]*\[ffmpeg\]=' "$_pkgbuild"; then
    echo "ERROR: _system_libs[ffmpeg] must stay commented or absent" >&2
    exit 1
  fi

  local _source_ok=0 _s
  for _s in "${source[@]}"; do
    if [[ "$_s" == cef::git+https://github.com/chromiumembedded/cef.git* ]]; then
      _source_ok=1
      break
    fi
  done
  if (( ! _source_ok )); then
    echo "ERROR: source must use cef::git+https://github.com/chromiumembedded/cef.git" >&2
    exit 1
  fi

  local _provides_ok=0 _p
  for _p in "${provides[@]}"; do
    if [[ "$_p" == cef=* ]]; then
      _provides_ok=1
      break
    fi
  done
  if (( ! _provides_ok )); then
    echo "ERROR: provides must include cef=\$pkgver" >&2
    exit 1
  fi

  local _conflicts_ok=0 _c
  for _c in "${conflicts[@]}"; do
    if [[ "$_c" == cef ]]; then
      _conflicts_ok=1
      break
    fi
  done
  if (( ! _conflicts_ok )); then
    echo "ERROR: conflicts must include cef" >&2
    exit 1
  fi

  if declare -p replaces >/dev/null 2>&1 && (( ${#replaces[@]} > 0 )); then
    echo "ERROR: replaces must not be set" >&2
    exit 1
  fi

  local _libva_ok=0 _d
  for _d in "${depends[@]}"; do
    if [[ "$_d" == libva ]]; then
      _libva_ok=1
      break
    fi
  done
  if (( ! _libva_ok )); then
    echo "ERROR: depends must include libva" >&2
    exit 1
  fi
}

prepare() {
  cd chromium-$_chromium_ver

  # Move CEF into the chromium source tree
  mv "$srcdir/cef" cef

  # Allow building against system libraries in official builds
  sed -i 's/OFFICIAL_BUILD/GOOGLE_CHROME_BUILD/' \
    tools/generate_shim_headers/generate_shim_headers.py

  # https://crbug.com/893950
  sed -i -e 's/\<xmlMalloc\>/malloc/' -e 's/\<xmlFree\>/free/' \
         -e '1i #include <cstdlib>' \
    third_party/blink/renderer/core/xml/*.cc \
    third_party/blink/renderer/core/xml/parser/xml_document_parser.cc \
    third_party/libxml/chromium/*.cc

  # Fixes from Gentoo
  patch -Np1 -i ../chromium-138-nodejs-version-check.patch

  # Allow libclang_rt.builtins from compiler-rt >= 16 to be used
  patch -Np1 -i ../compiler-rt-adjust-paths.patch

  # Increase _FORTIFY_SOURCE level to match Arch's default flags
  patch -Np1 -i ../increase-fortify-level.patch

  # Fix issue about missing compiler flag, can be dropped when arch has LLVM 23
  # clang++: error: unknown argument: '-fsanitize-ignore-for-ubsan-feature=array-bounds'
  patch -Np1 -i ../chromium-146-drop-unknown-clang-flag.patch

  # Causes a build failure with our clang version
  patch -Np1 -i ../chromium-147-revert-clang-no-lifetime-dse-flag.patch

  # https://crbug.com/456218403
  patch -Np1 -i ../chromium-145-fix-SYS_SECCOMP.patch

  patch -Np1 -i ../chromium-146-build-with-wasm-rollup.patch

  patch -Np1 -i ../chromium-147-rust-1.95-bytemuck.patch

  patch -Np1 -i ../chromium-disable-font-tests.patch

  # https://crbug.com/456677057
  patch -Np1 -i ../glibc-2.42-baud-rate-fix.patch

  # CEF: Remove sysroot requirement for non-x64 builds
  patch -Np1 -i ../cef-no-sysroot.patch

  # CEF: Remove libxml_visibility patch (fails with system libxml2)
  patch -Np1 -i ../cef-no-libxml-visibility-patch.patch

  # CEF: Override clang_exe to use system clang
  echo 'clang_exe = "clang"' >> cef/tools/clang_util.py

  # Link to system tools required by the build
  mkdir -p third_party/node/linux/node-linux-x64/bin third_party/jdk/current/bin
  ln -s /usr/bin/node third_party/node/linux/node-linux-x64/bin/
  ln -s /usr/bin/java third_party/jdk/current/bin/

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
    find "third_party/$_lib" -type f \
      \! -path "third_party/$_lib/chromium/*" \
      \! -path "third_party/$_lib/google/*" \
      \! -path "third_party/harfbuzz-ng/utils/hb_scoped.h" \
      \! -regex '.*\.\(gn\|gni\|isolate\)' \
      -delete
  done

  ./build/linux/unbundle/replace_gn_files.py \
    --system-libraries "${!_system_libs[@]}"

  # check if the right chromium version is available.
  local _expected_chromium_ver=$(grep -oP "refs/tags/\K[0-9.]+" cef/CHROMIUM_BUILD_COMPATIBILITY.txt)
  if [[ "$_expected_chromium_ver" != "$_chromium_ver" ]]; then
    echo "Error: CEF expects chromium $_expected_chromium_ver, but $_chromium_ver was set in PKGBUILD" >&2
    exit 1
  fi
}

pkgver() {
  cd chromium-$_chromium_ver

  # python tool to get the full CEF version. For the full output, look at
  # /usr/include/cef/include/cef_version.h in the built package.
  python cef/tools/make_version_header.py cef_version_header
  grep -oP 'CEF_VERSION "\K[^"]+' cef_version_header | sed -E 's/\+.*//'
}

build() {
  cd chromium-$_chromium_ver

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

  # Add depot_tools to PATH (needed by CEF's gclient_hook.py)
  export PATH="$PATH:$PWD/third_party/depot_tools"

  # Use system ninja, remove the wrapper which only supports x86_64
  rm -f third_party/depot_tools/ninja

  # GN defines passed to CEF's gclient_hook.py via GN_DEFINES env var
  local _flags=(
    'custom_toolchain="//build/toolchain/linux/unbundle:default"'
    'host_toolchain="//build/toolchain/linux/unbundle:default"'
    'is_official_build=true' # implies is_cfi=true on x86_64
    'symbol_level=0' # sufficient for backtraces on x86(_64)
    'treat_warnings_as_errors=false'
    'fatal_linker_warnings=false'
    'disable_fieldtrial_testing_config=true'
    'blink_enable_generated_code_formatting=false'
    'ffmpeg_branding="Chrome"'
    'proprietary_codecs=true'
    'rtc_use_pipewire=true'
    'link_pulseaudio=true'
    'use_custom_libcxx=true' # https://github.com/llvm/llvm-project/issues/61705
    'use_sysroot=false'
    'use_system_libffi=true'
    'use_qt5=false'
    'use_qt6=false'
    'use_gtk=false'
    'use_cups=false'
    'use_gio=false'
    'use_kerberos=false'
    'use_libpci=false'
    'use_udev=false'
    'cef_use_gtk=false'
    'enable_remoting=false'
    'use_vaapi=true'
    'use_clang_modules=false'
    'devtools_bundle=false'
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
      "rustc_version=\"$(rustc --version | awk '{ print $2 ;}')\""
    )
  fi

  _validate_cef_vaapi_invariants

  export GN_DEFINES="${_flags[*]}"
  # Only build Release config
  export GN_OUT_CONFIGS="Release_GN_x64"

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

  python3 cef/tools/gclient_hook.py
  ninja -C out/Release_GN_x64 libcef chrome_sandbox

  # Build the CEF binary distribution
  python3 cef/tools/make_distrib.py \
    --distrib-subdir=distrib \
    --output-dir=.. \
    --ninja-build \
    --x64-build \
    --minimal \
    --no-docs \
    --no-archive
}

package() {
  cd distrib_minimal

  install -d "$pkgdir/usr/lib/cef/"
  cp -r Release/* "$pkgdir/usr/lib/cef/"
  install -Dvm4755 Release/chrome-sandbox "$pkgdir/usr/lib/cef/chrome-sandbox"
  cp -r Resources/* "$pkgdir/usr/lib/cef/"

  # Headers
  install -d "$pkgdir/usr/include/cef"
  cp -a "include" "$pkgdir/usr/include/cef/"

  # libcef_dll wrapper source
  install -d "$pkgdir/usr/src/cef"
  cp -a "libcef_dll" "$pkgdir/usr/src/cef/"

  # Remove include file targets, since includes are in a different path
  sed -i -e '/\.\.\/include/d' "$pkgdir/usr/src/cef/libcef_dll/CMakeLists.txt"

  # The FindCEF.cmake from CEF expects one unified directory.
  # We provide a custom FindCEF.cmake that looks in the right places.
  # Copied from https://src.fedoraproject.org/rpms/cef/blob/rawhide/f/FindCEF.cmake (thanks Fedora!)
  install -Dm644 "$srcdir/FindCEF.cmake" -t "$pkgdir/usr/share/cmake/Modules/"

  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE-CEF"
  install -Dm644 ../chromium-$_chromium_ver/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-CHROMIUM"
}

# vim:set ts=2 sw=2 et:
