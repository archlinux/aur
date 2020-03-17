# $Id$
# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>

pkgname=firefox-beta
_pkgname=firefox
name=firefox-beta
pkgver=75.0b4
_pkgver=75.0
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org - Beta"
arch=(i686 x86_64)
license=(MPL GPL LGPL)
url="https://www.mozilla.org/en-US/firefox/channel/#beta"
depends=(gtk3 mozilla-common libxt startup-notification mime-types dbus-glib
         ffmpeg nss ttf-font libpulse)
makedepends=(unzip zip diffutils python2-setuptools yasm mesa imake inetutils
             xorg-server-xvfb autoconf2.13 rust clang llvm jack gtk2
             python nodejs python2-psutil cbindgen nasm xorgproto)
optdepends=('networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'pulseaudio: Audio support'
            'speech-dispatcher: Text-to-Speech'
            'hunspell-en_US: Spell checking, American English')
provides=("firefox=$pkgver")
conflicts=('firefox-beta-bin')
options=(!emptydirs !makeflags !strip)
source=("http://ftp.mozilla.org/pub/firefox/releases/$pkgver/source/$_pkgname-$pkgver.source.tar.xz"
		"$_pkgname.sh"
        "$pkgname.desktop"
        "$_pkgname-symbolic.svg")
sha256sums=('5337a1481b4d45c16db618777c91a73893bf0bacdc04ff1b581c7f6ed690f2d4'
            '367100e5f66523a90c3792e2e0d0e2fe8a3c28748b905ce9f5f6b121343d7842'
            'd6b4c91a7fe77f9a335b44b943e120ce44511e46bbb16ae305cc82b4c3db66cd'
            'a2474b32b9b2d7e0fb53a4c89715507ad1c194bef77713d798fa39d507def9e9')

prepare() {
  mkdir mozbuild
  cd firefox-$_pkgver

  cat >.mozconfig <<END
ac_add_options --enable-application=browser

ac_add_options --prefix=/usr
ac_add_options --enable-release
ac_add_options --enable-hardening
ac_add_options --enable-optimize
ac_add_options --enable-rust-simd

export CC=clang
export CXX=clang++
export AR=llvm-ar
export NM=llvm-nm
export RANLIB=llvm-ranlib

# Branding
ac_add_options --with-branding=browser/branding/aurora
#ac_add_options --enable-update-channel=beta
ac_add_options --with-distribution-id=org.archlinux
export MOZILLA_OFFICIAL=1
#export MOZ_TELEMETRY_REPORTING=0
export MOZ_ADDON_SIGNING=1
export MOZ_REQUIRE_SIGNING=0

# System libraries
ac_add_options --with-system-nspr
ac_add_options --with-system-nss

# Features
ac_add_options --enable-alsa
ac_add_options --enable-jack
ac_add_options --enable-startup-notification
ac_add_options --enable-crashreporter
ac_add_options --disable-gconf
ac_add_options --disable-updater
ac_add_options --disable-tests

END
}

build() {
  cd firefox-$_pkgver

  export MOZ_NOSPAM=1
  export MOZBUILD_STATE_PATH="$srcdir/mozbuild"

  ./mach configure
  ./mach build

}

package() {
  cd firefox-$_pkgver
  DESTDIR="$pkgdir" ./mach install

  _vendorjs="$pkgdir/usr/lib/$pkgname/browser/defaults/preferences/vendor.js"
  install -Dm644 /dev/stdin "$_vendorjs" <<END
// Use LANG environment variable to choose locale
pref("intl.locale.requested", "");

// Use system-provided dictionaries
pref("spellchecker.dictionary_path", "/usr/share/hunspell");

// Disable default browser checking.
pref("browser.shell.checkDefaultBrowser", false);

// Don't disable our bundled extensions in the application directory
pref("extensions.autoDisableScopes", 11);
pref("extensions.shownSelectionUI", true);
END

  _distini="$pkgdir/usr/lib/$pkgname/distribution/distribution.ini"
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

  for i in 16 22 24 32 48 64 128 256; do
    install -Dm644 browser/branding/official/default$i.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$pkgname.png"
  done
  install -Dm644 browser/branding/official/content/about-logo.png \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/$pkgname.png"
  install -Dm644 browser/branding/official/content/about-logo@2x.png \
    "$pkgdir/usr/share/icons/hicolor/384x384/apps/$pkgname.png"
  install -Dm644 ../firefox-symbolic.svg \
    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/$pkgname-symbolic.svg"

  install -Dm644 ../$pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  # Install a wrapper to avoid confusion about binary path
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" <<END
#!/bin/sh
exec /usr/lib/$pkgname/firefox "\$@"
END

  # Replace duplicate binary with wrapper
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -srf "$pkgdir/usr/bin/$pkgname" \
    "$pkgdir/usr/lib/$pkgname/firefox-bin"
}

