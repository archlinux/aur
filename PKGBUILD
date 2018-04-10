# Maintainer: hawkeye116477 <hawkeye116477 at gmail dot com>
# Contributor: meatatt <meatatt at aliyun dot com>
# Based on firefox-kde Manjaro's PKGBUILD

pkgname=waterfox-kde
pkgver=56.1.0
pkgrel=1
pkgdesc="Free, open and private browser with openSUSE's patches for better integration with KDE"
arch=('x86_64')
license=('MPL')
url="https://www.waterfoxproject.org/"
depends=('gtk3' 'gtk2' 'mozilla-common' 'libxt' 'startup-notification' 'mime-types' 'dbus-glib' 'ffmpeg'
         'nss>=3.32.1' 'hunspell' 'sqlite' 'ttf-font' 'icu' 'kwaterfoxhelper' 'nspr>=4.15' 'hicolor-icon-theme' 'jemalloc')
makedepends=('unzip' 'zip' 'diffutils' 'python2' 'yasm' 'mesa' 'imake' 'gconf' 'inetutils' 'xorg-server-xvfb'
             'autoconf2.13' 'rust' 'clang' 'llvm' 'ccache')
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
_commit=d27e63b27954615324864f3f9f7088a84ad60ebd
source=("git+https://github.com/MrAlex94/Waterfox.git#tag=$pkgver"
        "waterfox.desktop::https://raw.githubusercontent.com/hawkeye116477/waterfox-deb/master/BUILD/waterfox-kde/debian/waterfox.desktop"
        waterfox-install-dir.patch 
        no-crmf.diff
        wifi-fix-interface.patch
        "mozilla-kde-$_patchrev.patch::$_patchurl/mozilla-kde.patch"
        "firefox-kde-$_patchrev.patch::$_patchurl/firefox-kde.patch"
        "fix_waterfox_browser-kde_xul.patch::https://raw.githubusercontent.com/hawkeye116477/Waterfox/plasma/_Plasma_Build/fix_waterfox_browser-kde_xul.patch"
        pgo_fix_missing_kdejs.patch
        "kde.js::https://raw.githubusercontent.com/hawkeye116477/Waterfox/plasma/_Plasma_Build/kde.js"
        "distribution.ini::https://raw.githubusercontent.com/hawkeye116477/waterfox-deb/master/BUILD/waterfox-kde/debian/distribution.ini"
        "waterfox.1::https://raw.githubusercontent.com/hawkeye116477/waterfox-deb/master/BUILD/waterfox-kde/debian/waterfox.1"
        jack-system-ports.patch
        "fix_crash_e10s_upload_cancel.patch::https://raw.githubusercontent.com/hawkeye116477/Waterfox/plasma/_Plasma_Build/fix_crash_e10s_upload_cancel.patch"
        wifi-disentangle.patch
        0001-Bug-1384062-Make-SystemResourceMonitor.stop-more-res.patch
        "mozilla-ucontext-$_patchrev.patch::$_patchurl/mozilla-ucontext.patch"
        no-plt.diff
        "unity-menubar-$pkgver.patch::https://bazaar.launchpad.net/~mozillateam/firefox/firefox.xenial/download/1222/unitymenubar.patch-20130215095938-1n6mqqau8tdfqwhg-1/unity-menubar.patch"
        new_rust.patch)
sha256sums=('SKIP'
            '2a17f68e86c2c871a1ff32f0a012c7ad20ac542b935044e5ffd9716874641f4d'
            'd86e41d87363656ee62e12543e2f5181aadcff448e406ef3218e91865ae775cd'
            'fb85a538044c15471c12cf561d6aa74570f8de7b054a7063ef88ee1bdfc1ccbb'
            'e98a3453d803cc7ddcb81a7dc83f883230dd8591bdf936fc5a868428979ed1f1'
            'c4c0a726115eca89ab82a85b364cef6cc897f58317b2890f214510810a30cfa3'
            'f672e60e22869381e9c4cdd90353a053a0171778eca40d4664bc733822fd535f'
            '774d13c0d319b83a3f90d15ceed093e80ff07a2794038c95ffa79539ca2819cc'
            'bf6743660623b7c9a43b94edc8acbcade07aa222ff2102a2808809df333ebe8e'
            '0850a8a8dea9003c67a8ee1fa5eb19a6599eaad9f2ad09db753b74dc5048fdbc'
            'e144a6fac4466acdba86194b43fb41c185c38e296d6262f26c3bff3d2b6db3be'
            '03a25b7bde971ecfa35326b3c6e45450da325babed29d9cc2e10dd639f816ef6'
            'be19426cd658ea0ff0dedbdd80da6bf84580c80d92f9b3753da107011dfdd85c'
            '73e13bf689838e4b27cdb08f040fbafb308aaf2990f5e1bf193a69a9dd736794'
            'f068b84ad31556095145d8fefc012dd3d1458948533ed3fff6cbc7250b6e73ed'
            'aba767995ffb1a55345e30aaba667f43d469e23bd9b1b68263cf71b8118acc96'
            '96d9accb74e19f640e356572b3c0914c6be867cbdf351392b0cb5c00161ee012'
            'ea8e1b871c0f1dd29cdea1b1a2e7f47bf4713e2ae7b947ec832dba7dfcc67daa'
            '5903f99dce010279e2a2f0e56d98e756c5abf9a57e27df5e2239076038868d3d'
            '09797b4da7e90a84c61e6f3e5f18d425d060a964607e198a91c3f0b0d9a7a8ca')

prepare() {
  mkdir path
  ln -s /usr/bin/python2 path/python
  
  # Fix openSUSE's patches for Waterfox
  sed -i 's/Firefox/Waterfox/g' $srcdir/mozilla-kde-$_patchrev.patch
  sed -i 's/KMOZILLAHELPER/KWATERFOXHELPER/g' $srcdir/mozilla-kde-$_patchrev.patch
  sed -i 's|/usr/lib/mozilla/kmozillahelper|/opt/waterfox/kwaterfoxhelper|g' $srcdir/mozilla-kde-$_patchrev.patch
  sed -i 's/kmozillahelper/kwaterfoxhelper/g' $srcdir/mozilla-kde-$_patchrev.patch
  sed -i 's/firefox/waterfox/g' $srcdir/firefox-kde-$_patchrev.patch
  
  cd Waterfox
  patch -Np1 -i ../waterfox-install-dir.patch

  # https://bugzilla.mozilla.org/show_bug.cgi?id=1371991
  patch -Np1 -i ../no-crmf.diff

  # https://bugzilla.mozilla.org/show_bug.cgi?id=1385667
  # https://bugzilla.mozilla.org/show_bug.cgi?id=1394149
  patch -Np1 -i ../mozilla-ucontext-$_patchrev.patch
  
  # https://bugzilla.mozilla.org/show_bug.cgi?id=1314968
  patch -Np1 -i ../wifi-disentangle.patch
  patch -Np1 -i ../wifi-fix-interface.patch
  
  # https://bugzilla.mozilla.org/show_bug.cgi?id=1384062
  patch -Np1 -i ../0001-Bug-1384062-Make-SystemResourceMonitor.stop-more-res.patch
  
  # https://bugzilla.mozilla.org/show_bug.cgi?id=1382942
  patch -Np1 -i ../no-plt.diff
  
  cat >.mozconfig <<END
export CC=clang
export CXX=clang++
export LDFLAGS="-Wl,-z,norelro,-O3,--sort-common,--as-needed,--relax,-z,combreloc,-z,global,--no-omagic"

ac_add_options --enable-optimize="-O3 -msse2 -mfpmath=sse -march=native -mtune=native -fcolor-diagnostics -w"
ac_add_options --target=x86_64-pc-linux-gnu
ac_add_options --with-ccache=ccache

ac_add_options --enable-alsa
ac_add_options --enable-pulseaudio
ac_add_options --enable-jack

mk_add_options AUTOCLOBBER=1
mk_add_options MOZ_MAKE_FLAGS="-j6"

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

END

  msg "Patching for KDE"
  patch -Np1 -i "../mozilla-kde-$_patchrev.patch"
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
  
  msg "Patching for new Rust"
  patch -Np1 -i ../new_rust.patch
  
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
