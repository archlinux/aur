# Maintainer: Det <nimetonmaili g-mail>
# Based on [extra]'s thunderbird: https://git.archlinux.org/svntogit/packages.git/tree/trunk?h=packages/thunderbird

pkgname=thunderbird-beta
pkgver=56.0b3
_major=${pkgver/[br]*}
_build=${pkgver/*rc}
pkgrel=1
pkgdesc="Standalone mail and news reader from mozilla.org - Bleeding edge version"
arch=(i686 x86_64)
license=(MPL GPL LGPL)
url="https://www.mozilla.org/thunderbird/"
depends=(gtk2 mozilla-common libxt startup-notification mime-types dbus-glib alsa-lib
         libvpx libevent nss hunspell sqlite ttf-font icu)
makedepends=(unzip zip diffutils python2 yasm mesa imake gconf libpulse inetutils
             autoconf2.13)
optdepends=('libcanberra: for sound support')
options=(!emptydirs !makeflags)
install=$pkgname.install
source=(https://ftp.mozilla.org/pub/mozilla.org/thunderbird/releases/$pkgver/source/thunderbird-$pkgver.source.tar.xz
        thunderbird-beta.desktop
        thunderbird-install-dir.patch
        fix-wifi-scanner.diff
        firefox-gcc-6.0.patch)
sha512sums=('566b82510cd83d49441a2c4506add99d2496e160e28c853f809f68fe9d4be491c23cbe838104399c8bd8699201b23eb30a73f84df0d6c074282695518e76f1ed'
            'e5649ddee3ca9cfdcf56652e9c8e6160d52c69d1439f9135b0c0d436ce61a25f17758afc0dd6cac3434c26234c584828eb07fdf9604797f7dd3f617ec194b79a'
            '8100fd3ea37d998905498d41c8504bfdd6d86766542d6b93107c92382a7525da7f75a83f8ff1e15ad95039d51da2add7e6b18af76d45516a41cdfd1e9f98f262'
            '1bd2804bea1fe8c85b602f8c5f8777f4ba470c9e767ad284cb3d0287c6d6e1b126e760738d7c671f38933ee3ec6b8931186df8e978995b5109797ae86dfdd85a'
            '1bb8887cfc12457a83045db559bbd13954a177100309b4f6c82a5f733675e83751bfecf501f505345f81fd2688fc5b02e113962cf0a0df27b29790f40cb9406b')
# RC
if [[ $_build = ? ]]; then
  source[0]="https://ftp.mozilla.org/pub/thunderbird/candidates/$_major-candidates/build$_build/source/thunderbird-$_major.source.tar.xz"
fi

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

  cd thunderbird-$pkgver

  msg2 "thunderbird-install-dir.patch"
  patch -Np1 -i ../thunderbird-install-dir.patch

  # https://bugzilla.mozilla.org/show_bug.cgi?id=1314968
  msg2 "fix-wifi-scanner.diff"
  patch -d mozilla -Np1 < ../fix-wifi-scanner.diff

  # Required for GCC 6
  msg2 "firefox-gcc-6.0.patch"
  patch -d mozilla -Np1 < ../firefox-gcc-6.0.patch

  # API keys
  echo -n "$_google_api_key" > google-api-key
  echo -n "$_mozilla_api_key" > mozilla-api-key

  # mozconfig
  cat > .mozconfig <<END
ac_add_options --enable-application=mail

ac_add_options --prefix=/usr
ac_add_options --libdir=/opt/
ac_add_options --enable-release
ac_add_options --enable-gold
ac_add_options --enable-pie

# Branding
ac_add_options --enable-official-branding

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
ac_add_options --disable-crashreporter
ac_add_options --disable-updater
ac_add_options --disable-tests ###
ac_add_options --disable-debug-symbols ###

STRIP_FLAGS="--strip-debug"
END
}

build() {
  cd thunderbird-$pkgver

  # _FORTIFY_SOURCE causes configure failures
  CPPFLAGS+=" -O2"

  # Hardening
  LDFLAGS+=" -Wl,-z,now"

  # GCC 6
  CXXFLAGS+=" -fno-delete-null-pointer-checks -fno-lifetime-dse -fno-schedule-insns2"

  # Export build path
  export PATH="$srcdir/path:$PATH"

  # Build
  msg2 "Running make -f client.mk build.."
  make -f client.mk build
}

package() {
  cd thunderbird-$pkgver

  # Install
  msg2 "Running make -f client.mk install.."
  make -f client.mk DESTDIR="$pkgdir" INSTALL_SDK= install

  # vendor.js
  _vendorjs="$pkgdir/opt/thunderbird-beta/defaults/preferences/vendor.js"
  install -Dm644 /dev/stdin "$_vendorjs" <<END
// Use LANG environment variable to choose locale
pref("intl.locale.matchOS", true);

// Disable default mailer checking.
pref("mail.shell.checkDefaultMail", false);

// Don't disable our bundled extensions in the application directory
pref("extensions.autoDisableScopes", 11);
pref("extensions.shownSelectionUI", true);
END

  # Icons
  for i in 16 22 24 32 48 256; do
    install -Dm644 other-licenses/branding/thunderbird/mailicon$i.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/thunderbird-beta.png"
  done

  # Desktop
  install -Dm644 ../thunderbird-beta.desktop \
    "$pkgdir/usr/share/applications/thunderbird-beta.desktop"

  # Use system-provided dictionaries
  rm -r "$pkgdir"/opt/thunderbird-beta/dictionaries
  ln -Ts /usr/share/hunspell "$pkgdir/opt/thunderbird-beta/dictionaries"
  ln -Ts /usr/share/hyphen "$pkgdir/opt/thunderbird-beta/hyphenation"

  # Install a wrapper to avoid confusion about binary path
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/thunderbird-beta" <<END
#!/bin/sh
exec /opt/thunderbird-beta/thunderbird "\$@"
END

  # Replace duplicate binary with wrapper
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -srf "$pkgdir/usr/bin/thunderbird-beta" \
    "$pkgdir/opt/thunderbird-beta/thunderbird-bin"
}