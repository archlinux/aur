# $Id$
# Maintainer: afontenot <adam.m.fontenot@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>

pkgname=firefox-clean
_pkgname=firefox
pkgver=55.0.3
pkgrel=3
pkgdesc="Standalone web browser from mozilla.org"
arch=(i686 x86_64)
license=(MPL GPL LGPL)
url="https://www.mozilla.org/firefox/"
depends=(gtk3 gtk2 mozilla-common libxt startup-notification mime-types dbus-glib ffmpeg
         nss hunspell sqlite ttf-font libpulse icu)
makedepends=(unzip zip diffutils python2 yasm mesa imake gconf inetutils xorg-server-xvfb
             autoconf2.13 rust mercurial)
optdepends=('networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'pulseaudio: Audio support'
            'speech-dispatcher: Text-to-Speech')
options=(!emptydirs !makeflags !strip)
conflicts=('firefox')
provides=('firefox=55.0.3-3')
_repo=https://hg.mozilla.org/mozilla-unified
source=("hg+$_repo#tag=FIREFOX_${pkgver//./_}_RELEASE"
        $_pkgname.desktop firefox-symbolic.svg
        wifi-disentangle.patch wifi-fix-interface.patch
        clip-ft-glyph.diff harmony-fix.diff
        firefox-install-dir.patch no-crmf.diff glibc-2.26-fix.diff
	disable-pocket.diff add-restart.diff)
sha256sums=('SKIP'
            'ada313750e6fb14558b37c764409a17c1672a351a46c73b350aa1fe4ea9220ef'
            'a2474b32b9b2d7e0fb53a4c89715507ad1c194bef77713d798fa39d507def9e9'
            'f068b84ad31556095145d8fefc012dd3d1458948533ed3fff6cbc7250b6e73ed'
            'e98a3453d803cc7ddcb81a7dc83f883230dd8591bdf936fc5a868428979ed1f1'
            'd5e5580a96ecc4a66ce12dde0737c1ed5cb31017a6ec488ffe372192ed893e1b'
            '16bb776e9f3039321db747b2eaece0cda1320f3711fb853a68d67247b0aa065d'
            'd86e41d87363656ee62e12543e2f5181aadcff448e406ef3218e91865ae775cd'
            'fb85a538044c15471c12cf561d6aa74570f8de7b054a7063ef88ee1bdfc1ccbb'
            'cd7ff441da66a287f8712e60cdc9e216c30355d521051e2eaae28a66d81915e8'
	    'a454ba3ac3a5c5f6594ae60a71fc3a83138a320e41ea159a3cf44aab4d1362bb'
	    '44d9b10d4031445fcb3e5cdbb15e36851d3de3c37a921d230968667ee29a29e2')		

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

  cd mozilla-unified
  patch -Np1 -i ../firefox-install-dir.patch

  # https://bugzilla.mozilla.org/show_bug.cgi?id=1371991
  patch -Np1 -i ../no-crmf.diff

  # https://bugzilla.mozilla.org/show_bug.cgi?id=1385667
  # https://bugzilla.mozilla.org/show_bug.cgi?id=1394149
  patch -Np1 -i ../glibc-2.26-fix.diff

  # https://bugzilla.mozilla.org/show_bug.cgi?id=1314968
  patch -Np1 -i ../wifi-disentangle.patch
  patch -Np1 -i ../wifi-fix-interface.patch

  # https://bugzilla.mozilla.org/show_bug.cgi?id=1393467
  patch -Np1 -i ../clip-ft-glyph.diff

  # https://bugzilla.mozilla.org/show_bug.cgi?id=1400721
  patch -Np1 -i ../harmony-fix.diff

  # Disable anti-features
  patch -Np1 -i ../disable-pocket.diff

  # Add restart to file menu
  patch -Np1 -i ../add-restart.diff

  echo -n "$_google_api_key" >google-api-key
  echo -n "$_mozilla_api_key" >mozilla-api-key

  cat >.mozconfig <<END
ac_add_options --enable-application=browser

ac_add_options --prefix=/usr
ac_add_options --enable-release
ac_add_options --enable-gold
ac_add_options --enable-pie

# Branding
ac_add_options --enable-official-branding
ac_add_options --enable-update-channel=release
ac_add_options --with-distribution-id=org.archlinux
export MOZILLA_OFFICIAL=1
export MOZ_TELEMETRY_REPORTING=0
export MOZ_ADDON_SIGNING=1
export MOZ_REQUIRE_SIGNING=0

# Keys
ac_add_options --with-google-api-keyfile=${PWD@Q}/google-api-key
ac_add_options --with-mozilla-api-keyfile=${PWD@Q}/mozilla-api-key

# System libraries
ac_add_options --with-system-nspr
ac_add_options --with-system-nss
ac_add_options --with-system-icu
ac_add_options --with-system-zlib
ac_add_options --with-system-bz2
ac_add_options --enable-system-hunspell
ac_add_options --enable-system-sqlite
ac_add_options --enable-system-ffi
ac_add_options --enable-system-pixman

# Features
ac_add_options --enable-startup-notification
ac_add_options --enable-crashreporter
ac_add_options --disable-updater
END
}

build() {
  cd mozilla-unified

  # _FORTIFY_SOURCE causes configure failures

  # CPPFLAGS+=" -O2"

  export PATH="$srcdir/path:$PATH"
  export MOZ_SOURCE_REPO="$_repo"

  # Do PGO
  #xvfb-run -a -n 95 -s "-extension GLX -screen 0 1280x1024x24" \
  #  MOZ_PGO=1 ./mach build
  ./mach build
  ./mach buildsymbols
}

package() {
  cd mozilla-unified
  DESTDIR="$pkgdir" ./mach install
  find . -name '*crashreporter-symbols.zip' -exec cp -fvt "$startdir" {} +

  _vendorjs="$pkgdir/usr/lib/$_pkgname/browser/defaults/preferences/vendor.js"
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

// DuckDuckGo instead of Yahoo
pref("browser.search.defaultenginename", "DuckDuckGo")
pref("browser.search.defaultenginename.US", "DuckDuckGo")
pref("browser.search.order.1", "DuckDuckGo")
pref("browser.search.order.2", "Google")
pref("browser.search.order.US.1", "DuckDuckGo")

// Disable Google's safe browsing by default
pref("browser.safebrowsing.malware.enabled", false)
pref("browser.safebrowsing.phishing.enabled", false)
pref("browser.safebrowsing.downloads.enabled", false)

// Disable suggested sites
pref("browser.newtabpage.enhanced", false)
END

  _distini="$pkgdir/usr/lib/$_pkgname/distribution/distribution.ini"
  install -Dm644 /dev/stdin "$_distini" <<END
[Global]
id=archlinux
version=1.0
about=Mozilla Firefox for Arch Linux

[Preferences]
app.distributor=archlinux
app.distributor.channel=$_pkgname
app.partner.archlinux=archlinux
END

  for i in 16 22 24 32 48 256; do
    install -Dm644 browser/branding/official/default$i.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$_pkgname.png"
  done
  install -Dm644 browser/branding/official/content/icon64.png \
    "$pkgdir/usr/share/icons/hicolor/64x64/apps/$_pkgname.png"
  install -Dm644 browser/branding/official/mozicon128.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/$_pkgname.png"
  install -Dm644 browser/branding/official/content/about-logo.png \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/$_pkgname.png"
  install -Dm644 browser/branding/official/content/about-logo@2x.png \
    "$pkgdir/usr/share/icons/hicolor/384x384/apps/$_pkgname.png"
  install -Dm644 ../firefox-symbolic.svg \
    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/$_pkgname-symbolic.svg"

  install -Dm644 ../$_pkgname.desktop \
    "$pkgdir/usr/share/applications/$_pkgname.desktop"

  # Use system-provided dictionaries
  rm -r "$pkgdir"/usr/lib/$_pkgname/dictionaries
  ln -Ts /usr/share/hunspell "$pkgdir/usr/lib/$_pkgname/dictionaries"
  ln -Ts /usr/share/hyphen "$pkgdir/usr/lib/$_pkgname/hyphenation"

  # Install a wrapper to avoid confusion about binary path
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" <<END
#!/bin/sh
exec /usr/lib/$_pkgname/firefox "\$@"
END

  # Replace duplicate binary with wrapper
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -srf "$pkgdir/usr/bin/$_pkgname" \
    "$pkgdir/usr/lib/$_pkgname/firefox-bin"
}
