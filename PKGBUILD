# Maintainer: lumexren <lumexren@gmail.com>

pkgname=helcanium
pkgver=158.0.8127.36
pkgrel=2
_launcher_ver=8
_manual_clone=0
_system_clang=1
# Check the CRUBIT_REVISION found in tools/rust/update_rust.py
#_crubit_rev=20dc640430bd60ff2f7f8dbf69c311c5f807adde
# The commit above cannot be built successfully, use the last known good commit for stable toolchain
_crubit_rev=d757594f6f7ac27c0cf9c8ea63d9136f8e1f77ae
# ungoogled chromium variables
pkgdesc="Helium Browser with native Wayland Vulkan rendering and Vulkan Video decoding/encoding"
arch=('x86_64')
url="https://github.com/lumexren/vulcanium"
license=('BSD-3-Clause')
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
provides=('helium-browser')
conflicts=('helcanium-bin')
options=('!lto') # Chromium adds its own flags for ThinLTO
source=("https://tarballs.imput.net/chromium-$pkgver/chromium-$pkgver-base.tar.zst"
        "https://tarballs.imput.net/chromium-$pkgver/chromium-$pkgver-linux-x64.tar.zst"
        "git+https://chromium.googlesource.com/external/github.com/google/crubit.git#commit=$_crubit_rev"
        "git+https://github.com/imputnet/helium-linux.git#tag=0.22.2.1"
        "git+https://github.com/imputnet/helium.git#commit=f32f2c066787492b9ba112dc1be1ad230b53658a"
        https://github.com/foutrelis/chromium-launcher/archive/v$_launcher_ver/chromium-launcher-$_launcher_ver.tar.gz
        "git+https://github.com/lumexren/vulcanium.git")
sha256sums=('0790d05b2ec7be328c373357f2410d21d8f9ca4ab2abd4c3d057dc470fb2497f'
            'e3b64a9847b91176b5158ec3a217b11b9d91253dc3d4282551c956d601e8d22f'
            'fa10e66c8078c2e02cf7e1df0810b7c7d77b89592cc27fca7a756cc4a5ba06cb'
            'SKIP'
            'SKIP'
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
  #[libpng]=libpng
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

  # The unbundled brotli doesn't provide brotli:headers
  sed -i '/brotli:headers/ d' third_party/pdfium/core/fxcodec/BUILD.gn

  rm -rf third_party/devtools-frontend/src/node_modules/esbuild/
  ln -s /usr/lib/node_modules/esbuild/ third_party/devtools-frontend/src/node_modules/esbuild

  if (( !_system_clang )); then
    # Use prebuilt rust as system rust cannot be used due to the error:
    #   error: the option `Z` is only accepted on the nightly compiler
    ./tools/rust/update_rust.py

    # To link to rust libraries we need to compile with prebuilt clang
    ./tools/clang/scripts/update.py
  fi

  # Ungoogled Chromium changes
  _helium_linux="$srcdir/helium-linux"
  _helium_core="$srcdir/helium"
  _utils="${_helium_core}/utils"
  msg2 'Downloading Helium extra dependencies (deps.ini)'
  mkdir -p "$srcdir/helium-dl-cache"
  python "$_utils/downloads.py" retrieve -i "$_helium_core/deps.ini" -c "$srcdir/helium-dl-cache"
  python "$_utils/downloads.py" unpack -i "$_helium_core/deps.ini" -c "$srcdir/helium-dl-cache" ./
  msg2 'Pruning binaries (Helium)'
  python "$_utils/prune_binaries.py" --keep-build-dependencies ./ "$_helium_core/pruning.list" || echo "some errors"
  msg2 'Applying Helium patches'
  python "$_utils/patches.py" apply ./ "$_helium_core/patches" "$_helium_linux/patches"
  msg2 'Applying Helium domain substitution'
  python "$_utils/domain_substitution.py" apply -r "$_helium_core/domain_regex.list" \
    -f "$_helium_core/domain_substitution.list" -c domainsubcache.tar.gz ./
  msg2 'Applying Helium branding & resources'
  python "$_utils/name_substitution.py" --sub -t ./ --backup-path "$srcdir/helium-namesubs"
  python "$_utils/i18n_apply.py" -t ./
  python "$_utils/helium_version.py" --tree "$_helium_core" --platform-tree "$_helium_linux" --chromium-tree ./
  python "$_utils/generate_resources.py" "$_helium_core/resources/generate_resources.txt" "$_helium_core/resources"
  python "$_utils/replace_resources.py" "$_helium_core/resources/helium_resources.txt" "$_helium_core/resources" ./


  # Apply Vulcanium patches (Vulkan, Wayland, VkVideo, hide unsafe-webgpu banner)
  local _vpatch_dir="$srcdir/vulcanium/patches"
  while IFS= read -r _line || [[ -n "$_line" ]]; do
    _line="${_line%%#*}"
    _line="${_line//[[:space:]]/}"
    [[ -z "$_line" ]] && continue
    [[ "$_line" == "branding/0001-vulcanium-branding.patch" ]] && continue
    msg2 "Applying Vulcanium patch: $_line"
    patch -Np1 -i "$_vpatch_dir/$_line"
  done < "$_vpatch_dir/series"

  msg2 "Applying Helcanium branding patch"
  patch -Np1 -i "$_vpatch_dir/branding/0003-helcanium-branding.patch"

  msg2 "Applying Helcanium internal logo assets"
  "$srcdir/vulcanium/scripts/apply-branding-icons.sh" helcanium ./ "$srcdir/vulcanium"

  # Link to system tools required by the build
  mkdir -p third_party/node/linux/node-linux-x64/bin \
           third_party/rust-toolchain/bin \
           third_party/jdk/current/bin \
           third_party/gperf/cipd/bin \
           third_party/dawn/tools/golang/linux-amd64/bin \
           third_party/rust-toolchain/crubit/lib/third_party/ \

  ln -sf /usr/bin/node third_party/node/linux/node-linux-x64/bin/
  ln -sf /usr/bin/java third_party/jdk/current/bin/
  ln -sf /usr/bin/rustc third_party/rust-toolchain/bin/
  ln -sf /usr/bin/gperf third_party/gperf/cipd/bin/
  ln -sf /usr/bin/go third_party/dawn/tools/golang/linux-amd64/bin/
  ln -sfn "$srcdir/crubit" third_party/rust-toolchain/crubit/lib/third_party/crubit

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
    'enable_widevine=true'
    'use_qt5=false'
    'use_qt6=true'
    'moc_qt6_path="/usr/lib/qt6"'
    'use_vaapi=true'
    'enable_platform_hevc=true'
    'enable_hevc_parser_and_hw_decoder=true'
    'use_clang_modules=false'
    'rust_crubit_root="//third_party/rust-toolchain/crubit/"'
  )

  if [[ -n ${_system_libs[icu]+set} ]]; then
    _flags+=('icu_use_data_file=false')
  fi

  # Append Helium flags to _flags array
  _helium_repo="$srcdir/helium"
  readarray -t -O ${#_flags[@]} _flags < "${_helium_repo}/flags.gn"

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

  (
    cd ../crubit
    _rustc_libs="$_rust_sysroot/lib/rustlib/$(rustc --print host-tuple)/lib"
    export CARGO_TARGET_DIR=target
    export RUSTC_BOOTSTRAP=1
    export RUSTFLAGS+=" -Clink-args=-Wl,-z,origin -Clink-args=-Wl,-rpath,$_rustc_libs"
    cargo build --frozen --release -p cc_bindings_from_rs --bin cc_bindings_from_rs
    install -Dm755 -t ../chromium-$pkgver/third_party/rust-toolchain/crubit/bin/ target/release/cc_bindings_from_rs
  )

  msg2 'Configuring Chromium'
  gn gen out/Release --args="${_flags[*]}"
  msg2 'Building Chromium'
  ninja -j6 -C out/Release chrome chrome_sandbox chromedriver
}

package() {
  cd chromium-$pkgver

  install -Dv out/Release/helium "$pkgdir/usr/lib/helcanium/helcanium"
  install -Dv out/Release/chromedriver "$pkgdir/usr/bin/helcanium-chromedriver"
  install -Dvm4755 out/Release/chrome_sandbox "$pkgdir/usr/lib/helcanium/chrome-sandbox"
  install -Dvm644 "$srcdir/vulcanium/config/vulcanium-flags.conf" \
    "$pkgdir/etc/helcanium/default-flags.conf"

  install -dm755 "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/helcanium" << 'EOF'
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

_read_flags "/etc/helcanium/default-flags.conf"
_read_flags "${XDG_CONFIG_HOME:-$HOME/.config}/helcanium-flags.conf"
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

export HELCANIUM_DESKTOP="helcanium.desktop"
export HELIUM_DESKTOP="helcanium.desktop"
export CHROME_DESKTOP="helcanium.desktop"
export CHROME_VERSION_EXTRA="helcanium"
export CHROME_WRAPPER="$(readlink -f "$0")"
exec /usr/lib/helcanium/helcanium "${_flags[@]}"
EOF
  chmod 755 "$pkgdir/usr/bin/helcanium"

  install -Dvm644 chrome/installer/linux/common/desktop.template \
    "$pkgdir/usr/share/applications/helcanium.desktop"
  install -Dvm644 chrome/app/resources/manpage.1.in \
    "$pkgdir/usr/share/man/man1/helcanium.1"
  sed -i \
    -e 's/@@MENUNAME/Helcanium/g' \
    -e 's/@@PACKAGE/helcanium/g' \
    -e 's/@@desktop_exec/helcanium/g' \
    -e 's/@@desktop_icon/helcanium/g' \
    -e '/^StartupWMClass=/d' \
    -e 's|@@uri_scheme|x-scheme-handler/helcanium;|g' \
    -e 's/@@extra_desktop_entries//g' \
    "$pkgdir/usr/share/applications/helcanium.desktop" \
    "$pkgdir/usr/share/man/man1/helcanium.1"

  # Fill in common Chrome/Chromium AppData template with Chromium info
  (
    tmpl_file=chrome/installer/linux/common/appdata.xml.template
    info_file=chrome/installer/linux/common/chromium-browser.info
    . $info_file; PACKAGE=helcanium
    export $(grep -o '^[A-Z_]*' $info_file)
    sed -E -e 's/@@([A-Z_]*)/\${\1}/g' -e '/<update_contact>/d' $tmpl_file | envsubst
  ) \
  | install -Dvm644 /dev/stdin "$pkgdir/usr/share/metainfo/helcanium.appdata.xml"

  local toplevel_files=(
    chrome_100_percent.pak
    chrome_200_percent.pak
    helium_crashpad_handler
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

  cp "${toplevel_files[@]/#/out/Release/}" "$pkgdir/usr/lib/helcanium/"
  install -Dvm644 -t "$pkgdir/usr/lib/helcanium/locales" out/Release/locales/*.pak

  for size in 16 24 32 48 64 128 256; do
    install -Dvm644 "$srcdir/vulcanium/assets/icons/helcanium/${size}.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/helcanium.png"
  done
  install -Dvm644 "$srcdir/vulcanium/assets/icons/helcanium.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/helcanium.svg"

  install -Dvm644 LICENSE "$pkgdir/usr/share/licenses/helcanium/LICENSE"
}

# vim:set ts=2 sw=2 et:
