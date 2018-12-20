# Maintainer: hawkeye116477 <hawkeye116477 at gmail dot com>
# Contributor: meatatt <meatatt at aliyun dot com>
# Based on firefox-kde Manjaro's PKGBUILD

pkgname=waterfox-kde
pkgver=56.2.6
pkgrel=1
pkgdesc="Free, open and private browser with openSUSE's patches for better integration with KDE"
arch=('x86_64')
license=('MPL')
url="https://www.waterfoxproject.org/"
depends=('gtk3' 'gtk2' 'libxt' 'startup-notification' 'mime-types' 'dbus-glib' 'ffmpeg'
         'nss>=3.34' 'hunspell' 'sqlite' 'ttf-font' 'icu' 'kwaterfoxhelper' 'nspr>=4.15' 'hicolor-icon-theme' 'jemalloc')
makedepends=('unzip' 'zip' 'diffutils' 'python2' 'yasm' 'mesa' 'imake' 'gconf' 'inetutils' 'xorg-server-xvfb'
             'autoconf2.13' 'rust' 'clang' 'llvm')
optdepends=('networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'pulseaudio: Audio support'
            'alsa-lib: Audio support'
            'jack: Audio support'
            'speech-dispatcher: Text-to-Speech')
provides=("waterfox=${pkgver}")
conflicts=('waterfox')
options=('!emptydirs' '!makeflags' 'zipman')
_patchrev=7339b115a221
_patchurl=http://www.rosenauer.org/hg/mozilla/raw-file/$_patchrev
_commit=f874dbfaac9344f25e2f363dd3064fbac25d1bbf
source=("git+https://github.com/MrAlex94/Waterfox.git#tag=$pkgver"
        "waterfox.desktop::https://raw.githubusercontent.com/hawkeye116477/waterfox-deb/master/waterfox-kde/waterfox.desktop"
        waterfox-install-dir.patch
        waterfoxproject-kde-56.2.0.patch
        "firefox-kde-$_patchrev.patch::$_patchurl/firefox-kde.patch"
        fix_waterfox_browser-kde_xul.patch
        pgo_fix_missing_kdejs.patch
        "kde.js::https://raw.githubusercontent.com/hawkeye116477/Waterfox/plasma/_Plasma_Build/kde.js"
        "distribution.ini::https://raw.githubusercontent.com/hawkeye116477/waterfox-deb/master/waterfox-kde/distribution.ini"
        "waterfox.1::https://raw.githubusercontent.com/hawkeye116477/waterfox-deb/master/waterfox-kde/waterfox.1"
        jack-system-ports.patch
        "fix_crash_e10s_upload_cancel.patch::https://raw.githubusercontent.com/hawkeye116477/Waterfox/plasma/_Plasma_Build/fix_crash_e10s_upload_cancel.patch"
        no-plt.diff
        "unity-menubar-$pkgver.patch::https://bazaar.launchpad.net/~mozillateam/firefox/firefox.xenial/download/1222/unitymenubar.patch-20130215095938-1n6mqqau8tdfqwhg-1/unity-menubar.patch"
        .gitignore)
sha256sums=('SKIP'
            '6e9ec5f9c6fc5b191f9dec85b82d58eb2a51577b989bc7852e6b254d56ff13e8'
            'd86e41d87363656ee62e12543e2f5181aadcff448e406ef3218e91865ae775cd'
            '911e07ecb0095337c580c94f16b5414c243b26b1080cf0bfd2fac7f76c9a6a43'
            'f672e60e22869381e9c4cdd90353a053a0171778eca40d4664bc733822fd535f'
            '33a8e89e504067914665b7858061f34dc81057961f365024c891aa386afc28ce'
            'bf6743660623b7c9a43b94edc8acbcade07aa222ff2102a2808809df333ebe8e'
            '0850a8a8dea9003c67a8ee1fa5eb19a6599eaad9f2ad09db753b74dc5048fdbc'
            '3961c09993c442df97832866ddaea5bcc1ade1313beb313b5ceba60166933016'
            'e520e4e40a7b4c09d9da3bc0179619bc595347e23a38a5bbd578df82f8c9aa12'
            'be19426cd658ea0ff0dedbdd80da6bf84580c80d92f9b3753da107011dfdd85c'
            '73e13bf689838e4b27cdb08f040fbafb308aaf2990f5e1bf193a69a9dd736794'
            'ea8e1b871c0f1dd29cdea1b1a2e7f47bf4713e2ae7b947ec832dba7dfcc67daa'
            '5903f99dce010279e2a2f0e56d98e756c5abf9a57e27df5e2239076038868d3d'
            'e7ae75f0d1305066a5ba7b60a513d812c769beadaf890a13d1433c9f93242166')

prepare() {
  mkdir path
  ln -s /usr/bin/python2 path/python

  # Fix openSUSE's patches for Waterfox
  #sed -i 's/Firefox/Waterfox/g' $srcdir/mozilla-kde-$_patchrev.patch
  #sed -i 's/KMOZILLAHELPER/KWATERFOXHELPER/g' $srcdir/mozilla-kde-$_patchrev.patch
  #sed -i 's|/usr/lib/mozilla/kmozillahelper|/opt/waterfox/kwaterfoxhelper|g' $srcdir/mozilla-kde-$_patchrev.patch
  #sed -i 's/kmozillahelper/kwaterfoxhelper/g' $srcdir/mozilla-kde-$_patchrev.patch
  sed -i 's/firefox/waterfox/g' $srcdir/firefox-kde-$_patchrev.patch

  cd Waterfox
  patch -Np1 -i ../waterfox-install-dir.patch

  # https://bugzilla.mozilla.org/show_bug.cgi?id=1382942
  patch -Np1 -i ../no-plt.diff

  cat >.mozconfig <<END
export CC=clang
export CXX=clang++
export LDFLAGS="-Wl,-z,norelro,-O3,--sort-common,--as-needed,--relax,-z,combreloc,-z,global,--no-omagic"

ac_add_options --enable-optimize="-O3 -msse2 -mfpmath=sse -march=native -mtune=native -fcolor-diagnostics -w"
ac_add_options --target=x86_64-pc-linux-gnu

ac_add_options --enable-alsa
ac_add_options --enable-pulseaudio
ac_add_options --enable-jack

mk_add_options AUTOCLOBBER=1
mk_add_options MOZ_MAKE_FLAGS="-j6"

ac_add_options --prefix=/usr

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
ac_add_options --with-system-icu
ac_add_options --with-system-jpeg
ac_add_options --with-system-zlib
ac_add_options --with-system-bz2
ac_add_options --with-system-png
ac_add_options --with-system-libevent
ac_add_options --with-system-libvpx
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
ac_add_options --enable-stylo=build
ac_add_options --with-pthreads
ac_add_options --enable-strip
ac_add_options --enable-startup-notification
ac_add_options --enable-release
ac_add_options --enable-rust-simd # on x86 requires SSE2
ac_add_options --enable-application=browser
ac_add_options --enable-eme=widevine

export MOZ_GECKO_PROFILER=
export MOZ_ENABLE_PROFILER_SPS=
export MOZ_PROFILING=
END

  msg "Patching for KDE"
  #patch -Np1 -i "../mozilla-kde-$_patchrev.patch"
  patch -Np1 -i "../waterfoxproject-kde-56.2.0.patch"
  patch -Np1 -i "../firefox-kde-$_patchrev.patch"
  patch -Np1 -i "../fix_waterfox_browser-kde_xul.patch"
  patch -Np1 -i "../fix_crash_e10s_upload_cancel.patch"

  # Global Menu support
  patch -Np1 -i "../unity-menubar-$pkgver.patch"

  msg "Add missing file in Makefile for pgo builds"
  patch -Np1 -i "../pgo_fix_missing_kdejs.patch"

  # https://bugs.archlinux.org/task/52183
  msg "Patching for Jack"
  patch -Np1 -i ../jack-system-ports.patch

}

build() {
  cd Waterfox

  export PATH="$srcdir/path:$PATH"
  ./mach build
}

package() {
  cd Waterfox

  cp "$srcdir/kde.js" obj-$CARCH-pc-linux-gnu/dist/bin/defaults/pref

  DESTDIR="$pkgdir" ./mach install

  _vendor_js="$pkgdir/opt/waterfox/browser/defaults/preferences/vendor.js"
  install -Dm644 /dev/stdin "$_vendor_js" <<END
// Disable default browser checking
pref("browser.shell.checkDefaultBrowser", false);

// Don't disable extensions dropped in to a system
// location, or those owned by the application
pref("extensions.autoDisableScopes", 3);

// Don't display the one-off addon selection dialog when
// upgrading from a version of Waterfox older than 8.0
pref("extensions.shownSelectionUI", true);

// Use LANG environment variable to choose locale
pref("intl.locale.matchOS", true);

// Fall back to en-US search plugins if none exist for the current locale
pref("distribution.searchplugins.defaultLocale", "en-US");

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
