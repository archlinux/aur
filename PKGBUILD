# Maintainer: Seppia <seppia@seppio.fish>
# Contributors: Eloston
# Derived from official Chromium and Inox PKGBUILDS and ungoogled-chromium buildkit

pkgname=ungoogled-chromium
pkgver=66.0.3359.181
pkgrel=1
_launcher_ver=6
pkgdesc="Modifications to Google Chromium for removing Google integration and enhancing privacy, control, and transparency"
arch=('x86_64')
url="https://github.com/Eloston/ungoogled-chromium"
license=('BSD')
depends=('gtk3' 'nss' 'alsa-lib' 'xdg-utils' 'libxss' 'libcups' 'libgcrypt'
         'ttf-font' 'systemd' 'dbus' 'libpulse' 'pciutils' 'json-glib'
         'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('python' 'python2' 'gperf' 'yasm' 'mesa' 'ninja' 'git'
             'clang' 'lld' 'llvm' 'libva' 'quilt')
optdepends=('pepper-flash: support for Flash content'
            'kdialog: needed for file dialogs in KDE'
            'gnome-keyring: for storing passwords in GNOME keyring'
            'kwallet: for storing passwords in KWallet'
            'libva-intel-driver: for hardware video acceleration with Intel GPUs'
            'libva-mesa-driver: for hardware video acceleration with AMD/ATI GPUs'
            'libva-vdpau-driver: for hardware video acceleration with NVIDIA GPUs')
provides=('chromium')
conflicts=('chromium')
source=(https://commondatastorage.googleapis.com/chromium-browser-official/chromium-$pkgver.tar.xz
        chromium-launcher-$_launcher_ver.tar.gz::https://github.com/foutrelis/chromium-launcher/archive/v$_launcher_ver.tar.gz
        chromium-$pkgver.txt::https://chromium.googlesource.com/chromium/src/+/$pkgver?format=TEXT
        'https://github.com/Eloston/ungoogled-chromium/archive/66.0.3359.181-1.tar.gz')
sha256sums=('37e6673741b365a25a837217b08f77b24b4f5fc4ad88c8581be6a5dae9a9e919'
            '04917e3cd4307d8e31bfb0027a5dce6d086edb10ff8a716024fbb8bb0c7dccf1'
            '221d0f17951e88d4d315f3160919380237b88587c4b295d619229a05b79927f1'
            'fb928bdaa60521d34ad7f33b92d2bfe5a18103048efe6b886a17144f9cd8074a')

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
  [libevent]=libevent
  [libjpeg]=libjpeg
  #[libpng]=libpng            # https://crbug.com/752403#c10
  [libvpx]=libvpx
  [libwebp]=libwebp
  #[libxml]=libxml2           # https://crbug.com/736026
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
  local _tree="$srcdir/chromium-$pkgver"
  local _user_bundle="$srcdir/chromium-$pkgver/ungoogled"

  cd "$srcdir/$pkgname-$pkgver-$pkgrel"

  msg2 'Processing sources'
  python buildkit-launcher.py genbun -u "$_user_bundle" archlinux
  python buildkit-launcher.py prubin -u "$_user_bundle" -t "$_tree"
  python buildkit-launcher.py subdom -u "$_user_bundle" -t "$_tree"
  ln -s ../patch_order.list "$_user_bundle/patches/series"

  cd "$srcdir/chromium-$pkgver"

  msg2 'Applying build patches'
  # https://crbug.com/710701
  local _chrome_build_hash=$(base64 -d ../chromium-$pkgver.txt |
    grep -Po '^parent \K[0-9a-f]{40}$')
  if [[ -z $_chrome_build_hash ]]; then
    error "Unable to find Chrome build hash."
    return 1
  fi
  echo "LASTCHANGE=$_chrome_build_hash-" >build/util/LASTCHANGE

  # Apply patches
  env QUILT_PATCHES="$_user_bundle/patches" quilt push -a

  # Force script incompatible with Python 3 to use /usr/bin/python2
  sed -i '1s|python$|&2|' third_party/dom_distiller_js/protoc_plugins/*.py

  # Remove bundled libraries for which we will use the system copies; this
  # *should* do what the remove_bundled_libraries.py script does, with the
  # added benefit of not having to list all the remaining libraries
  local _lib
  for _lib in ${_unwanted_bundled_libs[@]}; do
    find -type f -path "*third_party/$_lib/*" \
      \! -path "*third_party/$_lib/chromium/*" \
      \! -path "*third_party/$_lib/google/*" \
      \! -path './base/third_party/icu/*' \
      \! -path './third_party/pdfium/third_party/freetype/include/pstables.h' \
      \! -path './third_party/yasm/run_yasm.py' \
      \! -regex '.*\.\(gn\|gni\|isolate\)' \
      -delete
  done

  python2 build/linux/unbundle/replace_gn_files.py \
    --system-libraries "${!_system_libs[@]}"
}

build() {
  make -C chromium-launcher-$_launcher_ver

  cd "$srcdir/chromium-$pkgver"

  if check_buildoption ccache y; then
    # Avoid falling back to preprocessor mode when sources contain time macros
    export CCACHE_SLOPPINESS=time_macros
  fi

  mkdir -p out/Default

  export CC=clang
  export CXX=clang++
  export AR=llvm-ar
  export NM=llvm-nm

  local _flags=(
    'blink_symbol_level=0'
    'clang_use_chrome_plugins=false'
    'custom_toolchain="//build/toolchain/linux/unbundle:default"'
    'enable_ac3_eac3_audio_demuxing=true'
    'enable_google_now=false'
    'enable_hangout_services_extension=false'
    'enable_hevc_demuxing=true'
    'enable_iterator_debugging=false'
    'enable_mdns=false'
    'enable_mse_mpeg2ts_stream_parser=true'
    'enable_nacl=false'
    'enable_nacl_nonsfi=false'
    'enable_one_click_signin=false'
    'enable_reading_list=false'
    'enable_remoting=false'
    'enable_reporting=false'
    'enable_service_discovery=false'
    'enable_swiftshader=false'
    'enable_widevine=true'
    'exclude_unwind_tables=true'
    'fatal_linker_warnings=false'
    'ffmpeg_branding="ChromeOS"'
    'fieldtrial_testing_like_official_build=true'
    'gold_path=""'
    'goma_dir=""'
    'google_api_key=""'
    'google_default_client_id=""'
    'google_default_client_secret=""'
    'host_toolchain="//build/toolchain/linux/unbundle:default"'
    'is_clang=true'
    'is_debug=false'
    'is_official_build=true'
    'link_pulseaudio=true'
    'linux_use_bundled_binutils=false'
    'optimize_for_size=false'
    'optimize_webui=false'
    'proprietary_codecs=true'
    'safe_browsing_mode=0'
    'symbol_level=0'
    'treat_warnings_as_errors=false'
    'use_allocator="none"'
    'use_cups=true'
    'use_custom_libcxx=false'
    'use_gnome_keyring=false'
    'use_gold=true'
    'use_gtk3=true'
    'use_jumbo_build=true'
    'use_kerberos=false'
    'use_lld=true'
    'use_official_google_api_keys=false'
    'use_openh264=false'
    'use_ozone=false'
    'use_pulseaudio=true'
    'use_sysroot=false'
    'use_system_freetype=true'
    'use_system_harfbuzz=true'
    'use_system_lcms2=true'
    'use_system_libjpeg=true'
    'use_system_zlib=true'
    'use_unofficial_version_number=false'
    'use_vaapi=true'
  )

  # Facilitate deterministic builds (taken from build/config/compiler/BUILD.gn)
  CFLAGS+='   -Wno-builtin-macro-redefined'
  CXXFLAGS+=' -Wno-builtin-macro-redefined'
  CPPFLAGS+=' -D__DATE__=  -D__TIME__=  -D__TIMESTAMP__='

  msg2 'Building GN'
  python2 tools/gn/bootstrap/bootstrap.py -o out/Default/gn -s --no-clean
  msg2 'Configuring Chromium'
  out/Default/gn gen out/Default --args="${_flags[*]}" \
    --script-executable=/usr/bin/python2 --fail-on-unused-args

  msg2 'Building Chromium'
  ninja -C out/Default chrome chrome_sandbox chromedriver widevinecdmadapter
}

package() {
  cd chromium-launcher-$_launcher_ver
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/chromium/LICENSE.launcher"

  cd "$srcdir/chromium-$pkgver"

  install -D out/Default/chrome "$pkgdir/usr/lib/chromium/chromium"
  install -Dm4755 out/Default/chrome_sandbox "$pkgdir/usr/lib/chromium/chrome-sandbox"
  ln -s /usr/lib/$pkgname/chromedriver "$pkgdir/usr/bin/chromedriver"

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
    out/Default/{chrome_{100,200}_percent,resources}.pak \
    out/Default/{*.bin,chromedriver,libwidevinecdmadapter.so} \
    "$pkgdir/usr/lib/chromium/"
  install -Dm644 -t "$pkgdir/usr/lib/chromium/locales" out/Default/locales/*.pak

  if [[ -z ${_system_libs[icu]+set} ]]; then
    cp out/Default/icudtl.dat "$pkgdir/usr/lib/chromium/"
  fi

  for size in 22 24 48 64 128 256; do
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
