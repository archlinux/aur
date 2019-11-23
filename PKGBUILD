# Maintainer: JustKidding <jk@vin.ovh>
# Derived from PKGBUILD for chromium

pkgname=ungoogled-chromium-ozone
_pkgname=ungoogled-chromium
pkgver=78.0.3904.108
pkgrel=1
_launcher_ver=6
pkgdesc="A lightweight approach to removing Google web service dependency"
arch=('x86_64')
url="https://ungoogled-software.github.io/"
license=('BSD')
depends=('gtk3' 'nss' 'alsa-lib' 'xdg-utils' 'libxss' 'libcups' 'libgcrypt'
         'ttf-font' 'systemd' 'dbus' 'libpulse' 'pciutils' 'json-glib' 'libva'
         'icu' 'libxml2' 'fontconfig' 'harfbuzz' 'libjpeg' 're2' 'snappy' 'ffmpeg' 'flac' 'libwebp' 'minizip' 'libxslt' 'freetype2' 'opus'
         'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('python' 'python2' 'gperf' 'yasm' 'mesa' 'ninja' 'nodejs' 'git'
             'pipewire' 'clang' 'lld' 'gn' 'jre-openjdk-headless' 'jack')
optdepends=('pepper-flash: support for Flash content'
            'kdialog: needed for file dialogs in KDE'
            'gnome-keyring: for storing passwords in GNOME keyring'
            'kwallet: for storing passwords in KWallet'
            'libva-intel-driver: for hardware video acceleration with old Intel GPUs'
            'intel-media-driver: for hardware video acceleration with newer Intel GPUs'
            'libva-mesa-driver: for hardware video acceleration with AMD/ATI GPUs'
            'libva-vdpau-driver: for hardware video acceleration with NVIDIA GPUs')
provides=('chromium')
conflicts=('chromium')
source=(https://commondatastorage.googleapis.com/chromium-browser-official/chromium-${pkgver}.tar.xz
        chromium-launcher-$_launcher_ver.tar.gz::https://github.com/foutrelis/chromium-launcher/archive/v$_launcher_ver.tar.gz
        'ungoogled-chromium.zip::https://github.com/Eloston/ungoogled-chromium/archive/master.zip'
        flags.archlinux.gn
        chromium-drirc-disable-10bpc-color-configs.conf
        vaapi-fix.patch
        fix-vaapi-ozone-build.patch
        add-missing-include-for-unique_ptr.patch
        dns_util-make-DohUpgradeEntry-non-const.patch
        fix-shutdown-crash-in-ProfileManager.patch
        icu65.patch
        chromium-system-icu.patch
        chromium-system-zlib.patch
        fix-spammy-unique-font-matching-log.patch
        chromium-widevine.patch
        chromium-skia-harmony.patch)
sha256sums=('f9c53839f306d2973de27723360024f7904101d426b9e7e9cdb56e8bcc775b0e'
            '04917e3cd4307d8e31bfb0027a5dce6d086edb10ff8a716024fbb8bb0c7dccf1'
            'SKIP'
            'd81d95f719e7b4ed2c15ece56b0272ae969e8df871f1d8d87065db0130134912'
            'babda4f5c1179825797496898d77334ac067149cac03d797ab27ac69671a7feb'
            '9256123898cbdd4da4a111e5aa8752d5c6c2c07e59ca8677751791dd3321f6a9'
            '9aebd800e5fe191cd5f4bd82c33419eefdd80919e6c6f5a3a9346a224625f094'
            '49052e8aa630c4aa57bf46823edc32b7b309493275163c3bb3f9fd390c73356e'
            '69694ab12a5ced389916c0c5e8c7bdc191544f576b134ddfb2fe9d4ed9ec4494'
            '4f81612c28957987f7344d8ce2b95a4a63136a8319c9751819436b11c62df057'
            '1de9bdbfed482295dda45c7d4e323cee55a34e42f66b892da1c1a778682b7a41'
            'e73cc2ee8d3ea35aab18c478d76fdfc68ca4463e1e10306fa1e738c03b3f26b5'
            'eb67eda4945a89c3b90473fa8dc20637511ca4dcb58879a8ed6bf403700ca9c8'
            '6fbffe59b886195b92c9a55137cef83021c16593f49714acb20023633e3ebb19'
            'd081f2ef8793544685aad35dea75a7e6264a2cb987ff3541e6377f4a3650a28b'
            '771292942c0901092a402cc60ee883877a99fb804cb54d568c8c6c94565a48e1')
# Possible replacements are listed in build/linux/unbundle/replace_gn_files.py
# Keys are the names in the above script; values are the dependencies in Arch
declare -gA _system_libs=(
  [ffmpeg]=ffmpeg
  [flac]=flac
  [fontconfig]=fontconfig
  [freetype]=freetype2
  [harfbuzz-ng]=harfbuzz
  [icu]=icu
  [libdrm]=
  [libjpeg]=libjpeg
  #[libpng]=libpng    # https://crbug.com/752403#c10
  #[libvpx]=libvpx    # https://github.com/webmproject/libvpx/commit/5a0242ba5c
  [libwebp]=libwebp
  [libxml]=libxml2
  [libxslt]=libxslt
  [opus]=opus
  [re2]=re2
  [snappy]=snappy
  [yasm]=
  [zlib]=minizip
)
_unwanted_bundled_libs=(
  ${!_system_libs[@]}
  ${_system_libs[libjpeg]+libjpeg_turbo}
)
depends+=(${_system_libs[@]})

prepare() {
  cd "$srcdir/chromium-${pkgver}"

  # Allow building against system libraries in official builds
  sed -i 's/OFFICIAL_BUILD/GOOGLE_CHROME_BUILD/' \
    tools/generate_shim_headers/generate_shim_headers.py

  # https://crbug.com/893950
  sed -i -e 's/\<xmlMalloc\>/malloc/' -e 's/\<xmlFree\>/free/' \
    third_party/blink/renderer/core/xml/*.cc \
    third_party/blink/renderer/core/xml/parser/xml_document_parser.cc \
    third_party/libxml/chromium/libxml_utils.cc

  msg2 'Applying archlinux patches'

  # Fix VA-API on Intel and Nvidia
  patch -Np1 -i ../vaapi-fix.patch

  # Fix vaapi linkage error
  patch -Np1 -i ../fix-vaapi-ozone-build.patch
  
  # Missing include in third_party/blink/public/platform/web_rtc_rtp_source.h
  patch -Np1 -i ../add-missing-include-for-unique_ptr.patch

  # https://crbug.com/957519#c23
  patch -Np1 -i ../dns_util-make-DohUpgradeEntry-non-const.patch

  # https://crbug.com/1005244
  patch -Np1 -i ../fix-shutdown-crash-in-ProfileManager.patch

  # https://crbug.com/1014272
  patch -Np1 -i ../icu65.patch

  # Fixes from Gentoo
  patch -Np1 -i ../chromium-system-icu.patch
  patch -Np1 -i ../chromium-system-zlib.patch

  # https://crbug.com/1005508
  patch -Np1 -i ../fix-spammy-unique-font-matching-log.patch

  # Load Widevine CDM if available
  #patch -Np1 -i ../chromium-widevine.patch

  # https://crbug.com/skia/6663#c10
  patch -Np0 -i ../chromium-skia-harmony.patch

  # Ungoogled chromium stuff
  _ungoogled_repo="$srcdir/$_pkgname-master"
  _utils="${_ungoogled_repo}/utils"
  msg2 'Applying ungoogled chromium patches'
  # Prune binaries
  python "$_utils/prune_binaries.py" ./ "$_ungoogled_repo/pruning.list"
  # Patches themselves
  python "$_utils/patches.py" apply ./ "$_ungoogled_repo/patches"
  # domain substitution
  python "$_utils/domain_substitution.py" apply -r "$_ungoogled_repo/domain_regex.list" -f "$_ungoogled_repo/domain_substitution.list" -c domainsubcache.tar.gz ./

  # Force script incompatible with Python 3 to use /usr/bin/python2
  sed -i '1s|python$|&2|' third_party/dom_distiller_js/protoc_plugins/*.py

  mkdir -p third_party/node/linux/node-linux-x64/bin
  ln -s /usr/bin/node third_party/node/linux/node-linux-x64/bin/

  # Remove bundled libraries for which we will use the system copies; this
  # *should* do what the remove_bundled_libraries.py script does, with the
  # added benefit of not having to list all the remaining libraries
  local _lib
  for _lib in ${_unwanted_bundled_libs[@]}; do
    find "third_party/$_lib" -type f \
      \! -path "third_party/$_lib/chromium/*" \
      \! -path "third_party/$_lib/google/*" \
      \! -path 'third_party/yasm/run_yasm.py' \
      \! -regex '.*\.\(gn\|gni\|isolate\)' \
      -delete
  done

  python2 build/linux/unbundle/replace_gn_files.py \
    --system-libraries "${!_system_libs[@]}"
}

build() {
  make -C chromium-launcher-$_launcher_ver

  cd "$srcdir/chromium-${pkgver}"

  if check_buildoption ccache y; then
    # Avoid falling back to preprocessor mode when sources contain time macros
    export CCACHE_SLOPPINESS=time_macros
  fi

  export CC=clang
  export CXX=clang++
  export AR=ar
  export NM=nm

  # Ungoogled Chromium stuff
  _ungoogled_repo="$srcdir/$_pkgname-master"
  nproc=$(nproc)
  mkdir -p out/Release
  # Assemble GN flags
  cp "$_ungoogled_repo/flags.gn" "out/Release/args.gn"
  printf '\n' >> "out/Release/args.gn"
  cat "$srcdir/flags.archlinux.gn" >> "out/Release/args.gn"

  if check_option strip y; then
    _flags+=('symbol_level=0')
  fi

  # Facilitate deterministic builds (taken from build/config/compiler/BUILD.gn)
  CFLAGS+='   -Wno-builtin-macro-redefined'
  CXXFLAGS+=' -Wno-builtin-macro-redefined'
  CPPFLAGS+=' -D__DATE__=  -D__TIME__=  -D__TIMESTAMP__='

  # Do not warn about unknown warning options
  CFLAGS+='   -Wno-unknown-warning-option'
  CXXFLAGS+=' -Wno-unknown-warning-option'

  gn gen out/Release --script-executable=/usr/bin/python2
  ninja -C out/Release chrome chrome_sandbox chromedriver
}

package() {
  cd chromium-launcher-$_launcher_ver
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/chromium/LICENSE.launcher"

  cd "$srcdir/chromium-${pkgver}"

  install -D out/Release/chrome "$pkgdir/usr/lib/chromium/chromium"
  install -Dm4755 out/Release/chrome_sandbox "$pkgdir/usr/lib/chromium/chrome-sandbox"
  ln -s /usr/lib/chromium/chromedriver "$pkgdir/usr/bin/chromedriver"
  
  install -Dm644 ../chromium-drirc-disable-10bpc-color-configs.conf \
    "$pkgdir/usr/share/drirc.d/10-$pkgname.conf"

  install -Dm644 chrome/installer/linux/common/desktop.template \
    "$pkgdir/usr/share/applications/chromium.desktop"
  install -Dm644 chrome/app/resources/manpage.1.in \
    "$pkgdir/usr/share/man/man1/chromium.1"
  sed -i \
    -e "s/@@MENUNAME@@/Chromium/g" \
    -e "s/@@PACKAGE@@/chromium/g" \
    -e "s/@@USR_BIN_SYMLINK_NAME@@/chromium/g" \
    "$pkgdir/usr/share/applications/chromium.desktop" \
    "$pkgdir/usr/share/man/man1/chromium.1"

  cp \
    out/Release/{chrome_{100,200}_percent,resources}.pak \
    out/Release/{*.bin,chromedriver} \
    "$pkgdir/usr/lib/chromium/"
  install -Dm644 -t "$pkgdir/usr/lib/chromium/locales" out/Release/locales/*.pak

  if [[ -z ${_system_libs[icu]+set} ]]; then
    cp out/Release/icudtl.dat "$pkgdir/usr/lib/chromium/"
  fi

  for size in 24 48 64 128 256; do
    install -Dm644 "chrome/app/theme/chromium/product_logo_$size.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/chromium.png"
  done

  for size in 16 32; do
    install -Dm644 "chrome/app/theme/default_100_percent/chromium/product_logo_$size.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/chromium.png"
  done

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/chromium/LICENSE"
}

# vim:set ts=2 sw=2 et:
