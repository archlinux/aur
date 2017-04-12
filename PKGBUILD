pkgname=firefox-beta
pkgver=53.0b10
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org - Beta [testing]"
arch=('x86_64')
license=('MPL' 'GPL' 'LGPL')
url="https://www.mozilla.org/firefox/"
depends=('gtk3' 'gtk2' 'mozilla-common' 'libxt' 'startup-notification' 'mime-types' 'dbus-glib' 'alsa-lib' 'ffmpeg' 'libvpx' 'libevent' 'nss' 'hunspell' 'sqlite' 'ttf-font' 'icu' 'nss>=3.29.5')
makedepends=('unzip' 'zip' 'diffutils' 'python2' 'yasm' 'mesa' 'imake' 'gconf' 'libpulse' 'inetutils' 'xorg-server-xvfb' 'autoconf2.13' 'cargo')
optdepends=('networkmanager: Location detection via available WiFi networks' 'libnotify: Notification integration' 'speech-dispatcher: Text-to-Speech')
provides=("firefox=$pkgver")
conflicts=("firefox-beta-bin")
options=("!emptydirs" "!makeflags" "!strip")
source=("https://ftp.mozilla.org/pub/firefox/releases/${pkgver}/source/firefox-${pkgver}.source.tar.xz"
'firefox-beta.desktop' 'firefox-symbolic.svg' 'firefox-install-dir.patch' 'fix-wifi-scanner.diff')
sha256sums=('6b89322c367e6e7431fa72def2cb75243e9f12bd9b7972ae7d4a69baafce568c'
            'd6b4c91a7fe77f9a335b44b943e120ce44511e46bbb16ae305cc82b4c3db66cd'
            'a2474b32b9b2d7e0fb53a4c89715507ad1c194bef77713d798fa39d507def9e9'
            'd86e41d87363656ee62e12543e2f5181aadcff448e406ef3218e91865ae775cd'
            '9765bca5d63fb5525bbd0520b7ab1d27cabaed697e2fc7791400abc3fa4f13b8')

# Google API keys (see http://www.chromium.org/developers/how-tos/api-keys)
# Note: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys. Feel free to contact foutrelis@archlinux.org for
# more information.
_google_api_key=AIzaSyDwr302FpOSkGRpLlUpPThNTDPbXcIn_FM

# Mozilla API keys (see https://location.services.mozilla.com/api)
# Note: These are for Arch Linux use ONLY. For your own distribution, please
# get your own set of keys. Feel free to contact heftig@archlinux.org for
# more information.
_mozilla_api_key=16674381-f021-49de-8622-3021c5942aff

prepare() {
  mkdir path
  ln -s /usr/bin/python2 path/python

  cd firefox-$pkgver
  patch -Np1 -i ../firefox-install-dir.patch

  # https://bugzilla.mozilla.org/show_bug.cgi?id=1314968
  patch -Np1 -i ../fix-wifi-scanner.diff

  echo -n "$_google_api_key" >google-api-key
  echo -n "$_mozilla_api_key" >mozilla-api-key

  cat >.mozconfig <<END
ac_add_options --enable-application=browser

ac_add_options --prefix=/usr
ac_add_options --enable-release
ac_add_options --enable-gold
ac_add_options --enable-pie
ac_add_options --enable-rust

# Branding
ac_add_options --enable-official-branding
ac_add_options --enable-update-channel=release
ac_add_options --with-distribution-id=org.archlinux
export MOZILLA_OFFICIAL=1
export MOZ_TELEMETRY_REPORTING=1
export MOZ_SOURCE_REPO=${_repo@Q}
export MOZ_ADDON_SIGNING=1
export MOZ_REQUIRE_SIGNING=1

# Keys
ac_add_options --with-google-api-keyfile=${PWD@Q}/google-api-key
ac_add_options --with-mozilla-api-keyfile=${PWD@Q}/mozilla-api-key

# System libraries
ac_add_options --with-system-nspr
ac_add_options --with-system-nss
ac_add_options --with-system-icu
ac_add_options --with-system-jpeg
ac_add_options --with-system-zlib
ac_add_options --with-system-bz2
ac_add_options --with-system-libevent
ac_add_options --with-system-libvpx
ac_add_options --enable-system-hunspell
ac_add_options --enable-system-sqlite
ac_add_options --enable-system-ffi
ac_add_options --enable-system-pixman

# Features
ac_add_options --enable-startup-notification
ac_add_options --enable-crashreporter
ac_add_options --enable-alsa
ac_add_options --disable-updater

STRIP_FLAGS="--strip-debug"
END
}

build() {
  cd firefox-$pkgver

  # _FORTIFY_SOURCE causes configure failures
  CPPFLAGS+=" -O2"

  # Hardening
  LDFLAGS+=" -Wl,-z,now"

  export PATH="$srcdir/path:$PATH"

  # Do PGO
  #xvfb-run -a -n 95 -s "-extension GLX -screen 0 1280x1024x24" \
  #  make -f client.mk build MOZ_PGO=1
  make -f client.mk build
}

package() {
  cd firefox-$pkgver

  make -f client.mk DESTDIR="$pkgdir" INSTALL_SDK= install
  install -d -m755 "$pkgdir"/opt/firefox-beta
  mv "$pkgdir"/opt/firefox/* "$pkgdir"/opt/firefox-beta/
  rm "$pkgdir"/opt/firefox/


  _vendorjs="$pkgdir/opt/firefox-beta/browser/defaults/preferences/vendor.js"
  install -Dm644 /dev/stdin "$_vendorjs" <<END
// Use LANG environment variable to choose locale
pref("intl.locale.matchOS", true);

// Disable default browser checking.
pref("browser.shell.checkDefaultBrowser", false);

// Don't disable our bundled extensions in the application directory
pref("extensions.autoDisableScopes", 11);
pref("extensions.shownSelectionUI", true);

// Opt all of us into e10s, instead of just 50%
pref("browser.tabs.remote.autostart", true);
END

  _distini="$pkgdir/opt/firefox-beta/distribution/distribution.ini"
  install -Dm644 /dev/stdin "$_distini" <<END
[Global]
id=archlinux
version=1.0
about=Mozilla Firefox for Arch Linux

[Preferences]
app.distributor=archlinux
app.distributor.channel=$pkgname
app.partner.archlinux=archlinux
END

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
  install -Dm644 ../firefox-symbolic.svg \
  "$pkgdir/usr/share/icons/hicolor/symbolic/apps/firefox-symbolic.svg"

  install -Dm644 ../firefox.desktop \
  "$pkgdir/usr/share/applications/firefox.desktop"

  # Use system-provided dictionaries
  rm -r "$pkgdir"/opt/firefox-beta/dictionaries
  ln -Ts /usr/share/hunspell "$pkgdir/opt/firefox-beta/dictionaries"
  ln -Ts /usr/share/hyphen "$pkgdir/opt/firefox-beta/hyphenation"

  # Install a wrapper to avoid confusion about binary path
  install -Dm755 /dev/stdin "$pkgdir/opt/firefox-beta" <<END
#!/bin/sh
exec /opt/firefox-beta/firefox "\$@"
END

  # Replace duplicate binary with wrapper
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -srf "$pkgdir/opt/firefox-beta" \
  "$pkgdir/opt/firefox-beta/firefox-beta-bin"
}
