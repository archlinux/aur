# $Id: PKGBUILD 227394 2014-12-10 12:36:46Z foutrelis $
# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=chromium-wayland
_pkgname=chromium
pkgver=45.0.2421.0
_wayland_pkgver="Chromium-V45.0"
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
         'hicolor-icon-theme' 'libxkbcommon')
makedepends=('python2' 'gperf' 'yasm' 'mesa' 'ninja')
makedepends_x86_64=('lib32-gcc-libs' 'lib32-zlib')
optdepends=('kdebase-kdialog: needed for file dialogs in KDE'
            'gnome-keyring: for storing passwords in GNOME keyring'
            'kdeutils-kwalletmanager: for storing passwords in KWallet')
conflicts=('chromium')
provides=('chromium')
options=('!strip')
install=chromium.install
source=(https://commondatastorage.googleapis.com/chromium-browser-official/$_pkgname-$pkgver.tar.xz
        https://github.com/01org/ozone-wayland/archive/${_wayland_pkgver}.tar.gz
        chromium-launcher-$_launcher_ver.tar.gz::https://github.com/foutrelis/chromium-launcher/archive/v$_launcher_ver.tar.gz
        chromium.desktop)
sha256sums=('53c34e85619d2c1c600af339c0c8c0dc8cb2ded49a0d7677eedb7258810788e1'
            'dfa82876f02f7ae5983cd9bddf33529de7a26d1dd3a86fef388c33d753b3fdd7'
            '7f91c81721092d707d7b94e6555a48bc7fd0bc0e1174df4649bdcd745930e52f'
            '09bfac44104f4ccda4c228053f689c947b3e97da9a4ab6fa34ce061ee83d0322')

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
  cd "$srcdir/$_pkgname-$pkgver"

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

  # Ozone-Wayland
  mv ../ozone-wayland-${_wayland_pkgver} ozone
  # Rm broken patches. TODO: Figure out _why_ this is broken...
  rm ozone/patches/0010*

  # Patch!
  for patchfile in ozone/patches/00*; do
    echo "Applying ${patchfile}."
    patch -p1 <$patchfile
  done
}

build() {
  cd "$srcdir/chromium-launcher-$_launcher_ver"

  make PREFIX=/usr

  cd "$srcdir/$_pkgname-$pkgver"

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
    -Drelease_extra_cflags="$CFLAGS -I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include"
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
    -Ddisable_glibc=1
    -Duse_ash=1
    -Duse_aura=1
    -Dchromeos=0
    -Duse_ozone=1
    -Duse_xkbcommon=1)

  if (( ! $_build_nacl )); then
    _chromium_conf+=(
      -Ddisable_nacl=1
      -Ddisable_pnacl=1
    )
  fi

  build/linux/unbundle/replace_gyp_files.py "${_chromium_conf[@]}"
  build/gyp_chromium --depth=. "${_chromium_conf[@]}"

  ninja "${MAKEFLAGS}" -C out/Release chrome chrome_sandbox chromedriver
}

package() {
  cd "$srcdir/chromium-launcher-$_launcher_ver"

  make PREFIX=/usr DESTDIR="$pkgdir" install-strip
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/chromium/LICENSE.launcher"

  cd "$srcdir/$_pkgname-$pkgver"

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

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
