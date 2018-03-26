# $Id$
# Maintainer : Figue <ffigue@gmail.com>
# Contributor : Ionut Biru <ibiru@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>

pkgname=basilisk
pkgver=2018.03.26
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org, Extended Support Release"
arch=(x86_64)
license=(MPL GPL LGPL)
url="https://www.mozilla.org/en-US/firefox/organizations/"
depends=(gtk3 gtk2 mozilla-common libxt startup-notification mime-types dbus-glib alsa-lib ffmpeg
         libvpx libevent nss hunspell sqlite ttf-font icu)
makedepends=(unzip zip diffutils python2 yasm mesa imake gconf libpulse inetutils xorg-server-xvfb
             autoconf2.13 rust)
optdepends=('networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'speech-dispatcher: Text-to-Speech')
options=(!emptydirs !makeflags)
com=6afc1c735f8f19cd317cd0ae81da9b4348a78ada
source=("basil1::git+https://github.com/MoonchildProductions/moebius.git#commit=$com"
        https://raw.githubusercontent.com/bn0785ac/basilisk-arch/master/basilisk.desktop https://raw.githubusercontent.com/bn0785ac/basilisk-arch/master/basilisk-symbolic.svg
        https://raw.githubusercontent.com/bn0785ac/basilisk-arch/master/0001-Bug-54395-remove-hardcoded-flag-lcrmf.patch
        https://raw.githubusercontent.com/bn0785ac/basilisk-arch/master/fix-wifi-scanner.diff
        https://raw.githubusercontent.com/bn0785ac/basilisk-arch/master/glibc-2.26-fix.diff
https://raw.githubusercontent.com/bn0785ac/firefox-beta/master/firefox-52-disable-data-sharing-infobar.patch
https://raw.githubusercontent.com/bn0785ac/firefox-beta/master/firefox-52-disable-location.services.mozilla.com.patch
https://raw.githubusercontent.com/bn0785ac/firefox-beta/master/firefox-52-disable-telemetry.patch
https://raw.githubusercontent.com/bn0785ac/firefox-beta/master/firefox-install-dir.patch)

sha256sums=('SKIP'
            '1fdc855349da4e3728b202f411ad1d1c3fdc01e616161603175ab1573df1e6a9'
            'a2474b32b9b2d7e0fb53a4c89715507ad1c194bef77713d798fa39d507def9e9'
            'ebaa84b1e108390cd1042cce7eaad6a7c0053c7b2b4d0b961d4a98732b3c93ac'
            '9765bca5d63fb5525bbd0520b7ab1d27cabaed697e2fc7791400abc3fa4f13b8'
            'cd7ff441da66a287f8712e60cdc9e216c30355d521051e2eaae28a66d81915e8'
            'd2f63212766c764eec358c317db1e740c226abef57ef2b557dcf08c2588074a3'
            'a7d4a4c240772d27c35aa27d711c0eec909700073c8b9488707f60d6e4b81a5e'
            '3868723b1afc75c109426bf54a86e97a3022ac9ce0650d620842c6ff8333b1cc'
            'd86e41d87363656ee62e12543e2f5181aadcff448e406ef3218e91865ae775cd')




prepare() {
  mkdir path
  ln -s /usr/bin/python2 path/python

  cd basil1

msg2 'Edgy patches'

#patch -Np1 -i ../firefox-52-disable-data-sharing-infobar.patch
patch -Np1 -i ../firefox-52-disable-location.services.mozilla.com.patch
patch -Np1 -i ../firefox-52-disable-telemetry.patch

msg2 'Workin'


  # https://bugzilla.mozilla.org/show_bug.cgi?id=1314968
  patch -Np1 -i ../fix-wifi-scanner.diff

  # https://bugs.archlinux.org/task/54395 // https://bugzilla.mozilla.org/show_bug.cgi?id=1371991
  patch -Np1 -i ../0001-Bug-54395-remove-hardcoded-flag-lcrmf.patch

  # https://bugzilla.mozilla.org/show_bug.cgi?id=1385667
  # Build with the rust targets we actually ship




  cat >.mozconfig <<END
ac_add_options --enable-application=browser

ac_add_options --prefix=/usr
ac_add_options --enable-release
ac_add_options --enable-gold
ac_add_options --enable-pie
ac_add_options --enable-optimize="-O2"

export MOZ_TELEMETRY_REPORTING=0

ac_add_options --enable-official-branding
ac_add_options --enable-update-channel=release
ac_add_options --with-distribution-id=org.archlinux
export MOZILLA_OFFICIAL=1
export MOZ_TELEMETRY_REPORTING=1
export MOZ_ADDON_SIGNING=1
export MOZ_REQUIRE_SIGNING=0

# Features
ac_add_options --enable-startup-notification
ac_add_options --enable-crashreporter
ac_add_options --enable-alsa
ac_add_options --disable-updater

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
ac_add_options --enable-alsa
ac_add_options --disable-updater


# Imported from Waterfox
ac_add_options --disable-stylo


# If you want to have text-to-speech support, comment this line:
ac_add_options --disable-webspeech

# If you want to have geolocation support, comment this line:
ac_add_options --disable-necko-wifi 

# If you have some problems with Skype Web or other web chat, comment this line:
ac_add_options --disable-webrtc

# If you want to have gamepad support, comment this line:
ac_add_options --disable-gamepad


# please put 1.25 times your number of threads

mk_add_options MOZ_MAKE_FLAGS="-j10"

ac_add_options --disable-debug
ac_add_options --disable-debug-symbols
ac_add_options --disable-parental-controls
ac_add_options --disable-accessibility
ac_add_options --disable-tests
 

END
}

build() {
  cd basil1

  # _FORTIFY_SOURCE causes configure failures
  CPPFLAGS+=" -O2"

#  # Hardening
#  LDFLAGS+=" -Wl,-z,now"

  export PATH="$srcdir/path:$PATH"

  # Do PGO
  #xvfb-run -a -n 95 -s "-extension GLX -screen 0 1280x1024x24" \
  #  MOZ_PGO=1 ./mach build
  ./mach build
  #  ./mach buildsymbols
}

package() {
  cd basil1

msg2 'Fixing  bugs as always lol'
mkdir browser
mkdir browser/branding
cp -r application/basilisk/branding/official/ browser/branding/official


  DESTDIR="$pkgdir" ./mach install

  for i in 16 22 24 32 48 256; do
    install -Dm644 browser/branding/official/default$i.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/basilisk.png"
  done
  install -Dm644 browser/branding/official/content/icon64.png \
    "$pkgdir/usr/share/icons/hicolor/64x64/apps/basilisk.png"
  install -Dm644 browser/branding/official/mozicon128.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/basilisk.png"
  install -Dm644 browser/branding/official/content/about-logo.png \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/basilisk.png"
  install -Dm644 browser/branding/official/content/about-logo@2x.png \
    "$pkgdir/usr/share/icons/hicolor/384x384/apps/basilisk.png"
  install -Dm644 ../basilisk-symbolic.svg \
    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/basilisk-symbolic.svg"

  install -Dm644 ../basilisk.desktop \
    "$pkgdir/usr/share/applications/basilisk.desktop"

  # Use system-provided dictionaries

  ln -srf "$pkgdir/usr/bin/basilisk" \
    "$pkgdir/usr/lib/basilisk-$pkgver/basilisk-bin"

}
