# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>
# Maintainer: Seppia <seppia@seppio.fish>
# Maintainer: JustKidding <jk@vin.ovh>

# Based on extra/chromium, with ungoogled-chromium patches

# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=ungoogled-chromium-xdg
pkgver=117.0.5938.149
pkgrel=1
_launcher_ver=8
_gcc_patchset=116-patchset-2
_manual_clone=0
pkgdesc="A lightweight approach to removing Google web service dependency - without creating a useless ~/.pki directory"
arch=('x86_64')
url="https://github.com/ungoogled-software/ungoogled-chromium"
license=('BSD')
depends=('gtk3' 'nss' 'alsa-lib' 'xdg-utils' 'libxss' 'libcups' 'libgcrypt'
         'ttf-liberation' 'systemd' 'dbus' 'libpulse' 'pciutils' 'libva'
         'wayland' 'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('python' 'gn' 'ninja' 'clang' 'lld' 'gperf' 'nodejs' 'pipewire'
             'qt5-base' 'java-runtime-headless' 'git')
optdepends=('pipewire: WebRTC desktop sharing under Wayland'
            'kdialog: support for native dialogs in Plasma'
            'qt5-base: enable Qt5 with --enable-features=AllowQt'
            'org.freedesktop.secrets: password storage backend on GNOME / Xfce'
            'kwallet: support for storing passwords in KWallet on Plasma')
options=('!lto') # Chromium adds its own flags for ThinLTO
source=(https://commondatastorage.googleapis.com/chromium-browser-official/chromium-$pkgver.tar.xz
        https://github.com/foutrelis/chromium-launcher/archive/v$_launcher_ver/chromium-launcher-$_launcher_ver.tar.gz
        https://github.com/stha09/chromium-patches/releases/download/chromium-$_gcc_patchset/chromium-$_gcc_patchset.tar.xz
        add-memory-for-std-unique_ptr-in-third_party-ip.patch
        roll-src-third_party-libavif-src-b33d9ebfc.676aded35.patch
        free-the-X11-pixmap-in-the-NativePixmapEGLX11Bind.patch
        REVERT-disable-autoupgrading-debug-info.patch
        material-color-utilities-cmath.patch
        use-oauth2-client-switches-as-default.patch
        xdg-basedir.patch
        no-omnibox-suggestion-autocomplete.patch
        index.html)
sha256sums=('ddd7c852bd191c0917ab800655da341e7583c2377ca220ae077fc5de7fc7d9df'
            '213e50f48b67feb4441078d50b0fd431df34323be15be97c55302d3fdac4483a'
            '25ad7c1a5e0b7332f80ed15ccf07d7e871d8ffb4af64df7c8fef325a527859b0'
            '7b9708f0dbfd697be7043d3cfe52da991185aa0ee29a3b8263506cd3ae4d41a9'
            '30841fbe0785f8df584eeaa86584fe75f89da26e71df80cf536887557ddef0b6'
            'ab1eb107ec1c915065dc59cf4832da27e17d60eb29038e2aec633daeb946cc6a'
            '1b782b0f6d4f645e4e0daa8a4852d63f0c972aa0473319216ff04613a0592a69'
            '55e6097d347be40cffebf3ce13ba84ea92d940f60865f1bd7c9af1ef2a2ef8e1'
            'e393174d7695d0bafed69e868c5fbfecf07aa6969f3b64596d0bae8b067e1711'
            'f97e6cd3c4d2e04f5d9a0ea234fe768d6ba0fa9f4ecd5c7b2ca91030a1249078'
            'ff1591fa38e0ede7e883dc7494b813641b7a1a7cb1ded00d9baaee987c1dbea8'
            'a4cdd2b86f32d5302c2792be841ff40d982b19bb58a4e63df9d77f4c706b8665')

if (( _manual_clone )); then
  source[0]=fetch-chromium-release
  makedepends+=('python-httplib2' 'python-pyparsing' 'python-six')
fi

provides=("chromium=${pkgver}" "chromedriver=${pkgver}")
conflicts=('chromium' 'chromedriver')
_uc_usr=ungoogled-software
_uc_ver=$pkgver-1
source=(${source[@]}
        ${pkgname%-*}-$_uc_ver.tar.gz::https://github.com/$_uc_usr/ungoogled-chromium/archive/refs/tags/$_uc_ver.tar.gz)
        # ${pkgname%-*}-$_uc_ver.zip::https://github.com/Ahrotahn/${pkgname%-*}/archive/refs/heads/update.zip)
sha256sums=(${sha256sums[@]}
            '0afcc1fef6e18c612e7a25c65f08b98d0db3e621c80ff855cbfd5a791b6ad03a')

# Possible replacements are listed in build/linux/unbundle/replace_gn_files.py
# Keys are the names in the above script; values are the dependencies in Arch
declare -gA _system_libs=(
  #[brotli]=brotli
  [dav1d]=dav1d
  [ffmpeg]=ffmpeg
  [flac]=flac
  [fontconfig]=fontconfig
  [freetype]=freetype2
  [harfbuzz-ng]=harfbuzz
  [icu]=icu
  [jsoncpp]=jsoncpp
  #[libaom]=aom
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
  if (( _manual_clone )); then
    ./fetch-chromium-release $pkgver
  fi
  cd "$srcdir/chromium-$pkgver"

  # Allow building against system libraries in official builds
  sed -i 's/OFFICIAL_BUILD/GOOGLE_CHROME_BUILD/' \
    tools/generate_shim_headers/generate_shim_headers.py

  # https://crbug.com/893950
  sed -i -e 's/\<xmlMalloc\>/malloc/' -e 's/\<xmlFree\>/free/' \
    third_party/blink/renderer/core/xml/*.cc \
    third_party/blink/renderer/core/xml/parser/xml_document_parser.cc \
    third_party/libxml/chromium/*.cc \
    third_party/maldoca/src/maldoca/ole/oss_utils.h

  # Use the --oauth2-client-id= and --oauth2-client-secret= switches for
  # setting GOOGLE_DEFAULT_CLIENT_ID and GOOGLE_DEFAULT_CLIENT_SECRET at
  # runtime -- this allows signing into Chromium without baked-in values
  patch -Np1 -i ../use-oauth2-client-switches-as-default.patch

  # Upstream fixes
  patch -Np1 -i ../add-memory-for-std-unique_ptr-in-third_party-ip.patch
  patch -Np1 -i ../roll-src-third_party-libavif-src-b33d9ebfc.676aded35.patch
  patch -Np1 -i ../free-the-X11-pixmap-in-the-NativePixmapEGLX11Bind.patch


  # Revert addition of compiler flag that needs newer clang
  patch -Rp1 -i ../REVERT-disable-autoupgrading-debug-info.patch

  # Build fixes
  patch -Np0 -i ../material-color-utilities-cmath.patch

  # Fixes for building with libstdc++ instead of libc++
  patch -Np1 -i ../patches/chromium-114-ruy-include.patch
  patch -Np1 -i ../patches/chromium-114-vk_mem_alloc-include.patch
  patch -Np1 -i ../patches/chromium-114-maldoca-include.patch


  # Custom Patches

  # move ~/.pki directory to ${XDG_DATA_HOME:-$HOME/.local}/share/pki
  patch -p1 -i ../xdg-basedir.patch

  # You can now set '1' in the flag #omnibox-ui-max-autocomplete-matches to
  # effectively disable autocompletion in the url bar (and therefore the so-
  # called 'shoulder surfing').
  patch -p1 -i ../no-omnibox-suggestion-autocomplete.patch


  # Ungoogled Chromium changes
  if [[ -d "$srcdir/${pkgname%xdg*}$_uc_ver" ]]
  then
    _ungoogled_repo="$srcdir/${pkgname%xdg*}$_uc_ver"
  else
    _ungoogled_repo="$srcdir/${pkgname%xdg*}update"
  fi
  _utils="${_ungoogled_repo}/utils"
  msg2 'Pruning binaries'
  python "$_utils/prune_binaries.py" ./ "$_ungoogled_repo/pruning.list"
  msg2 'Applying patches'
  python "$_utils/patches.py" apply ./ "$_ungoogled_repo/patches"
  msg2 'Applying domain substitution'
  python "$_utils/domain_substitution.py" apply -r "$_ungoogled_repo/domain_regex.list" \
    -f "$_ungoogled_repo/domain_substitution.list" -c domainsubcache.tar.gz ./

  # Link to system tools required by the build
  mkdir -p third_party/node/linux/node-linux-x64/bin
  ln -s /usr/bin/node third_party/node/linux/node-linux-x64/bin/
  ln -s /usr/bin/java third_party/jdk/current/bin/

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
}

build() {
  make -C chromium-launcher-$_launcher_ver

  cd "$srcdir/chromium-$pkgver"

  export CC=clang
  export CXX=clang++
  export AR=ar
  export NM=nm

  local _flags=(
    'custom_toolchain="//build/toolchain/linux/unbundle:default"'
    'host_toolchain="//build/toolchain/linux/unbundle:default"'
    'clang_base_path="/usr"'
    'is_official_build=true' # implies is_cfi=true on x86_64
    'symbol_level=0' # sufficient for backtraces on x86(_64)
    #'chrome_pgo_phase=0' # needs newer clang to read the bundled PGO profile
    'disable_fieldtrial_testing_config=true'
    'blink_enable_generated_code_formatting=false'
    'ffmpeg_branding="Chrome"'
    'proprietary_codecs=true'
    'rtc_use_pipewire=true'
    'link_pulseaudio=true'
    'use_custom_libcxx=false'
    'use_gnome_keyring=false'
    'use_sysroot=false'
    'use_system_libffi=true'
    'enable_widevine=true'
    'enable_nacl=false'
    'enable_rust=false'
    'use_vaapi=true'
    'enable_platform_hevc=true'
    'enable_hevc_parser_and_hw_decoder=true'
  )

  if [[ -n ${_system_libs[icu]+set} ]]; then
    _flags+=('icu_use_data_file=false')
  fi

  # Append ungoogled chromium flags to _flags array
  if [[ -d "$srcdir/${pkgname%xdg*}$_uc_ver" ]]
  then
    _ungoogled_repo="$srcdir/${pkgname%xdg*}$_uc_ver"
  else
    _ungoogled_repo="$srcdir/${pkgname%xdg*}update"
  fi
  readarray -t -O ${#_flags[@]} _flags < "${_ungoogled_repo}/flags.gn"

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
  ninja -C out/Release chrome chrome_sandbox chromedriver
}

package() {
  cd chromium-launcher-$_launcher_ver
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/chromium/LICENSE.launcher"

  cd "$srcdir/chromium-$pkgver"

  install -D out/Release/chrome "$pkgdir/usr/lib/chromium/chromium"
  install -D out/Release/chromedriver "$pkgdir/usr/bin/chromedriver"
  install -Dm4755 out/Release/chrome_sandbox "$pkgdir/usr/lib/chromium/chrome-sandbox"

  install -Dm644 chrome/installer/linux/common/desktop.template \
    "$pkgdir/usr/share/applications/chromium.desktop"
  install -Dm644 chrome/app/resources/manpage.1.in \
    "$pkgdir/usr/share/man/man1/chromium.1"
  sed -i \
    -e 's/@@MENUNAME@@/Chromium/g' \
    -e 's/@@PACKAGE@@/chromium/g' \
    -e 's/@@USR_BIN_SYMLINK_NAME@@/chromium/g' \
    "$pkgdir/usr/share/applications/chromium.desktop" \
    "$pkgdir/usr/share/man/man1/chromium.1"

  install -Dm644 chrome/installer/linux/common/chromium-browser/chromium-browser.appdata.xml \
    "$pkgdir/usr/share/metainfo/chromium.appdata.xml"
  sed -ni \
    -e 's/chromium-browser\.desktop/chromium.desktop/' \
    -e '/<update_contact>/d' \
    -e '/<p>/N;/<p>\n.*\(We invite\|Chromium supports Vorbis\)/,/<\/p>/d' \
    -e '/^<?xml/,$p' \
    "$pkgdir/usr/share/metainfo/chromium.appdata.xml"

  local toplevel_files=(
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
    libvulkan.so.1
    vk_swiftshader_icd.json
  )

  if [[ -z ${_system_libs[icu]+set} ]]; then
    toplevel_files+=(icudtl.dat)
  fi

  cp "${toplevel_files[@]/#/out/Release/}" "$pkgdir/usr/lib/chromium/"
  install -Dm644 -t "$pkgdir/usr/lib/chromium/locales" out/Release/locales/*.pak

  for size in 24 48 64 128 256; do
    install -Dm644 "chrome/app/theme/chromium/product_logo_$size.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/chromium.png"
  done

  for size in 16 32; do
    install -Dm644 "chrome/app/theme/default_100_percent/chromium/product_logo_$size.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/chromium.png"
  done

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/chromium/LICENSE"
  install -Dm644 "${srcdir}/index.html" "$pkgdir/usr/share/ungoogled-chromium/index.html"
}

# vim:set ts=2 sw=2 et:
