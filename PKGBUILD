# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=chromium
pkgver=35.0.1916.114
_toolchains_rev=12935
pkgrel=1
pkgdesc="The open-source project behind Google Chrome, an attempt at creating a safer, faster, and more stable browser"
arch=('i686' 'x86_64')
url="http://www.chromium.org/"
license=('BSD')
depends=('gtk2' 'nss' 'alsa-lib' 'xdg-utils' 'bzip2' 'libevent' 'libxss'
         'libgcrypt' 'ttf-font' 'systemd' 'dbus' 'flac' 'snappy'
         'speech-dispatcher' 'pciutils' 'libpulse' 'harfbuzz'
         'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('python2' 'perl' 'gperf' 'yasm' 'mesa' 'libgnome-keyring'
             'elfutils' 'subversion' 'ninja' 'clang')
[[ $CARCH = x86_64 ]] && makedepends+=('lib32-gcc-libs' 'lib32-zlib')
optdepends=('kdebase-kdialog: needed for file dialogs in KDE'
            'gnome-keyring: for storing passwords in GNOME keyring'
            'libgnome-keyring: for storing passwords in GNOME keyring'
            'kdeutils-kwalletmanager: for storing passwords in KWallet')
backup=('etc/chromium/default')
options=('!strip')
install=chromium.install
source=(https://commondatastorage.googleapis.com/chromium-browser-official/$pkgname-$pkgver.tar.xz
        naclsdk_nacl_linux_x86-$_toolchains_rev.tgz::https://commondatastorage.googleapis.com/nativeclient-archive2/toolchain/$_toolchains_rev/naclsdk_linux_x86.tgz
        naclsdk_pnacl_linux_x86-$_toolchains_rev.tgz::https://commondatastorage.googleapis.com/nativeclient-archive2/toolchain/$_toolchains_rev/naclsdk_pnacl_linux_x86.tgz
        naclsdk_pnacl_translator-$_toolchains_rev.tgz::https://commondatastorage.googleapis.com/nativeclient-archive2/toolchain/$_toolchains_rev/naclsdk_pnacl_translator.tgz
        naclsdk_pnacl_translator-$_toolchains_rev.tgz.sha1hash::https://commondatastorage.googleapis.com/nativeclient-archive2/toolchain/$_toolchains_rev/naclsdk_pnacl_translator.tgz.sha1hash
        chromium.desktop
        chromium.default
        chromium-nacl-bootstrap-cflags.patch
        chromium.sh)
noextract=(naclsdk_nacl_linux_x86-$_toolchains_rev.tgz
           naclsdk_pnacl_linux_x86-$_toolchains_rev.tgz
           naclsdk_pnacl_translator-$_toolchains_rev.tgz)
sha256sums=('566fcdc05d53c551d142ac9742ef69ba7c6d5a450d8ec41c0efd4fc8249f77af'
            '2d72245cf0fc5aec95dcf315d88d787aaeff85e2fae28b8521d60a3dd95e28d4'
            '6baee05d11e353aac83a94125722d1f85c1aaa5fae0bfea55f996bd1d9c2a6eb'
            '142108d8ce184c3e2b18126a01bed14e286f953d90897a6d1c97f2bf7802cc0a'
            '67005b390ba80b736b48fb1511bdf3fccd8fc808f4928e7fcca69f5677148b83'
            '09bfac44104f4ccda4c228053f689c947b3e97da9a4ab6fa34ce061ee83d0322'
            '478340d5760a9bd6c549e19b1b5d1c5b4933ebf5f8cfb2b3e2d70d07443fe232'
            'd82bafd8d4d6517c2d420b2987fdbe1dfcc32d5fed74a6c0011bcb2f868225c3'
            '4999fded897af692f4974f0a3e3bbb215193519918a1fa9b31ed51e74a2dccb9')

# Google API keys (see http://www.chromium.org/developers/how-tos/api-keys)
# Note: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys. Feel free to contact foutrelis@archlinux.org for
# more information.
_google_api_key=AIzaSyDwr302FpOSkGRpLlUpPThNTDPbXcIn_FM
_google_default_client_id=413772536636.apps.googleusercontent.com
_google_default_client_secret=0ZChLK6AxeA3Isu96MkwqDR4

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # Filter out -fstack-protector-strong for nacl_helper_bootstrap
  # https://code.google.com/p/chromium/issues/detail?id=104569
  patch -Np0 -i ../chromium-nacl-bootstrap-cflags.patch

  # Use Python 2
  find . -type f -exec sed -i -r \
    -e 's|/usr/bin/python$|&2|g' \
    -e 's|(/usr/bin/python2)\.4$|\1|g' \
    {} +
  # There are still a lot of relative calls which need a workaround
  mkdir "$srcdir/python2-path"
  ln -s /usr/bin/python2 "$srcdir/python2-path/python"

  # Prepare NaCL toolchain
  mkdir native_client/toolchain/{.tars,pnacl_translator}
  ln -s "$srcdir/naclsdk_nacl_linux_x86-$_toolchains_rev.tgz" \
    native_client/toolchain/.tars/naclsdk_linux_x86.tgz
  ln -s "$srcdir/naclsdk_pnacl_linux_x86-$_toolchains_rev.tgz" \
    native_client/toolchain/.tars/naclsdk_pnacl_linux_x86.tgz
  ln -s "$srcdir/naclsdk_pnacl_translator-$_toolchains_rev.tgz" \
    native_client/toolchain/.tars/naclsdk_pnacl_translator.tgz
  ln -s "$srcdir/naclsdk_pnacl_translator-$_toolchains_rev.tgz.sha1hash" \
    native_client/toolchain/pnacl_translator/SOURCE_SHA1

  # Build with clang as a temporary solution to startup crash with GCC 4.9
  mkdir -p third_party/llvm-build/Release+Asserts/bin
  ln -s /usr/bin/clang third_party/llvm-build/Release+Asserts/bin/
  ln -s /usr/bin/clang++ third_party/llvm-build/Release+Asserts/bin/
  ln -s /usr/bin/llvm-symbolizer third_party/llvm-build/Release+Asserts/bin/
  # clang 3.4 doesn't support this option
  sed -i '/-Wno-absolute-value/d' build/common.gypi
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  export PATH="$srcdir/python2-path:$PATH"

  # CFLAGS are passed through release_extra_cflags below
  export -n CFLAGS CXXFLAGS

  local _chromium_conf=(
    -Dgoogle_api_key=$_google_api_key
    -Dgoogle_default_client_id=$_google_default_client_id
    -Dgoogle_default_client_secret=$_google_default_client_secret
    -Dwerror=
    -Dclang=1
    -Dclang_use_chrome_plugins=0
    -Dpython_ver=2.7
    -Dlinux_link_gsettings=1
    -Dlinux_link_libpci=1
    -Dlinux_link_libspeechd=1
    -Dlinux_link_pulseaudio=1
    -Dlinux_strip_binary=1
    -Dlinux_use_gold_binary=0
    -Dlinux_use_gold_flags=0
    -Dlogging_like_official_build=1
    -Drelease_extra_cflags="$CFLAGS"
    -Dlibspeechd_h_prefix=speech-dispatcher/
    -Dffmpeg_branding=Chrome
    -Dproprietary_codecs=1
    -Duse_system_bzip2=1
    -Duse_system_flac=1
    -Duse_system_ffmpeg=0
    -Duse_system_harfbuzz=1
    -Duse_system_libevent=1
    -Duse_system_libjpeg=1
    -Duse_system_libpng=1
    -Duse_system_libxml=0
    -Duse_system_snappy=1
    -Duse_system_ssl=0
    -Duse_system_xdg_utils=1
    -Duse_system_yasm=1
    -Duse_system_zlib=0
    -Duse_mojo=0
    -Duse_gconf=0
    -Ddisable_fatal_linker_warnings=1
    -Ddisable_glibc=1)

  build/linux/unbundle/replace_gyp_files.py "${_chromium_conf[@]}"
  build/gyp_chromium --depth=. "${_chromium_conf[@]}"

  ninja -C out/Release chrome chrome_sandbox chromedriver
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -D out/Release/chrome "$pkgdir/usr/lib/chromium/chromium"

  install -Dm4755 -o root -g root out/Release/chrome_sandbox \
    "$pkgdir/usr/lib/chromium/chrome-sandbox"

  install -D out/Release/chromedriver "$pkgdir/usr/lib/chromium/chromedriver"

  cp out/Release/{*.pak,libffmpegsumo.so,nacl_helper{,_bootstrap}} \
    out/Release/{libppGoogleNaClPluginChrome.so,nacl_irt_*.nexe} \
    "$pkgdir/usr/lib/chromium/"

  # Manually strip binaries so that 'nacl_irt_*.nexe' is left intact
  strip $STRIP_BINARIES "$pkgdir/usr/lib/chromium/"{chromium,chrome-sandbox} \
    "$pkgdir/usr/lib/chromium/chromedriver" \
    "$pkgdir/usr/lib/chromium/"nacl_helper{,_bootstrap}
  strip $STRIP_SHARED "$pkgdir/usr/lib/chromium/libffmpegsumo.so" \
    "$pkgdir/usr/lib/chromium/libppGoogleNaClPluginChrome.so"

  # Allow users to override command-line options
  install -Dm644 "$srcdir/chromium.default" "$pkgdir/etc/chromium/default"

  cp -a out/Release/locales out/Release/icudtl.dat "$pkgdir/usr/lib/chromium/"

  install -Dm644 out/Release/chrome.1 "$pkgdir/usr/share/man/man1/chromium.1"

  install -Dm644 "$srcdir/chromium.desktop" \
    "$pkgdir/usr/share/applications/chromium.desktop"

  for size in 22 24 48 64 128 256; do
    install -Dm644 "chrome/app/theme/chromium/product_logo_$size.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/chromium.png"
  done

  for size in 16 32; do
    install -Dm644 "chrome/app/theme/default_100_percent/chromium/product_logo_$size.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/chromium.png"
  done

  install -D "$srcdir/chromium.sh" "$pkgdir/usr/bin/chromium"
  ln -s /usr/lib/chromium/chromedriver "$pkgdir/usr/bin/chromedriver"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/chromium/LICENSE"
}

# vim:set ts=2 sw=2 et:
