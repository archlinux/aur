# Maintainer: Alastair Hughes < hobbitalastair at yandex dot com>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=chromium-wayland-git
_pkgname=chromium
pkgver=48.0.2548.0
pkgrel=1
pkgdesc="The open-source project behind Google Chrome, an attempt at creating a safer, faster, and more stable browser"
arch=('i686' 'x86_64')
url="http://github.com/01org/ozone-wayland/"
license=('BSD')
depends=('nss' 'alsa-lib' 'bzip2' 'libevent' 'icu' 'libgcrypt'
         'ttf-font' 'systemd' 'dbus' 'flac' 'snappy' 'pciutils'
         'harfbuzz' 'libvpx' 'perl' 'perl-file-basedir'
         'desktop-file-utils' 'libxslt' 'hicolor-icon-theme' 'libxkbcommon'
         'gtk2' 'libpulse')
makedepends=('python2' 'gperf' 'yasm' 'mesa' 'ninja' 'libexif' 'libsecret')
makedepends_x86_64=('lib32-gcc-libs' 'lib32-zlib')
optdepends=('kdebase-kdialog: needed for file dialogs in KDE'
            'gnome-keyring: for storing passwords in GNOME keyring')
conflicts=('chromium')
provides=('chromium')
options=('!strip')
install=chromium.install
source=(https://commondatastorage.googleapis.com/chromium-browser-official/$_pkgname-$pkgver.tar.xz
        chromium.desktop
        chromium-widevine.patch
        unbundle-libvpx_new-fix.patch)
sha256sums=('4ca4e2adb340b3fb4d502266ad7d6bda45fa3519906dbf63cce11a63f680dbc8'
            '028a748a5c275de9b8f776f97909f999a8583a4b77fd1cd600b4fc5c0c3e91e9'
            '379b746e187de28f80f5a7cd19edcfa31859656826f802a1ede054fcb6dfb221'
            '6a2fd2d8ce5363a67452f6531a6b83f1e535f800286119fd9910d3b31c76c3bc')

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

  touch chrome/test/data/webui/i18n_process_css_test.html

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

  # Ozone-Wayland
  mv ../ozone-wayland ozone

  # Patch to fix build with use_system_libvpx
  # Chromium bug #541273
  patch -p1 < "${srcdir}/unbundle-libvpx_new-fix.patch"

  # Patch!
  for patchfile in ozone/patches/00*; do
    echo "Applying ${patchfile}."
    patch -p1 <$patchfile
  done

}

build() {
  cd "${srcdir}/"

  mkdir chromium
  cd chromium

  export PATH="${srcdir}/depot_tools:$PATH"
  export PATH="${srcdir}/path:$PATH"
  export GYP_DEFINES="target_arch=x64"

  gclient config --name=src https://github.com/Igalia/chromium.git
  gclient sync --with_branch_heads --nohooks

  gclient runhooks

  cd src

  gn args out/Ozone --args="use_ozone=true enable_package_mash_services=true" # use_xkbcommon=true
  ninja -C out/Ozone chrome
}

package() {
  cd "$srcdir/chromium/src"

  install -D out/Ozone/chrome "$pkgdir/usr/lib/chromium/chromium"
  install -Dm644 out/Ozone/chrome.1 "$pkgdir/usr/share/man/man1/chromium.1"

  install -Dm4755 out/Ozone/chrome_sandbox \
    "$pkgdir/usr/lib/chromium/chrome-sandbox"

  cp -a \
    out/Ozone/{chrome_{100,200}_percent,resources}.pak \
    out/Ozone/{*.bin,chromedriver,libwidevinecdmadapter.so} \
    out/Ozone/locales \
    "$pkgdir/usr/lib/chromium/"

  if [[ -z ${_system_libs[icu]+set} ]]; then
    cp out/Ozone/icudtl.dat "$pkgdir/usr/lib/chromium/"
  fi

  ln -s /usr/lib/chromium/chromedriver "$pkgdir/usr/bin/chromedriver"

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
