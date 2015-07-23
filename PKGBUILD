# Maintainer: Michael Egger <gcarq@archlinux.info>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=inox
pkgver=44.0.2403.89
pkgrel=1
_launcher_ver=2
pkgdesc="Chromium Spin-off to enhance privacy by disabling data transmission to Google"
arch=('i686' 'x86_64')
url="http://www.chromium.org/"
license=('BSD')
depends=('gtk2' 'nss' 'alsa-lib' 'xdg-utils' 'bzip2' 'libevent' 'libxss' 'icu'
         'libexif' 'libgcrypt' 'ttf-font' 'systemd' 'dbus' 'flac' 'snappy'
         'speech-dispatcher' 'pciutils' 'libpulse' 'harfbuzz' 'libsecret'
         'libvpx' 'perl' 'perl-file-basedir' 'desktop-file-utils'
         'hicolor-icon-theme')
makedepends=('python2' 'python2-ply<3.5' 'gperf' 'yasm' 'mesa' 'ninja')
makedepends_x86_64=('lib32-gcc-libs' 'lib32-zlib')
optdepends=('kdebase-kdialog: needed for file dialogs in KDE'
            'gnome-keyring: for storing passwords in GNOME keyring'
            'kdeutils-kwalletmanager: for storing passwords in KWallet')
options=('!strip')
install=inox.install
source=(https://commondatastorage.googleapis.com/chromium-browser-official/chromium-$pkgver.tar.xz
        chromium-launcher-$_launcher_ver.tar.gz::https://github.com/foutrelis/chromium-launcher/archive/v$_launcher_ver.tar.gz
        inox.desktop
        0001-NSS-reject-DH-groups-smaller-than-1024-bits.patch
        0001-Use-the-correct-URL-for-ERR_SSL_WEAK_SERVER_EPHEMERA.patch
        chromium-widevine.patch
        disable-autofill-download-manager.patch
        disable-google-url-tracker.patch
        disable-default-extensions.patch
        modify-default-prefs.patch
        disable-notification-promo-fetch.patch
        disable-instant-extended-api.patch
        disable-google-ipv6-probes.patch
        disable-gcm-status-check.patch
        add-duckduckgo-search-engine.patch
        branding.patch
        launcher-branding.patch
        disable-missing-key-warning.patch)
        
sha256sums=('badd9aa979487b55bbcce4f54ec16926c6fa7eb46ec2536866200a5e68853a98'
            '7f91c81721092d707d7b94e6555a48bc7fd0bc0e1174df4649bdcd745930e52f'
            'ff3f939a8757f482c1c5ba35c2c0f01ee80e2a2273c16238370081564350b148'
            '46daf921ed7eaab175f5a86b09357c69c33a10ffe1d4e7c24476af510c1b28d0'
            '8fb428244be7b50268a2848a34405c5551232e5c77f9e553cfdd3103979748d2'
            '379b746e187de28f80f5a7cd19edcfa31859656826f802a1ede054fcb6dfb221'
            '68aae00fe82ab9e039b2c6481761c6ac5a7f0685eaf3366cbee00b9ac9dd5483'
            'f28a6d92f2f2ee3a69694468019a59718a8328c28be22c0db23671f376f786f2'
            'ef498690b92a9140cb22facccf595640dfd378353c30e6efd05a4c92e64599de'
            'b6fd027dfcaab88cbe36c952d5eb1ec0e4331f6c1f8fc9f1a0454b3f75502235'
            '9ace9483fc37bbf9ab59b4e58a05c18e66078c29e9e40044e36fc9117bd55bfd'
            'e9e86f7c9146e19c18ba7a10737ec94a655b737f96ce37b25798a5bd11f61c65'
            '562eea848542f76537a9f3993bac397b523d0ce419416daf0bb4dd17f5203c7c'
            'b081462f645ffab7aaf2c310761c269329d3d22a36cf463dd0ba5ebb3da2141e'
            'fc6b8f673cabfa3ce1cba535b6c872cdd41e815fc0c9a6468ac5fa7b5fbe3ce3'
            '3c5122db362c25f92ae78745ea5f3b5052068bdf5104623b375d328c449ae3f2'
            '8412971b2814c1135375d5e5fc52f0f005ac15ed9e7625db59f7f5297f92727e'
            '55b75daf5aad2a8929c80837f986d4474993f781c0ffa4169e38483b0af6e385')

# We can't build (P)NaCL on i686 because the toolchain is x86_64 only and the
# instructions on how to build the toolchain from source don't work that well
# (at least not from within the Chromium 39 source tree).
# https://sites.google.com/a/chromium.org/dev/nativeclient/pnacl/building-pnacl-components-for-distribution-packagers
_build_nacl=1
if [[ $CARCH == i686 ]]; then
  _build_nacl=0
fi

prepare() {
  cd "$srcdir/chromium-$pkgver"

  # https://code.google.com/p/chromium/issues/detail?id=490240
  patch -Np1 -i ../0001-NSS-reject-DH-groups-smaller-than-1024-bits.patch

  # https://code.google.com/p/chromium/issues/detail?id=490260
  patch -Np1 -i ../0001-Use-the-correct-URL-for-ERR_SSL_WEAK_SERVER_EPHEMERA.patch
  
  # Enable support for the Widevine CDM plugin
  # The actual libraries are not included, but can be copied over from Chrome:
  #   libwidevinecdmadapter.so
  #   libwidevinecdm.so
  # (Version string doesn't seem to matter so let's go with "Pinkie Pie")
  sed "s/@WIDEVINE_VERSION@/Pinkie Pie/" ../chromium-widevine.patch |
    patch -Np1

  # Apply Inox patches
  patch -p1 < ../disable-autofill-download-manager.patch
  patch -p1 < ../disable-google-url-tracker.patch
  patch -p1 < ../disable-default-extensions.patch
  patch -p1 < ../modify-default-prefs.patch
  patch -p1 < ../disable-notification-promo-fetch.patch
  patch -p1 < ../disable-instant-extended-api.patch
  patch -p1 < ../disable-google-ipv6-probes.patch
  patch -p1 < ../disable-gcm-status-check.patch
  patch -p1 < ../add-duckduckgo-search-engine.patch
  patch -p1 < ../branding.patch
  patch -p1 < ../disable-missing-key-warning.patch
  
  # Remove bundled ICU; its header files appear to get picked up instead of
  # the system ones, leading to errors during the final link stage
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
  
  # Patch Inox launcher
  cd "$srcdir/chromium-launcher-$_launcher_ver"
  patch -p1 < ../launcher-branding.patch
}

build() {
  cd "$srcdir/chromium-launcher-$_launcher_ver"
  make PREFIX=/usr

  cd "$srcdir/chromium-$pkgver"

  export PATH="$srcdir/python2-path:$PATH"

  # CFLAGS are passed through release_extra_cflags below
  export -n CFLAGS CXXFLAGS

  local _chromium_conf=(
    -Dwerror=
    -Dclang=0
    -Dpython_ver=2.7
    -Dlinux_link_gsettings=1
    -Dlinux_link_libpci=1
    -Dlinux_link_libspeechd=0
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
    -Duse_system_ssl=0
    -Duse_system_xdg_utils=1
    -Duse_system_yasm=1
    -Duse_system_zlib=0
    -Dusb_ids_path=/usr/share/hwdata/usb.ids
    -Duse_mojo=0
    -Duse_gconf=0
    -Ddisable_fatal_linker_warnings=1
    -Ddisable_glibc=1
    -Denable_webrtc=0
    -Denable_google_now=0
    -Denable_remoting=0
    -Dsafe_browsing_mode=0
    -Denable_rlz=0
    -Denable_hangout_services_extension=0
    -Dbranding=Chromium
    -Dgoogle_chrome_build=0
    -Denable_web_speech=1
    -Denable_wifi_bootstrapping=0
    -Denable_speech_input=0
    -Denable_pre_sync_backup=0
    -Denable_print_preview=0
    )

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
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.launcher"

  cd "$srcdir/chromium-$pkgver"

  install -D out/Release/chrome "$pkgdir/usr/lib/$pkgname/$pkgname"

  install -Dm4755 out/Release/chrome_sandbox \
    "$pkgdir/usr/lib/$pkgname/chrome-sandbox"

  install -D out/Release/chromedriver "$pkgdir/usr/lib/$pkgname/inoxdriver"

  cp out/Release/{*.pak,*.bin} \
    "$pkgdir/usr/lib/$pkgname/"

  # Manually strip binaries so that 'nacl_irt_*.nexe' is left intact
  strip $STRIP_BINARIES "$pkgdir/usr/lib/$pkgname/"{"$pkgname",chrome-sandbox} \
    "$pkgdir/usr/lib/$pkgname/inoxdriver"

  if (( $_build_nacl )); then
    cp out/Release/nacl_helper{,_bootstrap} out/Release/nacl_irt_*.nexe \
      "$pkgdir/usr/lib/$pkgname/"
    strip $STRIP_BINARIES "$pkgdir/usr/lib/$pkgname/"nacl_helper{,_bootstrap}
  fi

  cp -a out/Release/locales "$pkgdir/usr/lib/$pkgname/"

  install -Dm644 out/Release/chrome.1 "$pkgdir/usr/share/man/man1/$pkgname.1"

  install -Dm644 "$srcdir/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  for size in 22 24 48 64 128 256; do
    install -Dm644 "chrome/app/theme/chromium/product_logo_$size.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$pkgname.png"
  done

  for size in 16 32; do
    install -Dm644 "chrome/app/theme/default_100_percent/chromium/product_logo_$size.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$pkgname.png"
  done

  ln -s /usr/lib/$pkgname/inoxdriver "$pkgdir/usr/bin/inoxdriver"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
