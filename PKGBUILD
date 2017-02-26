# Maintainer: Det <nimetonmaili g-mail>
# Based on [extra]'s thunderbird

# NOTE: Enable PGO on x86_64?: http://en.wikipedia.org/wiki/Profile-guided_optimization
_pgo=0  # "1" to enable

pkgname=thunderbird-beta-gtk3
pkgver=52.0b3
_major=${pkgver/rc*}
_build=${pkgver/*rc}
pkgrel=1
pkgdesc="Standalone Mail/News reader - Bleeding edge version with optional PGO"
arch=('i686' 'x86_64')
url="https://www.mozilla.org/thunderbird"
license=('GPL' 'LGPL' 'MPL')
depends=('gtk2' 'mozilla-common' 'libxt' 'startup-notification' 'mime-types'
         'dbus-glib' 'alsa-lib' 'libvpx' 'libevent' 'nss' 'hunspell'
         'sqlite' 'ttf-font' 'icu')
makedepends=('unzip' 'zip' 'diffutils' 'python2' 'yasm' 'mesa' 'gconf'
             'libpulse' 'inetutils')
optdepends=('libcanberra: for sound support')
[[ $_pgo = 1 ]] && makedepends+=('imake' 'xorg-server-xvfb')
provides=("thunderbird=$pkgver")
install=$pkgname.install
options=('!emptydirs' '!makeflags')
source=("https://ftp.mozilla.org/pub/thunderbird/releases/$pkgver/source/thunderbird-$pkgver.source.tar.xz"
        "$pkgname.desktop"
        "$pkgname-safe.desktop")
sha512sums=('f0c81e769c9de7d61d5f5a0e4cc7cf2187ac82a98defc8213a737afeb607996399a9da94caff89b73df60deaaebe8d62ea88736376c21eeacfa7b735354504fb'
            'fc83c23f67cc5d399bc655d2486936db3ab500bafe399a905a17a0b0f63ad9befb782fc9c07d467a65a80a00e3ce984700ec3cf60e4cb3e1b29b20954c6fa775'
            '3cf4194575041bbe344d6cd17e473eb78caf7e2e1aa8b1309151f7e4677c33571014ba6d7aba267398c3ba69c825c64363272b82b15f7dbb8ae5e3e825f439b7')
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

 echo -n "$_google_api_key" >google-api-key
  echo -n "$_mozilla_api_key" >mozilla-api-key
  # PGO?
  if [[ $CARCH = x86_64 ]] && [[ $_pgo = 1 ]]; then
     cat >.mozconfig <<END
mk_add_options MOZ_CO_PROJECT=mail
ac_add_options --enable-application=mail
ac_add_options --enable-gold
ac_add_options --enable-pie
ac_add_options --prefix=/usr
ac_add_options --libdir=/usr/lib

# Keys
ac_add_options --with-google-api-keyfile=${PWD@Q}/google-api-key
ac_add_options --with-mozilla-api-keyfile=${PWD@Q}/mozilla-api-key

# System libraries
ac_add_options --with-system-nspr
ac_add_options --with-system-nss
ac_add_options --with-system-jpeg
ac_add_options --with-system-zlib
ac_add_options --with-system-bz2
ac_add_options --with-system-png
ac_add_options --with-system-icu
ac_add_options --with-system-libevent
ac_add_options --with-system-libvpx
ac_add_options --enable-system-hunspell
ac_add_options --enable-system-sqlite
ac_add_options --enable-system-ffi
ac_add_options --enable-default-toolkit=cairo-gtk3
ac_add_options --enable-system-pixman
ac_add_options --with-pthreads

# Features
ac_add_options --enable-official-branding
ac_add_options --enable-safe-browsing
ac_add_options --enable-startup-notification
ac_add_options --disable-gstreamer
ac_add_options --disable-crashreporter
ac_add_options --disable-updater
ac_add_options --disable-tests
ac_add_options --disable-mochitest
ac_add_options --disable-installer
ac_add_options --disable-debug-symbols

# Optimization
ac_add_options --enable-optimize

export MOZILLA_OFFICIAL=1
mk_add_options MOZILLA_OFFICIAL=1

# PGO
mk_add_options PROFILE_GEN_SCRIPT='EXTRA_TEST_ARGS=10 $(MAKE) -C $(MOZ_OBJDIR) pgo-profile-run'

STRIP_FLAGS="--strip-debug"
END
  else
      cat >.mozconfig <<END
ac_add_options --enable-application=mail

ac_add_options --prefix=/usr
ac_add_options --libdir=/usr/lib
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
ac_add_options --with-pthreads

# Features
ac_add_options --enable-default-toolkit=cairo-gtk3
ac_add_options --enable-startup-notification
ac_add_options --disable-crashreporter
ac_add_options --disable-updater
ac_add_options --enable-calendar
STRIP_FLAGS="--strip-debug"
END
  fi

}

build() {
  cd thunderbird-$pkgver
    export PYTHON="/usr/bin/python2"
  # Build flags
   # _FORTIFY_SOURCE causes configure failures
  CPPFLAGS+=" -O2"

  # Hardening
  LDFLAGS+=" -Wl,-z,now"

  # GCC 6
  CXXFLAGS+=" -fno-delete-null-pointer-checks -fno-lifetime-dse -fno-schedule-insns2"
  cp ../.mozconfig .
  if [[ $CARCH = x86_64 ]] && [[ $_pgo = 1 ]]; then
    # Set up PGO
    msg2 "Running Xvfb.."
    export DISPLAY=:99
    Xvfb -nolisten tcp -extension GLX -screen 0 1280x1024x24 $DISPLAY &

    # Build
    msg2 "Running make.."
    if ! make -f client.mk build MOZ_PGO=1; then
      kill $!
      return 1
    fi

    # Kill leftovers
    kill $! || true
  else
    msg2 "Running make.."
    make -f client.mk build 
  fi
}

package() {
  cd thunderbird-$pkgver
  make -f client.mk DESTDIR="$pkgdir" INSTALL_SDK= install
  _vendorjs="$pkgdir/usr/lib/thunderbird-52.0/defaults/preferences/vendor.js"
  install -Dm644 /dev/stdin "$_vendorjs" <<END
// Use LANG environment variable to choose locale
pref("intl.locale.matchOS", true);

// Disable default mailer checking.
pref("mail.shell.checkDefaultMail", false);

// Don't disable our bundled extensions in the application directory
pref("extensions.autoDisableScopes", 11);
pref("extensions.shownSelectionUI", true);
END

  for i in 16 22 24 32 48 256; do
    install -Dm644 other-licenses/branding/thunderbird/mailicon$i.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/thunderbird.png"
  done

  install -Dm644 ../thunderbird-beta.desktop \
    "$pkgdir/usr/share/applications/thunderbird-beta.desktop"
  install -Dm644 ../thunderbird-beta-safe.desktop \
    "$pkgdir/usr/share/applications/thunderbird-beta-safe.desktop"
  # Use system-provided dictionaries
  rm -r "$pkgdir"/usr/lib/thunderbird-52.0/dictionaries
  ln -Ts /usr/share/hunspell "$pkgdir/usr/lib/thunderbird-52.0/dictionaries"
  ln -Ts /usr/share/hyphen "$pkgdir/usr/lib/thunderbird-52.0/hyphenation"

  # Install a wrapper to avoid confusion about binary path
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/thunderbird-beta" <<END
#!/bin/sh
exec /usr/lib/thunderbird-52.0/thunderbird "\$@"
END

  # Replace duplicate binary with wrapper
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -srf "$pkgdir/usr/bin/thunderbird-beta" \
    "$pkgdir/usr/lib/thunderbird-52.0/thunderbird-bin"
}
