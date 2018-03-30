# $Id$
# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>

pkgname=firefox-eme-free
name=firefox
pkgver=59.0.2
pkgrel=2
pkgdesc="Deblobbed and EME free Firefox"
arch=(i686 x86_64)
license=(MPL GPL LGPL)
meme=FIREFOX_59_0_2_RELEASE
meme2=FIREFOX_BETA_59_END
url="https://www.mozilla.org/firefox/"
depends=(gtk3 gtk2 mozilla-common libxt startup-notification mime-types dbus-glib ffmpeg
         nss hunspell sqlite ttf-font libpulse)
makedepends=(unzip zip diffutils python2 yasm mesa imake gconf inetutils xorg-server-xvfb
             autoconf2.13 rust mercurial clang llvm jack)
optdepends=('networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'pulseaudio: Audio support'
            'speech-dispatcher: Text-to-Speech')
options=(!emptydirs !makeflags !strip)
_repo=https://hg.mozilla.org/mozilla-unified
source=("https://hg.mozilla.org/mozilla-unified/archive/$meme.tar.gz"
        wifi-disentangle.patch wifi-fix-interface.patch
        0001-Bug-1384062-Make-SystemResourceMonitor.stop-more-res.patch
        no-plt.diff plugin-crash.diff glibc-2.26-fix.diff
        $name.desktop firefox-symbolic.svg firefox-install-dir.patch
https://raw.githubusercontent.com/bn0785ac/firefox-beta/master/firefox-52-disable-data-sharing-infobar.patch
https://raw.githubusercontent.com/bn0785ac/firefox-beta/master/firefox-52-disable-location.services.mozilla.com.patch
https://raw.githubusercontent.com/bn0785ac/firefox-beta/master/firefox-52-disable-reader.patch
https://raw.githubusercontent.com/bn0785ac/firefox-beta/master/firefox-52-disable-sponsored-tiles.patch
https://raw.githubusercontent.com/bn0785ac/firefox-beta/master/firefox-52-disable-telemetry.patch
https://raw.githubusercontent.com/bn0785ac/firefox-beta/master/firefox-52-prefs.patch
https://raw.githubusercontent.com/bn0785ac/thunderbeta/master/fix2.patch
https://raw.githubusercontent.com/bn0785ac/thunderbeta/master/fix.patch
)

sha256sums=('247893b5818b90e7e7eb083d09eb244cb9d377f3aa5cdb2c6572d28e3bcb4475'
            'f068b84ad31556095145d8fefc012dd3d1458948533ed3fff6cbc7250b6e73ed'
            'e98a3453d803cc7ddcb81a7dc83f883230dd8591bdf936fc5a868428979ed1f1'
            'aba767995ffb1a55345e30aaba667f43d469e23bd9b1b68263cf71b8118acc96'
            'ea8e1b871c0f1dd29cdea1b1a2e7f47bf4713e2ae7b947ec832dba7dfcc67daa'
            'a7e5d2430bb562f6367deb07417dad4368317e8e8be5d1cfa842c3356de3cfc0'
            'cd7ff441da66a287f8712e60cdc9e216c30355d521051e2eaae28a66d81915e8'
            'ada313750e6fb14558b37c764409a17c1672a351a46c73b350aa1fe4ea9220ef'
            'a2474b32b9b2d7e0fb53a4c89715507ad1c194bef77713d798fa39d507def9e9'
            'd86e41d87363656ee62e12543e2f5181aadcff448e406ef3218e91865ae775cd'
            'bdad68eafe110b9f94a0e025635e32a6ab53e2f9adcd594c8dd2e3225f6453ab'
            '8d9afa1f940a9dac689ead40a57990d1491f34a1787b2222f8f5b5e485d54103'
            '7f171b7d69866ac6d8945ab0867b2646964362c791875c6428b4c2c8e3f3fb5b'
            'a72c657784dc5804509456d9ba39ccc8d5e5998c847f49abbcfeb2a547290815'
            '24019d3d7e6b169087d4515db9d3a179239d1e4fe726f0906f6f26877c726040'
            '80d6181d11c200aca2781f69ffeafb59ea23952304d161c2812a2f5a98b273b0'
            '32d04bf9c5c76ec3803aa7e1f82ca11dc5ea3d32b86d054168f4cc1e1ef9960c'
            '7e44dc0dc836a31c6f8e3e3461aeb636de210fb5a238e58a0eb10787ca4ad958')


prepare() {
  mkdir path
  ln -s /usr/bin/python2 path/python

  cd mozilla-unified-$meme
patch -Np1 -i ../fix.patch
patch -Np1 -i ../fix2.patch
  # https://bugzilla.mozilla.org/show_bug.cgi?id=1314968
 
  # https://bugzilla.mozilla.org/show_bug.cgi?id=1384062

  # https://bugzilla.mozilla.org/show_bug.cgi?id=1382942
  patch -Np1 -i ../no-plt.diff

  # https://bugzilla.mozilla.org/show_bug.cgi?id=1400175


  # https://bugzilla.mozilla.org/show_bug.cgi?id=1385667
  # https://bugzilla.mozilla.org/show_bug.cgi?id=1394149


patch -Np1 -i ../firefox-52-disable-data-sharing-infobar.patch
patch -Np1 -i ../firefox-52-disable-location.services.mozilla.com.patch
patch -Np1 -i ../firefox-52-disable-telemetry.patch



  cat >.mozconfig <<END
ac_add_options --enable-application=browser

ac_add_options --prefix=/usr
ac_add_options --enable-release
ac_add_options --enable-gold
ac_add_options --enable-pie
ac_add_options --enable-optimize="-O2"
ac_add_options --disable-stylo

# Branding
ac_add_options --enable-official-branding
ac_add_options --enable-update-channel=release
ac_add_options --with-distribution-id=org.archlinux
export MOZILLA_OFFICIAL=1
export MOZ_TELEMETRY_REPORTING=0
export MOZ_ADDON_SIGNING=1
export MOZ_REQUIRE_SIGNING=0

# Keys
# System libraries
ac_add_options --with-system-zlib
ac_add_options --with-system-bz2
ac_add_options --enable-system-hunspell
ac_add_options --enable-system-sqlite
ac_add_options --enable-system-ffi
ac_add_options --disable-gamepad
ac_add_options --disable-necko-wifi 
ac_add_options --disable-webspeech
ac_add_options --disable-webrtc

# Features
ac_add_options --enable-alsa
ac_add_options --enable-jack
ac_add_options --enable-startup-notification
ac_add_options --enable-crashreporter
ac_add_options --disable-updater

# faster build 
ac_add_options --disable-debug
ac_add_options --disable-debug-symbols
ac_add_options --disable-tests
ac_add_options --disable-parental-controls
ac_add_options --disable-accessibility

MOZ_SOURCE_CHANGESET=0ae512558ada

# please put 1.25 times your number of threads

mk_add_options MOZ_MAKE_FLAGS="-j10"

END
}

build() {
  cd mozilla-unified-$meme

  # _FORTIFY_SOURCE causes configure failures
  CPPFLAGS+=" -O2"

  export PATH="$srcdir/path:$PATH"
  export MOZ_SOURCE_REPO="$_repo"

  # Do PGO
  #xvfb-run -a -n 95 -s "-extension GLX -screen 0 1280x1024x24" \
  #  MOZ_PGO=1 ./mach build
  ./mach build
  ./mach buildsymbols
}

package() {
  cd mozilla-unified-$meme
  cd browser/branding/official/content
msg2 'Fixing some buildbugs'
cp ../default16.png icon16.png
cp ../default32.png icon32.png
cp ../default48.png icon48.png
cp ../default64.png icon64.png
cp ../default128.png icon128.png
cp ../default128.png ../mozicon128.png

cd ../../../../

  DESTDIR="$pkgdir" ./mach install
  find . -name '*crashreporter-symbols-full.zip' -exec cp -fvt "$startdir" {} +

  _vendorjs="$pkgdir/usr/lib/$name/browser/defaults/preferences/vendor.js"
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

  _distini="$pkgdir/usr/lib/$name/distribution/distribution.ini"
  install -Dm644 /dev/stdin "$_distini" <<END
[Global]
id=archlinux
version=1.0
about=Mozilla Firefox for Arch Linux

[Preferences]
app.distributor=archlinux
app.distributor.channel=$name
app.partner.archlinux=archlinux
END

  for i in 16 22 24 32 48 256; do
    install -Dm644 browser/branding/official/default$i.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$name.png"
  done
  install -Dm644 browser/branding/official/content/icon64.png \
    "$pkgdir/usr/share/icons/hicolor/64x64/apps/$name.png"
  install -Dm644 browser/branding/official/mozicon128.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/$name.png"
  install -Dm644 browser/branding/official/content/about-logo.png \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/$name.png"
  install -Dm644 browser/branding/official/content/about-logo@2x.png \
    "$pkgdir/usr/share/icons/hicolor/384x384/apps/$name.png"
  install -Dm644 ../firefox-symbolic.svg \
    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/$name-symbolic.svg"

  install -Dm644 ../$name.desktop \
    "$pkgdir/usr/share/applications/$name.desktop"

  # Use system-provided dictionaries
  rm -r "$pkgdir"/usr/lib/$name/dictionaries
  ln -Ts /usr/share/hunspell "$pkgdir/usr/lib/$name/dictionaries"
  ln -Ts /usr/share/hyphen "$pkgdir/usr/lib/$name/hyphenation"

  # Install a wrapper to avoid confusion about binary path
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$name" <<END
#!/bin/sh
exec /usr/lib/$name/firefox "\$@"
END

  # Replace duplicate binary with wrapper
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -srf "$pkgdir/usr/bin/$name" \
    "$pkgdir/usr/lib/$name/firefox-bin"

  # Use system certificates
  ln -srf "$pkgdir/usr/lib/libnssckbi.so" \
    "$pkgdir/usr/lib/$name/libnssckbi.so"
}
