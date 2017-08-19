# Maintainer: hawkeye116477 <hawkeye116477 at gmail dot com>
# Based on firefox-kde Manjaro's PKGBUILD

pkgname=waterfox-kde
_pkgname=Waterfox
pkgver=55.0.1
pkgrel=1
pkgdesc="Free, open and private browser with openSUSE's patches for better integration with KDE"
arch=('x86_64')
license=('MPL')
url="https://www.waterfoxproject.org/"
depends=('gtk3' 'gtk2' 'mozilla-common' 'libxt' 'startup-notification' 'mime-types' 'dbus-glib' 'ffmpeg'
         'nss' 'hunspell' 'sqlite' 'ttf-font' 'icu' 'libvpx' 'kwaterfoxhelper' 'libevent' 'nspr' 'hicolor-icon-theme')
makedepends=('unzip' 'zip' 'diffutils' 'python2' 'yasm' 'mesa' 'imake' 'gconf' 'inetutils' 'xorg-server-xvfb'
             'autoconf2.13' 'cargo' 'rust' 'clang' 'llvm')
optdepends=('networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'pulseaudio: Audio support'
            'alsa-lib: Audio support'
            'jack: Audio support'
            'speech-dispatcher: Text-to-Speech')
provides=("waterfox=${pkgver}")
conflicts=('waterfox')
options=('!emptydirs' '!makeflags' 'zipman')
_patchrev=fde25c29562d
_patchurl=http://www.rosenauer.org/hg/mozilla/raw-file/$_patchrev
_commit=e57df0da9107b905df21fff86496e19ed1358603
source=("waterfox-$pkgver.source.tar.gz::https://github.com/MrAlex94/Waterfox/archive/$_commit.tar.gz"
        "waterfox.desktop::https://raw.githubusercontent.com/hawkeye116477/waterfox-deb/master/BUILD/waterfox-kde/debian/waterfox.desktop"
        waterfox-install-dir.patch 
        no-crmf.diff
        "fix-wifi-scanner.diff::https://github.com/hawkeye116477/Waterfox/raw/plasma/_Plasma_Build/fix-wifi-scanner.diff"
        "mozilla-kde.patch::$_patchurl/mozilla-kde.patch"
        "firefox-kde.patch::$_patchurl/firefox-kde.patch"
        "fix_waterfox_browser-kde_xul.patch::https://raw.githubusercontent.com/hawkeye116477/Waterfox/plasma/_Plasma_Build/fix_waterfox_browser-kde_xul.patch"
        pgo_fix_missing_kdejs.patch
        "kde.js::https://raw.githubusercontent.com/hawkeye116477/Waterfox/plasma/_Plasma_Build/kde.js"
        "distribution.ini::https://raw.githubusercontent.com/hawkeye116477/waterfox-deb/master/BUILD/waterfox-kde/debian/distribution.ini"
        "waterfox.1::https://raw.githubusercontent.com/hawkeye116477/waterfox-deb/master/BUILD/waterfox-kde/debian/waterfox.1"
        default22.png
        default24.png
        default256.png)
sha256sums=('SKIP'
            '2a17f68e86c2c871a1ff32f0a012c7ad20ac542b935044e5ffd9716874641f4d'
            'd86e41d87363656ee62e12543e2f5181aadcff448e406ef3218e91865ae775cd'
            'fb85a538044c15471c12cf561d6aa74570f8de7b054a7063ef88ee1bdfc1ccbb'
            '9765bca5d63fb5525bbd0520b7ab1d27cabaed697e2fc7791400abc3fa4f13b8'
            '512d9a06acdb30b023a0601ecf2f7b5104e2838d4431957b97910f24d98b5bef'
            'a3af6d55c07fd4cd06c044bc1bf289caf16f40d8eb150bc505e035e37696bfa2'
            '774d13c0d319b83a3f90d15ceed093e80ff07a2794038c95ffa79539ca2819cc'
            'bf6743660623b7c9a43b94edc8acbcade07aa222ff2102a2808809df333ebe8e'
            '0850a8a8dea9003c67a8ee1fa5eb19a6599eaad9f2ad09db753b74dc5048fdbc'
            'e144a6fac4466acdba86194b43fb41c185c38e296d6262f26c3bff3d2b6db3be'
            '03a25b7bde971ecfa35326b3c6e45450da325babed29d9cc2e10dd639f816ef6'
            '57c68bd9fd2e06d9e683f223fa2e8a09bdbaef3cca63f1f5b9bd73ef3faedefa'
            '84155ad7e6eff928acdc37a15c7075f78f44589771741ffbeaf159076114cda0'
            '08a31d8c172f2cd04e9f1c8a417cccee77c084e3a85560fbb104239774f4e7a3')

prepare() {
  mkdir path
  ln -s /usr/bin/python2 path/python
  
  mv $srcdir/$_pkgname-$_commit $srcdir/$pkgname-$pkgver
  
  # Fix openSUSE's patches for Waterfox
  sed -i 's/Firefox/Waterfox/g' $srcdir/mozilla-kde.patch
  sed -i 's/KMOZILLAHELPER/KWATERFOXHELPER/g' $srcdir/mozilla-kde.patch
  sed -i 's|/usr/lib/mozilla/kmozillahelper|/opt/waterfox/kwaterfoxhelper|g' $srcdir/mozilla-kde.patch
  sed -i 's/kmozillahelper/kwaterfoxhelper/g' $srcdir/mozilla-kde.patch
  sed -i 's/firefox/waterfox/g' $srcdir/firefox-kde.patch
  
  cd $pkgname-$pkgver
  patch -Np1 -i ../waterfox-install-dir.patch

  # https://bugzilla.mozilla.org/show_bug.cgi?id=1371991
  patch -Np1 -i ../no-crmf.diff

  # https://bugzilla.mozilla.org/show_bug.cgi?id=1314968
  patch -Np1 -i $srcdir/fix-wifi-scanner.diff

  cat >.mozconfig <<END
export CC=clang
export CXX=clang++
export LDFLAGS="-Wl,-z,norelro,-O3,--sort-common,--as-needed,--relax,-z,combreloc,-z,global,--no-omagic"

ac_add_options --enable-optimize="-O3 -msse2 -mfpmath=sse -march=native -mtune=native -fcolor-diagnostics -w"
ac_add_options --target=x86_64-pc-linux-gnu
ac_add_options --with-ccache=ccache

# If you have pulse audio, uncomment this line:
# ac_add_options --enable-pulseaudio

# If you have pulse audio, comment this line:
ac_add_options --disable-pulseaudio 

# If you don't have alsa, comment this line:
ac_add_options --enable-alsa

# If you have jack, uncomment this line:
# ac_add_options --enable-jack

mk_add_options AUTOCLOBBER=1
mk_add_options MOZ_MAKE_FLAGS=-j6

ac_add_options --prefix=/usr
ac_add_options --libdir=/opt

ac_add_options --with-app-name=waterfox
ac_add_options --with-app-basename=Waterfox
ac_add_options --with-branding=browser/branding/unofficial
ac_add_options --with-distribution-id=org.waterfoxproject

# Library and chrome format
ac_add_options --enable-chrome-format=omni
ac_add_options --x-libraries=/usr/lib

# System libraries
ac_add_options --with-system-nspr
ac_add_options --with-system-nss
ac_add_options --with-system-jpeg
ac_add_options --with-system-zlib
ac_add_options --with-system-bz2
ac_add_options --with-system-png
ac_add_options --with-system-libevent
ac_add_options --with-system-libvpx
ac_add_options --with-system-icu
ac_add_options --enable-system-hunspell
ac_add_options --enable-system-sqlite
ac_add_options --enable-system-ffi
ac_add_options --enable-system-pixman
ac_add_options --disable-libproxy

# Disable unwanted features
ac_add_options --disable-crashreporter
ac_add_options --disable-js-shell
ac_add_options --disable-maintenance-service
ac_add_options --disable-updater
ac_add_options --disable-verify-mar
ac_add_options --disable-elf-hack
ac_add_options --disable-mobile-optimize
ac_add_options --disable-debug
ac_add_options --disable-debug-symbols
ac_add_options --disable-profiling
ac_add_options --disable-signmar
ac_add_options --disable-tests
ac_add_options --disable-parental-controls
ac_add_options --disable-accessibility

# If you want to have text-to-speech support, comment this line:
ac_add_options --disable-webspeech

# If you want to have geolocation support, comment this line:
ac_add_options --disable-necko-wifi 

# If you have some problems with Skype Web or other web chat, comment this line:
ac_add_options --disable-webrtc

# If you want to have gamepad support, comment this line:
ac_add_options --disable-gamepad

# Enable wanted features
ac_add_options --enable-jemalloc
ac_add_options --with-pthreads
ac_add_options --enable-strip
ac_add_options --enable-startup-notification
ac_add_options --enable-release
ac_add_options --enable-application=browser
ac_add_options --enable-eme=widevine

END

  msg "Patching for KDE"
  patch -Np1 -i "$srcdir/mozilla-kde.patch"
  patch -Np1 -i "$srcdir/firefox-kde.patch"
  patch -Np1 -i "$srcdir/fix_waterfox_browser-kde_xul.patch"

  msg "Add missing file in Makefile for pgo builds"
  patch -Np1 -i "$srcdir/pgo_fix_missing_kdejs.patch"
  
  # Fix missing icons
  for i in 22 24 256; do
	  if [ ! -f "${srcdir}/$pkgname-$pkgver/browser/branding/unofficial/default$i.png" ]; then
		cp "${srcdir}/default$i.png" "${srcdir}/$pkgname-$pkgver/browser/branding/unofficial/default$i.png"
	  fi
  done
}

build() {
  cd $pkgname-$pkgver
  export PATH="$srcdir/path:$PATH"
    make -f client.mk build
}

package() {
  cd $pkgname-$pkgver

  cp "$srcdir/kde.js" obj-$CARCH-pc-linux-gnu/dist/bin/defaults/pref

  make -f client.mk DESTDIR="$pkgdir" INSTALL_SDK= install

  _vendorgrejs="$pkgdir/opt/waterfox/defaults/pref/vendor-gre.js"
  install -Dm644 /dev/stdin "$_vendorgrejs" <<END
// Use LANG environment variable to choose locale
pref("intl.locale.matchOS", true);

// Fall back to en-US search plugins if none exist for the current locale
pref("distribution.searchplugins.defaultLocale", "en-US");

// Enable Network Manager integration
pref("network.manage-offline-status", true);
END

  _vendor_wfjs="$pkgdir/opt/waterfox/browser/defaults/preferences/vendor-waterfox.js"
  install -Dm644 /dev/stdin "$_vendor_wfjs" <<END
// Disable default browser checking
pref("browser.shell.checkDefaultBrowser", false);

// Don't disable extensions dropped in to a system
// location, or those owned by the application
pref("extensions.autoDisableScopes", 3);

// Don't display the one-off addon selection dialog when
// upgrading from a version of Waterfox older than 8.0
pref("extensions.shownSelectionUI", true);
END

  install -Dm644 "$srcdir/kde.js" "$pkgdir/opt/waterfox/browser/defaults/preferences/kde.js"

  for i in 16 22 24 32 48 256; do
    install -Dm644 browser/branding/unofficial/default$i.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/waterfox.png"
  done
  install -Dm644 browser/branding/unofficial/content/icon64.png \
    "$pkgdir/usr/share/icons/hicolor/64x64/apps/waterfox.png"
  install -Dm644 browser/branding/unofficial/mozicon128.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/waterfox.png"
  install -Dm644 browser/branding/unofficial/content/about-logo.png \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/waterfox.png"
  install -Dm644 browser/branding/unofficial/content/about-logo@2x.png \
    "$pkgdir/usr/share/icons/hicolor/384x384/apps/waterfox.png"

  install -Dm644 $srcdir/waterfox.desktop \
    "$pkgdir/usr/share/applications/waterfox.desktop"
    
  install -Dm644 $srcdir/waterfox.1 \
    "$pkgdir/usr/share/man/man1/waterfox.1"
    
  install -Dm644 $srcdir/distribution.ini \
    "$pkgdir/opt/waterfox/distribution/distribution.ini"

  # Use system-provided dictionaries
  rm -r "$pkgdir"/opt/waterfox/dictionaries
  ln -Ts /usr/share/hunspell "$pkgdir/opt/waterfox/dictionaries"
  ln -Ts /usr/share/hyphen "$pkgdir/opt/waterfox/hyphenation"

  # Install a wrapper to avoid confusion about binary path
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/waterfox" <<END
#!/bin/sh
exec /opt/waterfox/waterfox "\$@"
END

  # Replace duplicate binary with wrapper
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -srf "$pkgdir/usr/bin/waterfox" \
    "$pkgdir/opt/waterfox/waterfox-bin"
}
