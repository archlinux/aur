# Maintainer: lumexren <lumexren@gmail.com>

pkgname=vulcanium
pkgver=158.0.8127.36
pkgrel=3
_launcher_ver=8
_manual_clone=0
_system_clang=1
# Check the CRUBIT_REVISION found in tools/rust/update_rust.py
#_crubit_rev=20dc640430bd60ff2f7f8dbf69c311c5f807adde
# The commit above cannot be built successfully, use the last known good commit for stable toolchain
_crubit_rev=d757594f6f7ac27c0cf9c8ea63d9136f8e1f77ae
pkgdesc="Chromium with native Wayland Vulkan rendering and Vulkan Video decoding/encoding"
arch=('x86_64')
url="https://github.com/lumexren/vulcanium"
license=('BSD-3-Clause')
provides=('chromium')
conflicts=('chromium' 'ungoogled-chromium' 'vulcanium-bin' 'ungoogled-vulcanium' 'ungoogled-vulcanium-bin')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'desktop-file-utils'
  'expat'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libcups'
  'libffi'
  'libgcc'
  'libgcrypt'
  'libpulse'
  'libstdc++'
  'libva'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'libxss'
  'mesa'
  'nspr'
  'nss'
  'pango'
  'pciutils'
  'systemd'
  'systemd-libs'
  'ttf-liberation'
  'xdg-utils'
  'zlib'
)
makedepends=(
  'clang'
  'compiler-rt'
  'esbuild'
  'git'
  'gn'
  'go'
  'gperf'
  'java-runtime-headless'
  'lld'
  'ninja'
  'nodejs'
  'opus'
  'pipewire'
  'python'
  'qt6-base'
  'rust'
  'rust-bindgen'
  'rust-src'
  'rustc-dev'
  'typescript'
  'vulkan-headers'
)
optdepends=('pipewire: WebRTC desktop sharing under Wayland'
            'kdialog: support for native dialogs in Plasma'
            'gtk4: for --gtk-version=4 (GTK4 IME might work better on Wayland)'
            'qt6-base: Qt support'
            'org.freedesktop.secrets: password storage backend on GNOME, KDE and Xfce'
            'upower: Battery Status API support')
options=('!lto') # Chromium adds its own flags for ThinLTO
source=(https://commondatastorage.googleapis.com/chromium-browser-official/chromium-$pkgver-lite.tar.xz
        "git+https://chromium.googlesource.com/external/github.com/google/crubit.git#commit=$_crubit_rev"
        https://github.com/foutrelis/chromium-launcher/archive/v$_launcher_ver/chromium-launcher-$_launcher_ver.tar.gz
        "git+https://github.com/lumexren/vulcanium.git")
sha256sums=('8a93030a68231ea046479c47d6b26dfae43becef1b5343cf95f8146109291d6d'
            'fa10e66c8078c2e02cf7e1df0810b7c7d77b89592cc27fca7a756cc4a5ba06cb'
            '213e50f48b67feb4441078d50b0fd431df34323be15be97c55302d3fdac4483a'
            'SKIP')

if (( _manual_clone )); then
  source[0]=fetch-chromium-release
  sha256sums[0]='2e2f36e3cd1ebc4ad57fd310774a5e5e9db77883d5f9374fedeaabd3c103b819'
  makedepends+=('python-httplib2' 'python-pyparsing' 'npm' 'rsync')
fi

# Possible replacements are listed in build/linux/unbundle/replace_gn_files.py
# Keys are the names in the above script; values are the dependencies in Arch
declare -gA _system_libs=(
  [brotli]=brotli
  [dav1d]=dav1d
  [double-conversion]=double-conversion
  #[ffmpeg]=ffmpeg    # YouTube playback stopped working in Chromium 120
  [flac]=flac
  [fontconfig]=fontconfig
  [freetype]=freetype2
  [harfbuzz]=harfbuzz
  [highway]=highway
  #[icu]=icu
  #[jsoncpp]=jsoncpp  # needs libstdc++
  #[libaom]=aom
  #[libavif]=libavif  # needs -DAVIF_ENABLE_EXPERIMENTAL_GAIN_MAP=ON
  [libdrm]=libdrm
  [libjpeg]=libjpeg-turbo
  # [libpng]=libpng
  #[libvpx]=libvpx
  [libwebp]=libwebp
  [libxml]=libxml2
  #[libxslt]=libxslt
  [openh264]=openh264
  [opus]=opus
  #[re2]=re2          # needs libstdc++
  [simdutf]=simdutf
  #[snappy]=snappy    # needs libstdc++
  #[woff2]=woff2      # needs libstdc++
  [zlib]=minizip
  [zstd]=zstd
)
_unwanted_bundled_libs=(
  $(printf "%s\n" ${!_system_libs[@]} | sed 's/^libjpeg$/&_turbo/')
)
depends+=(${_system_libs[@]})

# Google API keys (see https://www.chromium.org/developers/how-tos/api-keys)
# Note: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys.
#
# Starting with Chromium 89 (2021-03-02) the OAuth2 credentials have been left
# out: https://archlinux.org/news/chromium-losing-sync-support-in-early-march/
_google_api_key=AIzaSyDwr302FpOSkGRpLlUpPThNTDPbXcIn_FM

prepare() {
  # rustup install nightly

  if (( _manual_clone )); then
    ./fetch-chromium-release $pkgver
  fi
  cd chromium-$pkgver

  # Allow building against system libraries in official builds
  sed -i 's/OFFICIAL_BUILD/GOOGLE_CHROME_BUILD/' \
    tools/generate_shim_headers/generate_shim_headers.py

  # https://crbug.com/893950
  sed -i -e 's/\<xmlMalloc\>/malloc/' -e 's/\<xmlFree\>/free/' \
         -e '1i #include <cstdlib>' \
    third_party/blink/renderer/core/xml/*.cc \
    third_party/blink/renderer/core/xml/parser/xml_document_parser.cc \
    third_party/libxml/chromium/*.cc

  # Use the --oauth2-client-id= and --oauth2-client-secret= switches for
  # setting GOOGLE_DEFAULT_CLIENT_ID and GOOGLE_DEFAULT_CLIENT_SECRET at
  # runtime -- this allows signing into Chromium without baked-in values
  patch -Np1 -i "$srcdir/vulcanium/arch/use-oauth2-client-switches-as-default.patch"

  # Upstream fixes

  # Fixes from Gentoo
  patch -Np1 -i "$srcdir/vulcanium/arch/chromium-138-nodejs-version-check.patch"

  # Allow libclang_rt.builtins from compiler-rt >= 16 to be used
  patch -Np1 -i "$srcdir/vulcanium/arch/compiler-rt-adjust-paths.patch"

  # Increase _FORTIFY_SOURCE level to match Arch's default flags
  patch -Np1 -i "$srcdir/vulcanium/arch/increase-fortify-level.patch"

  # https://crbug.com/456218403
  patch -Np1 -i "$srcdir/vulcanium/arch/chromium-145-fix-SYS_SECCOMP.patch"

  patch -Np1 -i "$srcdir/vulcanium/arch/chromium-147-rust-1.95-bytemuck.patch"

  # enable widevine for arm64
  patch -Np1 -i "$srcdir/vulcanium/arch/enable-widevine-arm64.patch"

  # https://crbug.com/456677057
  patch -Np1 -i "$srcdir/vulcanium/arch/glibc-2.42-baud-rate-fix.patch"

  # Fix issue about missing AVX functions
  # Credit: https://github.com/ungoogled-software/ungoogled-chromium/pull/3837
  patch -Np1 -i "$srcdir/vulcanium/arch/chromium-150-revert-avx-flag-change.patch"

  # To unbundle simdutf
  patch -Np1 -i "$srcdir/vulcanium/arch/chromium-147-simdutf-8.0-base-char.patch"

  patch -Np1 -i "$srcdir/vulcanium/arch/chromium-152-unbundle-minizip-undo-unicode.patch"

  patch -Np1 -i "$srcdir/vulcanium/arch/chromium-152-unbundle-opus-devtools.patch"

  # Use system python3 instead of the hermetic cpython3 interpreter
  # https://github.com/ungoogled-software/ungoogled-chromium/pull/3946
  patch -Np1 -i "$srcdir/vulcanium/arch/chromium-153-hermetic-python.patch"

  # third_party/iamf_tools includes vendored Opus via relative "include/opus.h"
  # paths that only resolve against a real bundled Opus checkout; fix them up
  # for the unbundled system Opus build
  patch -Np1 -i "$srcdir/vulcanium/arch/chromium-153-iamf-tools-unbundled-opus.patch"

  patch -Np1 -i "$srcdir/vulcanium/arch/chromium-155-use-system-esbuild.patch"

  patch -Np1 -i "$srcdir/vulcanium/arch/chromium-158-revert-gn-check-includes.patch"

  patch -Np1 -i "$srcdir/vulcanium/arch/chromium-158-isolatedDeclarations.patch"

  # Work around TypeScript becoming a build dependency: disable tsgo for the
  # WebUI and point devtools at the system tsc binary
  # https://github.com/ungoogled-software/ungoogled-chromium/pull/3966
  patch -Np1 -i "$srcdir/vulcanium/arch/chromium-157-typescript.patch"

  # Apply Vulcanium patches (Vulkan, VkVideo, Wayland, Branding)
  local _vpatch_dir="$srcdir/vulcanium/patches"
  if [[ -f "$_vpatch_dir/series" ]]; then
    while IFS= read -r _line || [[ -n "$_line" ]]; do
      _line="${_line%%#*}"
      _line="${_line//[[:space:]]/}"
      [[ -z "$_line" ]] && continue
      msg2 "Applying Vulcanium patch: $_line"
      patch -Np1 -i "$_vpatch_dir/$_line"
    done < "$_vpatch_dir/series"
  fi

  msg2 "Applying Vulcanium internal logo assets"
  "$srcdir/vulcanium/scripts/apply-branding-icons.sh" vulcanium ./ "$srcdir/vulcanium"

  # The unbundled brotli doesn't provide brotli:headers
  sed -i '/brotli:headers/ d' third_party/pdfium/core/fxcodec/BUILD.gn

  # Link to system tools required by the build
  mkdir -p third_party/node/linux/node-linux-x64/bin \
           third_party/jdk/current/bin \
           third_party/rust-toolchain/bin \
           third_party/dawn/tools/golang/linux-amd64/bin \
           third_party/rust-toolchain/crubit/lib/third_party/

  ln -s /usr/bin/node third_party/node/linux/node-linux-x64/bin/
  ln -s /usr/bin/java third_party/jdk/current/bin/
  if (( !_manual_clone )); then
    ln -s /usr/bin/rustc third_party/rust-toolchain/bin/
    ln -s /usr/bin/go third_party/dawn/tools/golang/linux-amd64/bin/
    ln -s "$srcdir/crubit" third_party/rust-toolchain/crubit/lib/third_party/crubit
  fi

  # remove x86_64 binary and use our own
  rm -f third_party/gperf/cipd/bin/gperf
  ln -s /usr/bin/gperf third_party/gperf/cipd/bin/

  rm -rf third_party/devtools-frontend/src/node_modules/esbuild/
  ln -s /usr/lib/node_modules/esbuild/ third_party/devtools-frontend/src/node_modules/esbuild

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
    # Most bundled libraries live under `third_party/<lib>`, but
    # `double-conversion` is located under `base/third_party/double_conversion`
    local _dir="third_party/$_lib"
    if [[ ! -d "${_dir}" ]]; then
      _dir="base/third_party/${_lib//-/_}"
    fi

    find "$_dir" -type f \
      \! -path "$_dir/chromium/*" \
      \! -path "$_dir/google/*" \
      \! -path "third_party/harfbuzz-ng/utils/hb_scoped.h" \
      \! -regex '.*\.\(gn\|gni\|isolate\)' \
      -delete
  done

  ./build/linux/unbundle/replace_gn_files.py \
    --system-libraries "${!_system_libs[@]}"

  # Generate missing header
  if (( _manual_clone )); then
    python3 build/util/lastchange.py -m DAWN_COMMIT_HASH \
      -s third_party/dawn --revision gpu/webgpu/DAWN_VERSION \
      --header gpu/webgpu/dawn_commit_hash.h
  fi

  cd ../crubit
  cargo fetch --locked --target host-tuple
}

build() {
  make -C chromium-launcher-$_launcher_ver

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

  # /usr for pacman managed rust
  local _rust_sysroot="/usr"

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
    'enable_hangout_services_extension=true'
    'enable_widevine=true'
    'enable_vulkan=true'
    'use_dawn=true'
    'ozone_platform_wayland=true'
    'ozone_platform_x11=true'
    'use_qt5=false'
    'use_qt6=true'
    'moc_qt6_path="/usr/lib/qt6"'
    "google_api_key=\"$_google_api_key\""
    'use_clang_modules=false'
    'rust_crubit_root="//third_party/rust-toolchain/crubit/"'
  )

  if [[ -n ${_system_libs[icu]+set} ]]; then
    _flags+=('icu_use_data_file=false')
  fi

  if (( _system_clang )); then
     local _clang_version=$(
       clang --version | grep -m1 version | sed 's/.* \([0-9]\+\).*/\1/')
     local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

    _flags+=(
      'clang_base_path="/usr"'
      'clang_use_chrome_plugins=false'
      "clang_version=\"$_clang_version\""
      'chrome_pgo_phase=0' # needs newer clang to read the bundled PGO profile
      'v8_metagen_libclang_so="/usr/lib/libclang.so"'
      "v8_metagen_libclang_bindings_dir=\"$_site_packages\""
    )

    # Allow the use of nightly features with stable Rust compiler
    # https://github.com/ungoogled-software/ungoogled-chromium/pull/2696#issuecomment-1918173198
    export RUSTC_BOOTSTRAP=1

    _flags+=(
      "rust_sysroot_absolute=\"$_rust_sysroot\""
      'rust_bindgen_root="/usr"'
      "rustc_version=\"$(rustc --version | awk '{ print $2 ;}')\""
      'added_rust_stdlib_libs=["addr2line","adler2","gimli","miniz_oxide"]'
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

  # Portable x86_64 release builds
  if [[ -n ${VULCANIUM_PORTABLE:-} ]]; then
    CFLAGS=${CFLAGS//-march=native/-march=x86-64 -mtune=generic}
    CXXFLAGS=${CXXFLAGS//-march=native/-march=x86-64 -mtune=generic}
    RUSTFLAGS=${RUSTFLAGS//-C target-cpu=native/}
  fi

  if [[ $CARCH == aarch64 ]] || [[ $CARCH == riscv64 ]]; then
    # On aarch64 and riscv64, certain files (e.g. in libvpx and libyuv) needs to
    # be compiled with additional arch features (e.g. dotprod, sve, sme, rvv)
    # Having an arch setting in the C(XX)FLAGS overrides those
    # and causes compilation failure
    CFLAGS="${CFLAGS/-march=*([^ ]) }"
    CXXFLAGS="${CXXFLAGS/-march=*([^ ]) }"
  fi

  (
    cd ../crubit
    _rustc_libs="$_rust_sysroot/lib/rustlib/$(rustc --print host-tuple)/lib"
    export CARGO_TARGET_DIR=target
    export RUSTC_BOOTSTRAP=1
    export RUSTFLAGS+=" -Clink-args=-Wl,-z,origin -Clink-args=-Wl,-rpath,$_rustc_libs"
    cargo build --frozen --release -p cc_bindings_from_rs --bin cc_bindings_from_rs
    install -Dm755 -t ../chromium-$pkgver/third_party/rust-toolchain/crubit/bin/ target/release/cc_bindings_from_rs
  )
  gn gen out/Release --args="${_flags[*]}"
  ninja -j6 -C out/Release chrome chrome_sandbox chromedriver.unstripped
}

package() {
  cd chromium-$pkgver

  install -Dv out/Release/chrome "$pkgdir/usr/lib/vulcanium/vulcanium"
  install -Dv out/Release/chromedriver.unstripped "$pkgdir/usr/bin/vulcanium-chromedriver"
  install -Dvm4755 out/Release/chrome_sandbox "$pkgdir/usr/lib/vulcanium/chrome-sandbox"

  install -Dvm644 "$srcdir/vulcanium/config/vulcanium-flags.conf" \
    "$pkgdir/etc/vulcanium/default-flags.conf"

  install -dm755 "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/vulcanium" << 'EOF'
#!/usr/bin/env bash
set -euo pipefail

declare -a _flags=()
declare -a _enable_features=()
declare -a _disable_features=()

_push_flag() {
  local tok="$1"
  case "$tok" in
    --enable-features=*)
      local IFS=, feat
      for feat in ${tok#--enable-features=}; do
        case "$feat" in
          VaapiOnNvidiaGPUs|VaapiVideoDecoder|VaapiVideoEncoder|VaapiVideoDecodeLinuxGL|AcceleratedVideoDecodeLinuxGL|"")
            ;;
          *)
            _enable_features+=("$feat")
            ;;
        esac
      done
      ;;
    --disable-features=*)
      _disable_features+=("${tok#--disable-features=}")
      ;;
    *)
      _flags+=("$tok")
      ;;
  esac
}

_read_flags() {
  local f="$1"
  [[ -f "$f" ]] || return 0
  while IFS= read -r line || [[ -n "$line" ]]; do
    line="${line%%#*}"
    [[ -n "${line//[[:space:]]/}" ]] || continue
    for tok in $line; do
      _push_flag "$tok"
    done
  done < "$f"
}

_read_flags "/etc/vulcanium/default-flags.conf"
_read_flags "${XDG_CONFIG_HOME:-$HOME/.config}/vulcanium-flags.conf"
for arg in "$@"; do
  _push_flag "$arg"
done

_disable_features+=("VaapiVideoDecoder,VaapiVideoEncoder,VaapiVideoDecodeLinuxGL,VaapiOnNvidiaGPUs,AcceleratedVideoDecodeLinuxGL")

if (( ${#_enable_features[@]} > 0 )); then
  _flags+=("--enable-features=$(IFS=,; echo "${_enable_features[*]}")")
fi
if (( ${#_disable_features[@]} > 0 )); then
  _flags+=("--disable-features=$(IFS=,; echo "${_disable_features[*]}")")
fi

export CHROME_DESKTOP="vulcanium.desktop"
export CHROME_VERSION_EXTRA="vulcanium"
export CHROME_WRAPPER="$(readlink -f "$0")"
exec /usr/lib/vulcanium/vulcanium "${_flags[@]}"
EOF
  chmod 755 "$pkgdir/usr/bin/vulcanium"

  install -Dvm644 chrome/installer/linux/common/desktop.template \
    "$pkgdir/usr/share/applications/vulcanium.desktop"
  install -Dvm644 chrome/app/resources/manpage.1.in \
    "$pkgdir/usr/share/man/man1/vulcanium.1"
  sed -i \
    -e 's/@@MENUNAME/Vulcanium/g' \
    -e 's/@@PACKAGE/vulcanium/g' \
    -e 's/@@desktop_exec/vulcanium/g' \
    -e 's/@@desktop_icon/vulcanium/g' \
    -e '/^StartupWMClass=/d' \
    -e 's|@@uri_scheme|x-scheme-handler/vulcanium;|g' \
    -e 's/@@extra_desktop_entries//g' \
    "$pkgdir/usr/share/applications/vulcanium.desktop" \
    "$pkgdir/usr/share/man/man1/vulcanium.1"

  # Fill in common Chrome/Chromium AppData template with Vulcanium info
  (
    tmpl_file=chrome/installer/linux/common/appdata.xml.template
    info_file=chrome/installer/linux/common/chromium-browser.info
    . $info_file; PACKAGE=vulcanium
    export $(grep -o '^[A-Z_]*' $info_file)
    sed -E -e 's/@@([A-Z_]*)/\${\1}/g' -e '/<update_contact>/d' $tmpl_file | envsubst
  ) \
  | install -Dvm644 /dev/stdin "$pkgdir/usr/share/metainfo/vulcanium.appdata.xml"

  local toplevel_files=(
    chrome_100_percent.pak
    chrome_200_percent.pak
    chrome_crashpad_handler
    libqt6_shim.so
    resources.pak
    v8_context_snapshot.bin

    # ANGLE
    libEGL.so
    libGLESv2.so

    # SwiftShader ICD
    libvk_swiftshader.so
    libvulkan.so.1
    vk_swiftshader_icd.json
  )

  if [[ -z ${_system_libs[icu]+set} ]]; then
    toplevel_files+=(icudtl.dat)
  fi

  cp "${toplevel_files[@]/#/out/Release/}" "$pkgdir/usr/lib/vulcanium/"
  install -Dvm644 -t "$pkgdir/usr/lib/vulcanium/locales" out/Release/locales/*.pak

  for size in 16 24 32 48 64 128 256; do
    install -Dvm644 "$srcdir/vulcanium/assets/icons/vulcanium/${size}.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/vulcanium.png"
  done
  install -Dvm644 "$srcdir/vulcanium/assets/icons/vulcanium.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/vulcanium.svg"

  install -Dvm644 LICENSE "$pkgdir/usr/share/licenses/vulcanium/LICENSE"
}

# vim:set ts=2 sw=2 et:
