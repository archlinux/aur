# Maintainer: hawkeye116477 <hawkeye116477 at gmail dot com>
# Contributor: meatatt <meatatt at aliyun dot com>

pkgname=waterfox-classic-kpe
pkgver=2019.12
pkgrel=0
pkgdesc="Free, open and private browser with openSUSE's patches for better integration with KDE"
arch=('x86_64')
license=('MPL')
url="https://www.waterfox.net/"
depends=('gtk3' 'gtk2' 'libxt' 'startup-notification' 'mime-types' 'dbus-glib' 'ffmpeg'
         'nss>=3.34' 'hunspell' 'sqlite' 'ttf-font' 'icu' 'kwaterfoxhelper' 'nspr>=4.15' 'hicolor-icon-theme' 'jemalloc' 'libevent')
makedepends=('unzip' 'zip' 'diffutils' 'python2' 'yasm' 'mesa' 'imake' 'gconf' 'inetutils' 'xorg-server-xvfb'
             'autoconf2.13' 'rust' 'clang' 'llvm' 'git')
optdepends=('networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'pulseaudio: Audio support'
            'alsa-lib: Audio support'
            'jack: Audio support'
            'speech-dispatcher: Text-to-Speech')
provides=("waterfox-classic=${pkgver}" "waterfox-classic-kde=${pkgver}")
conflicts=('waterfox-classic' 'waterfox-kde')
replaces=('waterfox-kde')
options=('!emptydirs' '!makeflags' 'zipman')
_patchrev=7339b115a221
_patchurl=http://www.rosenauer.org/hg/mozilla/raw-file/$_patchrev
_commit=8864e433baf07e995e7047e840d8f94d8f1b2496
source=("git+https://github.com/MrAlex94/Waterfox.git#commit=$_commit"
        "waterfox-classic.desktop::https://raw.githubusercontent.com/hawkeye116477/waterfox-deb/master/waterfox-classic-kpe/waterfox-classic.desktop"
        "kde.js::https://raw.githubusercontent.com/hawkeye116477/waterfox-deb/master/waterfox-classic-kpe/kde.js"
        "distribution.ini::https://raw.githubusercontent.com/hawkeye116477/waterfox-deb/master/waterfox-classic-kpe/distribution.ini"
        "waterfox-classic.1::https://raw.githubusercontent.com/hawkeye116477/waterfox-deb/master/waterfox-classic-kpe/waterfox-classic.1"
        jack-system-ports.patch
        no-plt.diff
        "waterfox-classic-kde-2019.12.patch::https://raw.githubusercontent.com/hawkeye116477/waterfox-deb/master/waterfox-classic-kpe/patches/waterfox-classic-kde-2019.12.patch"
        "dont-statically-link-libstdc++.patch::https://raw.githubusercontent.com/hawkeye116477/waterfox-deb/master/waterfox-classic-kpe/patches/dont-statically-link-libstdc%2B%2B.patch"
        pgo_fix_missing_kdejs.patch)
sha256sums=('SKIP'
            'b0ec717b10494dad234a10c9ba9c2a89ed52fd0afbc3b98bb8c4f9c5dd4755a0'
            '0850a8a8dea9003c67a8ee1fa5eb19a6599eaad9f2ad09db753b74dc5048fdbc'
            'bf06887c00bbc7176f452a3d18092e1b222731218e461782b2877cba938aaa26'
            '3b3089733bde4c0f945b0da4043950717af7f3993dd0b9eb3ca769c27c194422'
            'be19426cd658ea0ff0dedbdd80da6bf84580c80d92f9b3753da107011dfdd85c'
            'ea8e1b871c0f1dd29cdea1b1a2e7f47bf4713e2ae7b947ec832dba7dfcc67daa'
            '0ec569e42cc6e6dab4bbb2d078210acf57bcbe6f16afb2dbeb5b6ff9d0809c87'
            '877bc1f0e768d96118bb739725e590467773dd897c31263099e52b8d7aaaa4c8'
            'bf6743660623b7c9a43b94edc8acbcade07aa222ff2102a2808809df333ebe8e')

prepare() {
  mkdir path
  ln -s /usr/bin/python2 path/python

  # Fix openSUSE's patches for Waterfox
  #sed -i 's/Firefox/Waterfox/g' $srcdir/mozilla-kde-$_patchrev.patch
  #sed -i 's/KMOZILLAHELPER/KWATERFOXHELPER/g' $srcdir/mozilla-kde-$_patchrev.patch
  #sed -i 's|/usr/lib/mozilla/kmozillahelper|/usr/lib/waterfox-classic/kwaterfoxhelper|g' $srcdir/mozilla-kde-$_patchrev.patch
  #sed -i 's/kmozillahelper/kwaterfoxhelper/g' $srcdir/mozilla-kde-$_patchrev.patch
  #sed -i 's/firefox/waterfox/g' $srcdir/firefox-kde-$_patchrev.patch

  cd Waterfox

  patch -Np1 -i ../dont-statically-link-libstdc++.patch

  # https://bugzilla.mozilla.org/show_bug.cgi?id=1382942
  patch -Np1 -i ../no-plt.diff


  cat >.mozconfig <<END
export CC=clang
export CXX=clang++
export LDFLAGS="-Wl,-z,norelro,-O3,--sort-common,--as-needed,--relax,-z,combreloc,-z,global,--no-omagic"

ac_add_options --enable-optimize="-O3 -msse2 -mfpmath=sse -march=native -mtune=native -fcolor-diagnostics -w"
ac_add_options --target=$CARCH-pc-linux-gnu

ac_add_options --enable-alsa
ac_add_options --enable-pulseaudio
ac_add_options --enable-jack

mk_add_options AUTOCLOBBER=1
mk_add_options MOZ_MAKE_FLAGS="-j6"

ac_add_options --prefix=/usr

ac_add_options --with-app-name=waterfox-classic
ac_add_options --with-app-basename=Waterfox
ac_add_options --with-branding=browser/branding/unofficial

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

# Stylo doesn't compile with Rust 1.38 (needs newer cssparser)
ac_add_options --disable-stylo

ac_add_options --with-pthreads
ac_add_options --enable-strip
ac_add_options --enable-startup-notification
ac_add_options --enable-release
ac_add_options --enable-rust-simd

ac_add_options --enable-application=browser
ac_add_options --enable-eme=widevine
ac_add_options --enable-av1

export MOZ_GECKO_PROFILER=
export MOZ_ENABLE_PROFILER_SPS=
export MOZ_PROFILING=
END

  echo "Patching for KDE"
  #patch -Np1 -i "../mozilla-kde-$_patchrev.patch"
  #patch -Np1 -i "../waterfoxproject-kde-56.2.0.patch"
  #patch -Np1 -i "../firefox-kde-$_patchrev.patch"
  #patch -Np1 -i "../fix_waterfox_browser-kde_xul.patch"
  #patch -Np1 -i "../fix_crash_e10s_upload_cancel.patch"
  patch -Np1 -i "../waterfox-classic-kde-2019.12.patch"
  patch -Np1 -i "../pgo_fix_missing_kdejs.patch"

  # https://bugs.archlinux.org/task/52183
  echo "Patching for Jack"
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

  _vendor_js="$pkgdir/usr/lib/waterfox-classic/browser/defaults/preferences/vendor.js"
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

// Use OS regional settings for date and time
pref("intl.regional_prefs.use_os_locales", true);
END

  install -Dm644 "$srcdir/kde.js" "$pkgdir/usr/lib/waterfox-classic/browser/defaults/preferences/kde.js"

  for i in 16 22 24 32 48 64 128 256; do
    install -Dm644 browser/branding/unofficial/default$i.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/waterfox-classic.png"
  done
  install -Dm644 browser/branding/unofficial/content/about-logo.png \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/waterfox-classic.png"
  install -Dm644 browser/branding/unofficial/content/about-logo@2x.png \
    "$pkgdir/usr/share/icons/hicolor/384x384/apps/waterfox-classic.png"

  install -Dm644 $srcdir/waterfox-classic.desktop \
    "$pkgdir/usr/share/applications/waterfox-classic.desktop"

  install -Dm644 $srcdir/waterfox-classic.1 \
    "$pkgdir/usr/share/man/man1/waterfox-classic.1"

  install -Dm644 $srcdir/distribution.ini \
    "$pkgdir/usr/lib/waterfox-classic/distribution/distribution.ini"

  # Use system-provided dictionaries
  if [ -d $pkgdir/usr/lib/waterfox-classic/dictionaries ]; then
    rm -r "$pkgdir"/usr/lib/waterfox-classic/dictionaries
  fi

  ln -Ts /usr/share/hunspell "$pkgdir/usr/lib/waterfox-classic/dictionaries"
  ln -Ts /usr/share/hyphen "$pkgdir/usr/lib/waterfox-classic/hyphenation"

  # Install a wrapper to avoid confusion about binary path
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/waterfox-classic" <<END
#!/bin/sh
exec /usr/lib/waterfox-classic/waterfox-classic "\$@"
END

  # Replace duplicate binary with wrapper
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -srf "$pkgdir/usr/bin/waterfox-classic" \
    "$pkgdir/usr/lib/waterfox-classic/waterfox-classic-bin"
}
