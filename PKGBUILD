# Maintainer: Gustavo Castro < gustawho [at] openmailbox [dot] org >

pkgname=firefox-ubuntu
pkgver=50.1.0
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org with Global Menu integration"
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
url="https://www.mozilla.org/firefox/"
depends=('gtk3' 'mozilla-common' 'libxt' 'startup-notification' 'mime-types'
         'dbus-glib' 'alsa-lib' 'desktop-file-utils' 'hicolor-icon-theme'
         'libvpx' 'icu'  'libevent' 'nss>=3.18.1' 'nspr>=4.10.6' 'hunspell'
         'sqlite' 'libnotify' 'ffmpeg' )
makedepends=('unzip' 'zip' 'diffutils' 'python2' 'yasm' 'mesa' 'imake' 'gconf'
             'xorg-server-xvfb' 'libpulse' 'inetutils' 'autoconf2.13' 'rust')
optdepends=('networkmanager: Location detection via available WiFi networks'
            'gst-plugins-good: h.264 video'
            'gst-libav: h.264 video'
            'upower: Battery API')
provides=("firefox=${pkgver}")
conflicts=('firefox')
options=('!emptydirs'  'strip' )
source=(https://ftp.mozilla.org/pub/mozilla.org/firefox/releases/$pkgver/source/firefox-$pkgver.source.tar.xz
        mozconfig
        firefox.desktop
        firefox-install-dir.patch
        vendor.js
        firefox-fixed-loading-icon.png
        unity-menubar.patch
        fix-wifi-scanner.diff
        rust-i686.patch
        configure.patch)
sha256sums=('54bb9bccbf9eed0c7715ae7f45330bf41ce24b756f5fdecb380e06709a6ac5a4'
            'd269c6f13ba588726edbb7f4518eb6c2ce56a6016289b47f587f25c3219805fc'
            '75c526e9669b91b4fe5dcea650a1e8419220abb2e9564184f0d984c71eae82e8'
            'd86e41d87363656ee62e12543e2f5181aadcff448e406ef3218e91865ae775cd'
            '93c5df00f409988bbfa890ac175103476ead3af68f7501973ee70bd11dc472f8'
            '68e3a5b47c6d175cc95b98b069a15205f027cab83af9e075818d38610feb6213'
            '220be1365731088afc0b170800da63cdb9c564f975da8ee1aa3133e16b7e6bdb'
            '9765bca5d63fb5525bbd0520b7ab1d27cabaed697e2fc7791400abc3fa4f13b8'
            'f61ea706ce6905f568b9bdafd1b044b58f20737426f0aa5019ddb9b64031a269'
            '7120bf95ef9880272b3615cde98d30845c03009e3e6125e11f9862bfd93900bd')

# Google API keys (see http://www.chromium.org/developers/how-tos/api-keys)
# Note: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys. Feel free to contact foutrelis@archlinux.org for
# more information.
_google_api_key=AIzaSyDwr302FpOSkGRpLlUpPThNTDPbXcIn_FM
_google_default_client_id=413772536636.apps.googleusercontent.com
_google_default_client_secret=0ZChLK6AxeA3Isu96MkwqDR4

# Mozilla API keys (see https://location.services.mozilla.com/api)
# Note: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys. Feel free to contact heftig@archlinux.org for
# more information.
_mozilla_api_key=16674381-f021-49de-8622-3021c5942aff


prepare() {
  #cd mozilla-release
  cd firefox-$pkgver
  patch -Np0 -i "$srcdir/configure.patch"
  cp "$srcdir/mozconfig" .mozconfig
  patch -Np1 -i "$srcdir/firefox-install-dir.patch"
  patch -Np1 -i "$srcdir/rust-i686.patch"
  patch -Np1 -i "$srcdir/unity-menubar.patch"

  echo -n "$_google_api_key" >google-api-key
  echo "ac_add_options --with-google-api-keyfile=\"$PWD/google-api-key\"" >>.mozconfig

  echo -n "$_google_default_client_id $_google_default_client_secret" >google-oauth-api-key
  echo "ac_add_options --with-google-oauth-api-keyfile=\"$PWD/google-oauth-api-key\"" >>.mozconfig

  echo -n "$_mozilla_api_key" >mozilla-api-key
  echo "ac_add_options --with-mozilla-api-keyfile=\"$PWD/mozilla-api-key\"" >>.mozconfig

  mkdir "$srcdir/path"

  # WebRTC build tries to execute "python" and expects Python 2
  mkdir -p "$srcdir/path"
  ln -sf /usr/bin/python2 "$srcdir/path/python"

  # Fix tab loading icon (flickers with libpng 1.6)
  # https://bugzilla.mozilla.org/show_bug.cgi?id=841734
  # TODO: Remove this; Firefox 34 might use CSS animations for the loading icon
  # https://bugzilla.mozilla.org/show_bug.cgi?id=759252
  cp "$srcdir/firefox-fixed-loading-icon.png" \
    browser/themes/linux/tabbrowser/loading.png
}

build() {
  cd firefox-$pkgver

  export PATH="$srcdir/path:$PATH"
  export PYTHON="/usr/bin/python2"

  # _FORTIFY_SOURCE causes configure failures
  CPPFLAGS+=" -O2"

  # GCC 6
  CFLAGS+=" -fPIC -fno-delete-null-pointer-checks -fno-lifetime-dse -fno-schedule-insns2"
  CXXFLAGS+=" -fPIC -fno-delete-null-pointer-checks -fno-lifetime-dse -fno-schedule-insns2"

  # Hardening
  LDFLAGS+=" -Wl,-z,now"

  if [[ $CARCH == i686 ]]; then
    LDFLAGS+=" -Xlinker --no-keep-memory"
  fi

  if [[ -n $_pgo ]]; then
    # Do PGO
    xvfb-run -a -s "-extension GLX -screen 0 1280x1024x24" \
      make -f client.mk build MOZ_PGO=1
  else
    make -f client.mk build
  fi
}

package() {
  cd firefox-$pkgver
  make -f client.mk DESTDIR="$pkgdir" INSTALL_SDK= install

  install -Dm644 "$srcdir/vendor.js" "$pkgdir/usr/lib/firefox/browser/defaults/preferences/vendor.js"

  for i in 16 22 24 32 48 256; do
      install -Dm644 browser/branding/official/default$i.png \
        "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/firefox.png"
  done

  install -Dm644 browser/branding/official/content/icon64.png \
    "$pkgdir/usr/share/icons/hicolor/64x64/apps/firefox.png"
  install -Dm644 browser/branding/official/mozicon128.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/firefox.png"
  install -Dm644 browser/branding/official/content/about-logo.png \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/firefox.png"
  install -Dm644 browser/branding/official/content/about-logo@2x.png \
    "$pkgdir/usr/share/icons/hicolor/384x384/apps/firefox.png"

  install -Dm644 "$srcdir/firefox.desktop" "$pkgdir/usr/share/applications/firefox.desktop"

  # Use system-provided dictionaries
  rm -rf "$pkgdir"/usr/lib/firefox/{dictionaries,hyphenation}
  ln -s /usr/share/hunspell "$pkgdir/usr/lib/firefox/dictionaries"
  ln -s /usr/share/hyphen "$pkgdir/usr/lib/firefox/hyphenation"

  #workaround for now
  #https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -sf firefox "$pkgdir/usr/lib/firefox/firefox-bin"
}
