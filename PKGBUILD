# Maintainer: Det <nimetonmaili g-mail>
# Based on [extra]'s thunderbird

pkgname=thunderbird-hg
pkgver=54.0a1.r21260.cbc772c7b1b4
pkgrel=1
pkgdesc="Standalone mail and news reader from mozilla.org - Mercurial version"
arch=(i686 x86_64)
license=(MPL GPL LGPL)
url="https://www.mozilla.org/thunderbird/"
depends=(gtk3 gtk2 mozilla-common libxt startup-notification mime-types dbus-glib alsa-lib ffmpeg
         nss hunspell sqlite ttf-font icu libvpx)
makedepends=(unzip zip diffutils python2 yasm mesa imake gconf libpulse inetutils xorg-server-xvfb
             autoconf2.13 cargo mercurial)
optdepends=('libcanberra: for sound support')
options=(!emptydirs !makeflags)
install=$pkgname.install
source=(hg+http://hg.mozilla.org/comm-central
        $pkgname.desktop
        thunderbird-install-dir.patch
        no-crmf.diff
        rust-i686.patch
        fix-wifi-scanner.diff)
sha512sums=('SKIP'
            '5d17bcbda0ca96133f7241a3fb371ba2863f3e67b12d770803e0bc7bb4b3254fc9dc6f78bd8310303abf9b2c62eb1321e63610eb9328c1b9a7b73fde671bc34a'
            '8100fd3ea37d998905498d41c8504bfdd6d86766542d6b93107c92382a7525da7f75a83f8ff1e15ad95039d51da2add7e6b18af76d45516a41cdfd1e9f98f262'
            '08572139508d4fd4e2b855d294ebee3286151da80dfeae656ae29b49ce6d72185f4cfa73dfb827c1bcce6bc8c544d0cf4a00164c9059dff316351901601fb6ea'
            'b38d8a2cb1719d652d93160bfbdfa7cbeca36fbee84b217ca0f5b0b4074b6e151c582b1e0f62901c418fb68a5018f6e21d734d6775836da5b0b44593071c3351'
            '1bd2804bea1fe8c85b602f8c5f8777f4ba470c9e767ad284cb3d0287c6d6e1b126e760738d7c671f38933ee3ec6b8931186df8e978995b5109797ae86dfdd85a')
_hgrepo="comm-central"

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
  # Link Python2
  mkdir -p path
  ln -sf /usr/bin/python2 path/python

  cd $_hgrepo

  # Sync local copy
  msg2 "Syncing local copy..."
  python2 client.py checkout

  msg2 "thunderbird-install-dir.patch"
  patch -Np1 -i ../thunderbird-install-dir.patch

  msg2 "no-crmf.diff: https://bugzilla.mozilla.org/show_bug.cgi?id=1371991"
  patch -Np1 -i ../no-crmf.diff

  msg2 "fix-wifi-scanner.diff: https://bugzilla.mozilla.org/show_bug.cgi?id=1314968"
  patch -d mozilla -Np1 < ../fix-wifi-scanner.diff

  msg2 "Build with the rust targets we actually ship"
  patch -d mozilla -Np1 < ../rust-i686.patch

  # API keys
  echo -n "$_google_api_key" >google-api-key
  echo -n "$_mozilla_api_key" >mozilla-api-key

  # mozconfig
  cat > .mozconfig <<END
ac_add_options --enable-application=mail
ac_add_options --enable-calendar

ac_add_options --prefix=/opt
ac_add_options --libdir=/opt
ac_add_options --enable-release
ac_add_options --enable-gold
ac_add_options --enable-pie
ac_add_options --enable-optimize="-O2"
ac_add_options --enable-rust

# Branding
ac_add_options --enable-official-branding
ac_add_options --enable-update-channel=nightly
ac_add_options --with-distribution-id=org.archlinux

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
ac_add_options --with-system-libvpx
ac_add_options --enable-system-hunspell
ac_add_options --enable-system-sqlite
ac_add_options --enable-system-ffi
ac_add_options --enable-system-pixman

# Features
ac_add_options --enable-startup-notification
ac_add_options --disable-crashreporter
ac_add_options --enable-alsa
ac_add_options --disable-updater
ac_add_options --disable-tests ###
ac_add_options --disable-debug-symbols ###

STRIP_FLAGS="--strip-debug"
END
}

pkgver() {
  cd $_hgrepo
  
  echo $(cat mail/config/version.txt).r$(hg identify -n).$(hg identify -i)
}

build() {
  cd $_hgrepo

  # _FORTIFY_SOURCE causes configure failures
  CPPFLAGS+=" -O2"

  # Hardening
  LDFLAGS+=" -Wl,-z,now"

  # Export build path
  export PATH="$srcdir/path:$PATH"

  # Do PGO
  #xvfb-run -a -n 95 -s "-extension GLX -screen 0 1280x1024x24" \
  #  make -f client.mk build MOZ_PGO=1
  
  # Build
  msg2 "Running make -f client.mk build.."
  make -f client.mk build
}

package() {
  cd $_hgrepo
  
  # Install
  msg2 "Running make -f client.mk install.."
  make -f client.mk DESTDIR="$pkgdir" INSTALL_SDK= install

  # vendor.js
  _vendorjs="$pkgdir/opt/$pkgname/defaults/preferences/vendor.js"
  install -Dm644 /dev/stdin "$_vendorjs" <<END
// Use LANG environment variable to choose locale
pref("intl.locale.matchOS", true);

// Disable default mailer checking.
pref("mail.shell.checkDefaultMail", false);

// Don't disable our bundled extensions in the application directory
pref("extensions.autoDisableScopes", 11);
pref("extensions.shownSelectionUI", true);
END

  _distini="$pkgdir/usr/lib/$pkgname/distribution/distribution.ini"
  install -Dm644 /dev/stdin "$_distini" <<END
[Global]
id=archlinux
version=1.0
about=Mozilla Thunderbird for Arch Linux

[Preferences]
app.distributor=archlinux
app.distributor.channel=$pkgname
app.partner.archlinux=archlinux
END

  # Icons
  for i in 16 22 24 32 48 256; do
    install -Dm644 other-licenses/branding/thunderbird/mailicon$i.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$pkgname.png"
  done

  install -Dm644 ../$pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  # Use system-provided dictionaries
  rm -r "$pkgdir"/opt/$pkgname/dictionaries
  ln -Ts /usr/share/hunspell "$pkgdir/opt/$pkgname/dictionaries"
  ln -Ts /usr/share/hyphen "$pkgdir/opt/$pkgname/hyphenation"

  # Install a wrapper to avoid confusion about binary path
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" <<END
#!/bin/sh
exec /opt/$pkgname/thunderbird "\$@"
END

  # Replace duplicate binary with wrapper
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -srf "$pkgdir/usr/bin/$pkgname" \
    "$pkgdir/opt/$pkgname/thunderbird-bin"
}
