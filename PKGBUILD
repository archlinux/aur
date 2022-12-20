# Maintainer: Caleb Maclennana <caleb@alerque.com>
# Contributor: Caesar Woo <caesar.wu@outlook.com>
# Contributor: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
# Contributor: Monarc <warcraft99@web.de>
# Contributor: Joan Figueras <ffigue at gmail dot com>
# Contributor: Jacek Szafarkiewicz <szafar@linux.pl>
# Contributor: Maxim Baz <$pkgname at maximbaz dot com>

## General Brave build info
## https://github.com/brave/brave-browser/blob/master/README.md#clone-and-initialize-the-repo

## The following variables can be customized at build time. Use env or export to change at your wish
##
##   Example use: `USE_SCCACHE=1 COMPONENT=1 makepkg -sc`
##
## USE_SCCACHE variable
## sccache for faster builds - https://github.com/brave/brave-browser/wiki/sccache-for-faster-builds
## Valid numbers between: 0 and 1
## Default is: 0 => not use sccache
: "${USE_SCCACHE:=0}"
##
## COMPONENT variable
## 0 -> build normal (with debug symbols)
## 1 -> release (default)
## 2 -> static
## 3 -> debug
## 4 -> release with custom cflags and system libs
: "${COMPONENT:=4}"

pkgname=brave
pkgver=1.46.144
pkgrel=1
pkgdesc='A web browser that stops ads and trackers by default'
arch=(x86_64)
url='https://www.brave.com/download'
license=(BSD MPL custom:chromium)
depends=(alsa-lib
         dbus
         desktop-file-utils
         gtk3
         hicolor-icon-theme
         libcups
         libgcrypt
         libpulse
         libva
         libxss
         nss
         pciutils
         systemd
         ttf-liberation
         xdg-utils)
makedepends=(cargo-audit
             cbindgen
             clang
             cxxbridge
             git
             gn
             gperf
             java-runtime-headless
             jq
             lld
             'llvm-git'
             ninja
             npm
             pipewire
             qt5-base
             python-protobuf)
optdepends=('pipewire: WebRTC desktop sharing under Wayland'
            'kdialog: support for native dialogs in Plasma'
            'org.freedesktop.secrets: password storage backend'
            'qt5-base: enable Qt5 with --enable-features=AllowQt')
_chromium_ver=108.0.5359.128
_gcc_patchset=2
_patchset_name="chromium-${_chromium_ver%%.*}-patchset-$_gcc_patchset"
_launcher_ver=8
_brave_base_ver="1.28"
_brave_patchset="1"
_brave_patchset_name="brave-$_brave_base_ver-patches-$_brave_patchset"
source=("brave-browser::git+https://github.com/brave/brave-browser.git#tag=v$pkgver"
        "brave::git+https://github.com/brave/brave-core.git#tag=v$pkgver"
        "chromium::git+https://github.com/chromium/chromium.git#tag=$_chromium_ver"
        'depot_tools::git+https://chromium.googlesource.com/chromium/tools/depot_tools.git'
        "https://github.com/foutrelis/chromium-launcher/archive/refs/tags/v$_launcher_ver/chromium-launcher-$_launcher_ver.tar.gz"
        "https://github.com/stha09/chromium-patches/releases/download/$_patchset_name/$_patchset_name.tar.xz"
        "https://gitlab.com/hadogenes/brave-patches/-/archive/$_brave_patchset_name/brave-patches-$_brave_patchset_name.zip"
        chromium-launcher-electron-app.patch
        chromium-launcher-vendor.patch
        system-rust-utils.patch
        brave-1.43-bat-native-ads-hash_vectorizer_fix-cstring.patch
        brave-1.43-bat-native-ads-vector_data_fix-cmath.patch
        brave-1.43-bitcoin-core_remove-serialize.h.patch
        brave-1.43-brave_today-base_utf_string_conversions.patch
        brave-1.43-debounce-debounce_navigation_throttle_fix.patch
        brave-1.43-ntp_background_images-std-size_t.patch)
_arch_revision=0cfb1b8e921c83e78f1909a6640b6eaa66388679
_patches=(re-fix-TFLite-build-error-on-linux-with-system-zlib.patch
          chromium-icu72.patch
          v8-enhance-Date-parser-to-take-Unicode-SPACE.patch
          REVERT-roll-src-third_party-ffmpeg-m102.patch
          REVERT-roll-src-third_party-ffmpeg-m106.patch
          disable-GlobalMediaControlsCastStartStop.patch
          angle-wayland-include-protocol.patch
          use-oauth2-client-switches-as-default.patch)
for _patch in "${_patches[@]}"; do
  source+=("https://raw.githubusercontent.com/archlinux/svntogit-packages/$_arch_revision/trunk/$_patch")
done
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '213e50f48b67feb4441078d50b0fd431df34323be15be97c55302d3fdac4483a'
            '40ef8af65e78901bb8554eddbbb5ebc55c0b8e7927f6ca51b2a353d1c7c50652'
            'c63c8eeac709293991418a09ac7d8c0adde10c151495876794e025bd2b0fb8fe'
            '9235485adc4acbfaf303605f4428a6995a7b0b3b5a95181b185afbcb9f1f6ae5'
            '404bf09df39310a1e374c5e7eb9c7311239798adf4e8cd85b7ff04fc79647f88'
            'f4345b63200a8bcf00876fa2f6eba99c49c97af1b6253b159072fbfad8fefeef'
            'a4ed0ad8f4931bae08c42a20266b8e2f934f21811fe0892960798f14a1fcfd0b'
            '5c1e562b25d4fe614f3a77e00accc53001541b7b3f308fb7512cce1138878d7e'
            '0b5764355b9201d201b1e08f700bbb5a7fa238bef127b95d36cbf8ce2afa73a6'
            'ca7f3edbf17aeca84ec595b0cedcca47fb098fa8600651dcea6b396af3af8d93'
            '30a6a9ca2a6dd965cb2d9f02639079130948bf45d483f0c629f2cf8394a1c22f'
            'ea0cd714ccaa839baf7c71e9077264016aa19415600f16b77d5398fd49f5a70b'
            '9015b9d6d5b4c1e7248d6477a4b4b6bd6a3ebdc57225d2d8efcd79fc61790716'
            'dabb5ab204b63be73d3c5c8b7c1fa74053105a285852ba3bbc4fb77646608572'
            'b83406a881d66627757d9cbc05e345cbb2bd395a48b6d4c970e5e1cb3f6ed454'
            '30df59a9e2d95dcb720357ec4a83d9be51e59cc5551365da4c0073e68ccdec44'
            '4c12d31d020799d31355faa7d1fe2a5a807f7458e7f0c374adf55edb37032152'
            '7f3b1b22d6a271431c1f9fc92b6eb49c6d80b8b3f868bdee07a6a1a16630a302'
            'cd0d9d2a1d6a522d47c3c0891dabe4ad72eabbebc0fe5642b9e22efa3d5ee572'
            'e393174d7695d0bafed69e868c5fbfecf07aa6969f3b64596d0bae8b067e1711')

# Possible replacements are listed in build/linux/unbundle/replace_gn_files.py
# Keys are the names in the above script; values are the dependencies in Arch
declare -gA _system_libs=(
    [brotli]=brotli
    [dav1d]=dav1d
    [ffmpeg]=ffmpeg
    [flac]=flac
    [fontconfig]=fontconfig
    [freetype]=freetype2
    [harfbuzz-ng]=harfbuzz
    [icu]=icu
    [jsoncpp]=jsoncpp
    [libaom]=aom
    [libavif]=libavif
    [libdrm]=
    [libjpeg]=libjpeg
    [libpng]=libpng
    #[libvpx]=libvpx
    [libwebp]=libwebp
    [libxml]=libxml2
    [libxslt]=libxslt
    [opus]=opus
    [re2]=re2
    [snappy]=snappy
    [woff2]=woff2
    [zlib]=minizip
)
_unwanted_bundled_libs=(
  "$(printf "%s\n" ${!_system_libs[@]} | sed 's/^libjpeg$/&_turbo/')"
)
for _dep in "${_system_libs[@]}"; do
  depends+=($_dep)
done

prepare() {
  cd chromium-launcher-$_launcher_ver
  patch -Np1 -i ../chromium-launcher-electron-app.patch
  patch -Np1 -i ../chromium-launcher-vendor.patch

  cd ../brave-browser

  export RUSTUP_TOOLCHAIN=stable

  export DEPOT_TOOLS_UPDATE=0
  export PATH="${PATH}:${srcdir:?}/depot_tools"

  echo "Prepare the environment..."
  npm install

  cp -r ../brave src
  cp -r ../depot_tools src/brave/vendor

  cd src/brave || exit

  if [ "$COMPONENT" = "4" ]; then
    patch -Np1 -i "${srcdir}/system-rust-utils.patch"
  fi

  jq ".config.projects.chrome.repository.url = \"file://${srcdir}/chromium@${_chromium_ver}\"" package.json > tmp.json
  mv {tmp,package}.json

  npm install

  cd ../..

  echo "Running \"npm run\""
  if [ -d src/out/Release ]; then
    npm run sync -- --force --nohooks
  else
    npm run init -- --nohooks
  fi

  echo "Running hooks..."
  # python "${srcdir}/depot_tools/gclient.py" runhooks
  src/build/landmines.py
  src/build/util/lastchange.py -o src/build/util/LASTCHANGE
  src/build/util/lastchange.py -m GPU_LISTS_VERSION \
    --revision-id-only --header src/gpu/config/gpu_lists_version.h
  src/build/util/lastchange.py -m SKIA_COMMIT_HASH \
    -s src/third_party/skia --header src/skia/ext/skia_commit_hash.h
  src/build/util/lastchange.py -s src/third_party/dawn \
    --revision src/gpu/webgpu/DAWN_VERSION
  # Create sysmlink to system clang-format
  ln -sf /usr/bin/clang-format src/buildtools/linux64
  # Create sysmlink to system Node.js
  mkdir -p src/third_party/node/linux/node-linux-x64/bin
  ln -sf /usr/bin/node src/third_party/node/linux/node-linux-x64/bin
  src/third_party/depot_tools/download_from_google_storage.py \
    --no_resume --extract --no_auth --bucket chromium-nodejs \
    -s src/third_party/node/node_modules.tar.gz.sha1
  python src/tools/download_optimization_profile.py \
    --newest_state=src/chrome/android/profiles/newest.txt \
    --local_state=src/chrome/android/profiles/local.txt \
    --output_name=src/chrome/android/profiles/afdo.prof \
    --gs_url_base=chromeos-prebuilt/afdo-job/llvm
  # ln -s /usr/bin/java third_party/jdk/current/bin

  # Brave specific hooks
  cd src/brave
  # python script/bootstrap.py
  echo > vendor/depot_tools/python3_bin_reldir.txt
  ln -sf /usr/bin/python vendor/depot_tools/python3
  npm install --no-save --yes
  python script/web_discovery_project.py --install
  python script/generate_licenses.py
  cd ../..

  echo "Apply Chromium patches..."
  cd src

  # https://crbug.com/893950
  sed -i -e 's/\<xmlMalloc\>/malloc/' -e 's/\<xmlFree\>/free/' \
    third_party/blink/renderer/core/xml/*.cc \
    third_party/blink/renderer/core/xml/parser/xml_document_parser.cc \
    third_party/libxml/chromium/*.cc \
    third_party/maldoca/src/maldoca/ole/oss_utils.h

  # Use the --oauth2-client-id= and --oauth2-client-secret= switches for
  # setting GOOGLE_DEFAULT_CLIENT_ID and GOOGLE_DEFAULT_CLIENT_SECRET at
  # runtime -- this allows signing into Chromium without baked-in values
  patch -Np1 -i "${srcdir}/use-oauth2-client-switches-as-default.patch"

  # Upstream fixes
  patch -Np1 -i "${srcdir}/re-fix-TFLite-build-error-on-linux-with-system-zlib.patch"
  patch -Np1 -i "${srcdir}/chromium-icu72.patch"
  patch -Np1 -d v8 <"${srcdir}/v8-enhance-Date-parser-to-take-Unicode-SPACE.patch"

  # Revert ffmpeg roll requiring new channel layout API support
  # https://crbug.com/1325301
  patch -Rp1 -i "${srcdir}/REVERT-roll-src-third_party-ffmpeg-m102.patch"
  # Revert switch from AVFrame::pkt_duration to AVFrame::duration
  patch -Rp1 -i "${srcdir}/REVERT-roll-src-third_party-ffmpeg-m106.patch"

  # Disable kGlobalMediaControlsCastStartStop by default
  # https://crbug.com/1314342
  patch -Np1 -i "${srcdir}/disable-GlobalMediaControlsCastStartStop.patch"

  # https://crbug.com/angleproject/7582
  patch -Np0 -i "${srcdir}/angle-wayland-include-protocol.patch"

  # Fixes for building with libstdc++ instead of libc++
  patch -Np1 -i "${srcdir}/patches/chromium-103-VirtualCursor-std-layout.patch"

  # Hacky patching
  sed -e 's/\(enable_distro_version_check =\) true/\1 false/g' -i chrome/installer/linux/BUILD.gn

  # Allow building against system libraries in official builds
  if [ "$COMPONENT" = "4" ]; then
    sed -i 's/OFFICIAL_BUILD/GOOGLE_CHROME_BUILD/' \
      tools/generate_shim_headers/generate_shim_headers.py

    echo "Add patches for custom build"
    rm "$srcdir/brave-patches-$_brave_patchset_name"/brave-*logging*.patch
    rm "$srcdir/brave-patches-$_brave_patchset_name"/brave-*ads-dismissed*.patch
    rm "$srcdir/brave-patches-$_brave_patchset_name"/brave-*ads-hash*.patch
    rm "$srcdir/brave-patches-$_brave_patchset_name"/brave-*ads-vector*.patch
    rm "$srcdir/brave-patches-$_brave_patchset_name"/brave-*ads-ad*.patch
    rm "$srcdir/brave-patches-$_brave_patchset_name"/brave-*ads-eligible*.patch
    rm "$srcdir/brave-patches-$_brave_patchset_name"/brave-*bitcoin*.patch
    for _patch in "$srcdir/brave-patches-$_brave_patchset_name"/*.patch; do
      patch -Np1 -i "$_patch"
    done
    for _patch in "$srcdir/brave"*.patch; do
      patch -Np1 -i "$_patch"
    done

    # Remove bundled libraries for which we will use the system copies; this
    # *should* do what the remove_bundled_libraries.py script does, with the
    # added benefit of not having to list all the remaining libraries and
    # preserving their git directories
    local _lib
    for _lib in ${_unwanted_bundled_libs[@]}; do
      find "third_party/$_lib" -type f \
        \! -path "third_party/$_lib/chromium/*" \
        \! -path "third_party/$_lib/google/*" \
        \! -path "third_party/harfbuzz-ng/utils/hb_scoped.h" \
        \! -regex '.*\.\(git.*\|gn\|gni\|isolate\)' \
        -delete
    done

    ./build/linux/unbundle/replace_gn_files.py \
      --system-libraries "${!_system_libs[@]}"
  fi
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  make CHROMIUM_APP=Brave CHROMIUM_NAME=brave -C chromium-launcher-$_launcher_ver

  cd "brave-browser"

  if check_buildoption ccache y; then
    # Avoid falling back to preprocessor mode when sources contain time macros
    export CCACHE_SLOPPINESS=time_macros
  fi

  export PATH="${PATH}:${srcdir:?}/brave-browser/src/brave/vendor/depot_tools"

  export CC=clang
  export CXX=clang++
  export AR=llvm-ar
  export NM=llvm-nm

  if [ "$USE_SCCACHE" -eq "1" ]; then
    echo "sccache = /usr/bin/sccache" >> .npmrc
  fi

  echo "brave_services_key = qjVKcxtUybh8WpKNoQ7EbgbkJTMu7omjDHKk=VrPApb8PwJyPE9eqchxedTsMEWg" > .npmrc
  echo "brave_variations_server_url = https://variations.brave.com/seed" >> .npmrc
  echo "brave_stats_updater_url = https://laptop-updates.brave.com" >> .npmrc
  echo "brave_stats_api_key = fe033168-0ff8-4af6-9a7f-95e2cbfc9f4f" >> .npmrc
  echo "brave_sync_endpoint = https://sync-v2.brave.com/v2" >> .npmrc
  echo "updater_dev_endpoint = https://go-updater-dev.bravesoftware.com/extensions" >> .npmrc
  echo "updater_prod_endpoint = https://go-updater.brave.com/extensions" >> .npmrc
  echo "rewards_grant_dev_endpoint = https://grant.rewards.brave.com" >> .npmrc
  echo "rewards_grant_staging_endpoint = https://grant.rewards.brave.com" >> .npmrc
  echo "rewards_grant_prod_endpoint = https://grant.rewards.brave.com" >> .npmrc
  echo "uphold_client_id = 6d8d9473ed20be627f71ed46e207f40c004c5b1a" >> .npmrc
  echo "uphold_client_secret = xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" >> .npmrc
  echo "uphold_staging_client_id = 4c2b665ca060d912fec5c735c734859a06118cc8" >> .npmrc
  echo "uphold_staging_client_secret = xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" >> .npmrc
  echo "gemini_api_url = https://api.gemini.com/v1" >> .npmrc
  echo "gemini_oauth_url = https://api.gemini.com/v1/oauth" >> .npmrc
  echo "gemini_wallet_client_id = 6d8d9473ed20be627f71ed46e207f40c004c5b1a" >> .npmrc
  echo "gemini_wallet_client_secret = xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" >> .npmrc
  echo "sardine_client_id = 7ca8433c-7e61-4e25-b76e-25aa2da68df1" >> .npmrc
  echo "sardine_client_secret = 7ca8433c-7e61-4e25-b76e-25aa2da68df1" >> .npmrc

  npm_args=()
  if [ "$COMPONENT" = "4" ]; then
    local _flags=(
      'custom_toolchain="//build/toolchain/linux/unbundle:default"'
      'host_toolchain="//build/toolchain/linux/unbundle:default"'
      'clang_base_path="/usr"'
      'clang_use_chrome_plugins=false'
      'symbol_level=0' # sufficient for backtraces on x86(_64)
      'chrome_pgo_phase=0' # needs newer clang to read the bundled PGO profile
      'treat_warnings_as_errors=false'
      'disable_fieldtrial_testing_config=true'
      'blink_enable_generated_code_formatting=false'
      'ffmpeg_branding="Chrome"'
      'proprietary_codecs=true'
      'rtc_use_pipewire=true'
      'link_pulseaudio=true'
      'use_gnome_keyring=false'
      'use_sysroot=false'
      'use_system_libwayland=true'
      'use_system_wayland_scanner=true'
      'use_custom_libcxx=false'
      'enable_hangout_services_extension=true'
      'enable_widevine=true'
      'enable_nacl=false'
      'use_vaapi=true'
    )
    _flags+=("rustup_path=\"$HOME/.rustup\"" "cargo_path=\"$HOME/.cargo\"")

    if [[ -n ${_system_libs[icu]+set} ]]; then
      _flags+=('icu_use_data_file=false')
    fi

    # This specific tool requires to be built outside of an official build
    echo "${_flags[@]}" | tr ' ' '\n' >> src/brave/tools/redirect_cc/args.gni

    _flags+=('is_official_build=true') # implies is_cfi=true on x86_64

    # Facilitate deterministic builds (taken from build/config/compiler/BUILD.gn)
    CFLAGS+='   -Wno-builtin-macro-redefined'
    CXXFLAGS+=' -Wno-builtin-macro-redefined'
    CPPFLAGS+=' -D__DATE__=  -D__TIME__=  -D__TIMESTAMP__='

    # Do not warn about unknown warning options
    CFLAGS+='   -Wno-unknown-warning-option'
    CXXFLAGS+=' -Wno-unknown-warning-option'

    npm_args+=(
      $(echo "${_flags[@]}" | tr ' ' '\n' | sed -e 's/=/:/' -e 's/^/--gn=/')
    )
  fi

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

  ## See explanation on top to select your build
  case $COMPONENT in
    0)
    echo "Normal build (with debug)"
    npm run build
    npm run build -- --target chrome_sandbox
    npm run build -- --target chromedriver.unstripped
    ;;
    2)
    echo "Static build"
    npm run build Static
    npm run build Static -- --target chrome_sandbox
    npm run build Static -- --target chromedriver.unstripped
    ;;
    3)
    echo "Debug build"
    npm run build Debug
    npm run build Debug -- --target chrome_sandbox
    npm run build Debug -- --target chromedriver.unstripped
    ;;
    4)
    echo "Release custom build"
    npm run build Release -- "${npm_args[@]}"
    npm run build Release -- --target chrome_sandbox "${npm_args[@]}"
    npm run build Release -- --target chromedriver.unstripped "${npm_args[@]}"
    ;;
    1|*)
    echo "Release build"
    npm run build Release
    npm run build Release -- --target chrome_sandbox
    npm run build Release -- --target chromedriver.unstripped
    ;;
  esac
}

package() {
  cd chromium-launcher-$_launcher_ver
  export RUSTUP_TOOLCHAIN=stable
  make PREFIX=/usr DESTDIR="$pkgdir" CHROMIUM_NAME=brave install

  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.launcher"

  install -d -m0755 "$pkgdir/usr/lib/$pkgname/"{,locales,resources}

  # Copy necessary release files
  cd ../brave-browser/src

  install -Dm755 out/Release/$pkgname "$pkgdir/usr/lib/$pkgname/$pkgname"
  install -Dm755 out/Release/chromedriver.unstripped "$pkgdir/usr/bin/bravedriver"
  install -Dm4755 out/Release/chrome_sandbox "$pkgdir/usr/lib/$pkgname/chrome-sandbox"
  ln -s $pkgname "$pkgdir/usr/bin/$pkgname-browser"
  ln -s $pkgname "$pkgdir/usr/lib/$pkgname/$pkgname-browser"

  install -Dm644 chrome/installer/linux/common/desktop.template \
    "$pkgdir/usr/share/applications/$pkgname-browser.desktop"
  sed -i \
    -e 's/@@MENUNAME@@/Brave/g' \
    -e 's/@@PACKAGE@@/brave/g' \
    -e 's/@@USR_BIN_SYMLINK_NAME@@/brave/g' \
    "$pkgdir/usr/share/applications/$pkgname-browser.desktop"

  install -Dm644 chrome/installer/linux/common/chromium-browser/chromium-browser.appdata.xml \
    "$pkgdir/usr/share/metainfo/$pkgname-browser.appdata.xml"
  sed -ni \
    -e 's/chromium-browser\.desktop/brave-browser.desktop/' \
    -e '/<update_contact>/d' \
    -e '/<p>/N;/<p>\n.*\(We invite\|Chromium supports Vorbis\)/,/<\/p>/d' \
    -e '/^<?xml/,$p' \
    "$pkgdir/usr/share/metainfo/$pkgname-browser.appdata.xml"

  local toplevel_files=(
    brave_100_percent.pak
    brave_200_percent.pak
    brave_resources.pak

    # Chromium
    chrome_100_percent.pak
    chrome_200_percent.pak
    chrome_crashpad_handler
    libqt5_shim.so
    resources.pak
    v8_context_snapshot.bin

    # ANGLE
    libEGL.so
    libGLESv2.so

    # SwiftShader ICD
    libvk_swiftshader.so
    vk_swiftshader_icd.json
  )

  if [[ -z ${_system_libs[icu]+set} ]]; then
    toplevel_files+=(icudtl.dat)
  fi

  cp "${toplevel_files[@]/#/out/Release/}" "$pkgdir/usr/lib/$pkgname/"
  install -Dm644 -t "$pkgdir/usr/lib/$pkgname/locales" out/Release/locales/*.pak
  install -Dm644 -t "$pkgdir/usr/lib/$pkgname/MEIPreload" out/Release/MEIPreload/*.*

  cp -r out/Release/resources/brave_* "$pkgdir/usr/lib/$pkgname/resources/"

  for size in 24 48 64 128 256; do
    install -Dm644 "chrome/app/theme/chromium/product_logo_$size.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$pkgname.png"
  done

  for size in 16 32; do
    install -Dm644 "chrome/app/theme/default_100_percent/chromium/product_logo_$size.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$pkgname.png"
  done

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.chromium"
  install -Dm0644 brave/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
