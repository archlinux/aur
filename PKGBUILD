# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=chromium
pkgver=43.0.2357.132
pkgrel=1
_launcher_ver=2
pkgdesc="The open-source project behind Google Chrome, an attempt at creating a safer, faster, and more stable browser"
arch=('i686' 'x86_64')
url="http://www.chromium.org/"
license=('BSD')
depends=('gtk2' 'nss' 'alsa-lib' 'xdg-utils' 'bzip2' 'libevent' 'libxss' 'icu'
         'libexif' 'libgcrypt' 'ttf-font' 'systemd' 'dbus' 'flac' 'snappy'
         'speech-dispatcher' 'pciutils' 'libpulse' 'harfbuzz' 'libsecret'
         'libvpx' 'perl' 'perl-file-basedir' 'desktop-file-utils'
         'hicolor-icon-theme')
makedepends=('python2' 'gperf' 'yasm' 'mesa' 'ninja')
makedepends_x86_64=('lib32-gcc-libs' 'lib32-zlib')
optdepends=('kdebase-kdialog: needed for file dialogs in KDE'
            'gnome-keyring: for storing passwords in GNOME keyring'
            'kdeutils-kwalletmanager: for storing passwords in KWallet')
options=('!strip')
install=chromium.install
source=(https://commondatastorage.googleapis.com/chromium-browser-official/$pkgname-$pkgver.tar.xz
        chromium-launcher-$_launcher_ver.tar.gz::https://github.com/foutrelis/chromium-launcher/archive/v$_launcher_ver.tar.gz
        chromium.desktop
        0001-NSS-reject-DH-groups-smaller-than-1024-bits.patch
        0001-Use-the-correct-URL-for-ERR_SSL_WEAK_SERVER_EPHEMERA.patch
        add-build-flag-to-disable-hotwording.patch
        chromium-widevine.patch)
sha256sums=('405f52c6649f1d2937952fbcfcd238ba058db7d13edf4705f7027805f3ce1809'
            '7f91c81721092d707d7b94e6555a48bc7fd0bc0e1174df4649bdcd745930e52f'
            '028a748a5c275de9b8f776f97909f999a8583a4b77fd1cd600b4fc5c0c3e91e9'
            '46daf921ed7eaab175f5a86b09357c69c33a10ffe1d4e7c24476af510c1b28d0'
            '8fb428244be7b50268a2848a34405c5551232e5c77f9e553cfdd3103979748d2'
            '3a1c589aa90c0597776d945d34638d43e2d40d93bc1962148815831a5122ac4e'
            '379b746e187de28f80f5a7cd19edcfa31859656826f802a1ede054fcb6dfb221')

# Google API keys (see http://www.chromium.org/developers/how-tos/api-keys)
# Note: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys. Feel free to contact foutrelis@archlinux.org for
# more information.
_google_api_key=AIzaSyDwr302FpOSkGRpLlUpPThNTDPbXcIn_FM
_google_default_client_id=413772536636.apps.googleusercontent.com
_google_default_client_secret=0ZChLK6AxeA3Isu96MkwqDR4

# We can't build (P)NaCL on i686 because the toolchain is x86_64 only and the
# instructions on how to build the toolchain from source don't work that well
# (at least not from within the Chromium 39 source tree).
# https://sites.google.com/a/chromium.org/dev/nativeclient/pnacl/building-pnacl-components-for-distribution-packagers
_build_nacl=1
if [[ $CARCH == i686 ]]; then
  _build_nacl=0
fi

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # https://code.google.com/p/chromium/issues/detail?id=490240
  patch -Np1 -i ../0001-NSS-reject-DH-groups-smaller-than-1024-bits.patch

  # https://code.google.com/p/chromium/issues/detail?id=490260
  patch -Np1 -i ../0001-Use-the-correct-URL-for-ERR_SSL_WEAK_SERVER_EPHEMERA.patch

  # Add build flag to disable 'Ok Google' hotwording feature
  # The issue with this functionality is that it downloads a binary blob
  # and that this behavior cannot be disabled if a user wishes to do so.
  # https://code.google.com/p/chromium/issues/detail?id=491435
  patch -Np1 -i ../add-build-flag-to-disable-hotwording.patch

  # Enable support for the Widevine CDM plugin
  # The actual libraries are not included, but can be copied over from Chrome:
  #   libwidevinecdmadapter.so
  #   libwidevinecdm.so
  # (Version string doesn't seem to matter so let's go with "Pinkie Pie")
  sed "s/@WIDEVINE_VERSION@/Pinkie Pie/" ../chromium-widevine.patch |
    patch -Np1

  # Remove bundled ICU; its header files appear to get picked up instead of
  # the system ones, leading to errors during the final link stage.
  # https://groups.google.com/a/chromium.org/d/topic/chromium-packagers/BNGvJc08B6Q
  find third_party/icu -type f \! -regex '.*\.\(gyp\|gypi\|isolate\)' -delete

  # Use Python 2
  find . -name '*.py' -exec sed -i -r 's|/usr/bin/python$|&2|g' {} +
  # There are still a lot of relative calls which need a workaround
  mkdir "$srcdir/python2-path"
  ln -s /usr/bin/python2 "$srcdir/python2-path/python"

  # Download the PNaCL toolchain on x86_64; i686 toolchain is no longer provided
  if (( $_build_nacl )); then
    python2 build/download_nacl_toolchains.py \
      --packages nacl_x86_newlib,pnacl_newlib,pnacl_translator \
      sync --extract
  fi
}

build() {
  cd "$srcdir/chromium-launcher-$_launcher_ver"

  make PREFIX=/usr

  cd "$srcdir/$pkgname-$pkgver"

  export PATH="$srcdir/python2-path:$PATH"

  # CFLAGS are passed through release_extra_cflags below
  export -n CFLAGS CXXFLAGS

  local _chromium_conf=(
    -Dgoogle_api_key=$_google_api_key
    -Dgoogle_default_client_id=$_google_default_client_id
    -Dgoogle_default_client_secret=$_google_default_client_secret
    -Dwerror=
    -Dclang=0
    -Dpython_ver=2.7
    -Dlinux_link_gsettings=1
    -Dlinux_link_libpci=1
    -Dlinux_link_libspeechd=1
    -Dlinux_link_pulseaudio=1
    -Dlinux_strip_binary=1
    -Dlinux_use_bundled_binutils=0
    -Dlinux_use_bundled_gold=0
    -Dlinux_use_gold_flags=0
    -Dicu_use_data_file_flag=0
    -Dlogging_like_official_build=1
    -Drelease_extra_cflags="$CFLAGS"
    -Dlibspeechd_h_prefix=speech-dispatcher/
    -Dffmpeg_branding=Chrome
    -Dproprietary_codecs=1
    -Duse_gnome_keyring=0
    -Duse_system_bzip2=1
    -Duse_system_flac=1
    -Duse_system_ffmpeg=0
    -Duse_system_harfbuzz=1
    -Duse_system_icu=1
    -Duse_system_libevent=1
    -Duse_system_libjpeg=1
    -Duse_system_libpng=1
    -Duse_system_libvpx=1
    -Duse_system_libxml=0
    -Duse_system_snappy=1
    -Duse_system_xdg_utils=1
    -Duse_system_yasm=1
    -Duse_system_zlib=0
    -Dusb_ids_path=/usr/share/hwdata/usb.ids
    -Duse_mojo=0
    -Duse_gconf=0
    -Denable_hotwording=0
    -Ddisable_fatal_linker_warnings=1
    -Ddisable_glibc=1)

  if (( ! $_build_nacl )); then
    _chromium_conf+=(
      -Ddisable_nacl=1
      -Ddisable_pnacl=1
    )
  fi

  build/linux/unbundle/replace_gyp_files.py "${_chromium_conf[@]}"
  build/gyp_chromium --depth=. "${_chromium_conf[@]}"

  ninja -C out/Release chrome chrome_sandbox chromedriver
}

package() {
  cd "$srcdir/chromium-launcher-$_launcher_ver"

  make PREFIX=/usr DESTDIR="$pkgdir" install-strip
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/chromium/LICENSE.launcher"

  cd "$srcdir/$pkgname-$pkgver"

  install -D out/Release/chrome "$pkgdir/usr/lib/chromium/chromium"

  install -Dm4755 out/Release/chrome_sandbox \
    "$pkgdir/usr/lib/chromium/chrome-sandbox"

  install -D out/Release/chromedriver "$pkgdir/usr/lib/chromium/chromedriver"

  cp out/Release/{*.pak,*.bin,libffmpegsumo.so} \
    "$pkgdir/usr/lib/chromium/"

  # Manually strip binaries so that 'nacl_irt_*.nexe' is left intact
  strip $STRIP_BINARIES "$pkgdir/usr/lib/chromium/"{chromium,chrome-sandbox} \
    "$pkgdir/usr/lib/chromium/chromedriver"
  strip $STRIP_SHARED "$pkgdir/usr/lib/chromium/libffmpegsumo.so"

  if (( $_build_nacl )); then
    cp out/Release/nacl_helper{,_bootstrap} out/Release/nacl_irt_*.nexe \
      "$pkgdir/usr/lib/chromium/"
    strip $STRIP_BINARIES "$pkgdir/usr/lib/chromium/"nacl_helper{,_bootstrap}
  fi

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

  ln -s /usr/lib/chromium/chromedriver "$pkgdir/usr/bin/chromedriver"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/chromium/LICENSE"
}

# vim:set ts=2 sw=2 et:
