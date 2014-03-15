# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=chromium
pkgver=33.0.1750.152
_toolchains_rev=12526
pkgrel=1
pkgdesc="The open-source project behind Google Chrome, an attempt at creating a safer, faster, and more stable browser"
arch=('i686' 'x86_64')
url="http://www.chromium.org/"
license=('BSD')
depends=('gtk2' 'nss' 'alsa-lib' 'xdg-utils' 'bzip2' 'libevent' 'libxss' 'icu'
         'libgcrypt' 'ttf-font' 'systemd' 'dbus' 'flac' 'opus' 'snappy'
         'speech-dispatcher' 'pciutils' 'libpulse' 'harfbuzz' 'harfbuzz-icu'
         'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('python2' 'perl' 'gperf' 'yasm' 'mesa' 'libgnome-keyring'
             'elfutils' 'subversion')
[[ $CARCH = x86_64 ]] && makedepends+=('lib32-gcc-libs' 'lib32-zlib')
optdepends=('kdebase-kdialog: needed for file dialogs in KDE')
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
        chromium-gn-r0.patch
        chromium.sh)
noextract=(naclsdk_nacl_linux_x86-$_toolchains_rev.tgz
           naclsdk_pnacl_linux_x86-$_toolchains_rev.tgz
           naclsdk_pnacl_translator-$_toolchains_rev.tgz)
sha256sums=('9fd462840bee3ae205b0548e8a483f7589beecdb7c6309d4d65425cbf710cc2f'
            '4bc956815bd45a82ed7c3b623d0ffb55fcc6c6af55828a0bf1560733def68e8d'
            '3ae77302adf775f2d513e7d9cb730cbe3e42d515002c4388d25fa3ec11b7b12f'
            'ce89d9c53b32a83f477e9ac2c2269d573477e23908462fccbf945c3303a9fb1f'
            '4408c8d4cb6d072929ba6e7f3edac170bfea8f54eb009ee7ceaa131a0c1fa92e'
            '09bfac44104f4ccda4c228053f689c947b3e97da9a4ab6fa34ce061ee83d0322'
            '478340d5760a9bd6c549e19b1b5d1c5b4933ebf5f8cfb2b3e2d70d07443fe232'
            'a1145e83d775101b28dcdceb3ca076fc7e9a4b9f69a1a2236d0c97ad39afb3d3'
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

  patch -Np0 -i "$srcdir/chromium-gn-r0.patch"

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
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  export PATH="$srcdir/python2-path:$PATH"

  # CFLAGS are passed through release_extra_cflags below
  export -n CFLAGS CXXFLAGS

  # Silence "typedef 'x' locally defined but not used" warnings
  CFLAGS+=' -Wno-unused-local-typedefs'

  local _chromium_conf=(
    -Dgoogle_api_key=$_google_api_key
    -Dgoogle_default_client_id=$_google_default_client_id
    -Dgoogle_default_client_secret=$_google_default_client_secret
    -Dwerror=
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
    -Duse_system_icu=1
    -Duse_system_libevent=1
    -Duse_system_libjpeg=1
    -Duse_system_libpng=1
    -Duse_system_libxml=0
    -Duse_system_opus=1
    -Duse_system_snappy=1
    -Duse_system_ssl=0
    -Duse_system_xdg_utils=1
    -Duse_system_yasm=1
    -Duse_system_zlib=0
    -Duse_gconf=0
    -Ddisable_glibc=1
    -Ddisable_sse2=1)

  build/linux/unbundle/replace_gyp_files.py "${_chromium_conf[@]}"
  build/gyp_chromium -f make --depth=. "${_chromium_conf[@]}"

  make chrome chrome_sandbox BUILDTYPE=Release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -D out/Release/chrome "$pkgdir/usr/lib/chromium/chromium"

  install -Dm4755 -o root -g root out/Release/chrome_sandbox \
    "$pkgdir/usr/lib/chromium/chrome-sandbox"

  cp out/Release/{*.pak,libffmpegsumo.so,nacl_helper{,_bootstrap}} \
    out/Release/{libppGoogleNaClPluginChrome.so,nacl_irt_*.nexe} \
    "$pkgdir/usr/lib/chromium/"

  # Manually strip binaries so that 'nacl_irt_*.nexe' is left intact
  strip $STRIP_BINARIES "$pkgdir/usr/lib/chromium/"{chromium,chrome-sandbox} \
    "$pkgdir/usr/lib/chromium/"nacl_helper{,_bootstrap}
  strip $STRIP_SHARED "$pkgdir/usr/lib/chromium/libffmpegsumo.so" \
    "$pkgdir/usr/lib/chromium/libppGoogleNaClPluginChrome.so"

  # Allow users to override command-line options
  install -Dm644 "$srcdir/chromium.default" "$pkgdir/etc/chromium/default"

  cp -a out/Release/locales "$pkgdir/usr/lib/chromium/"

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

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/chromium/LICENSE"
}

# vim:set ts=2 sw=2 et:
