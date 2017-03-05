# Maintainer: Det <nimetonmaili g-mail>
# Based on [extra]'s thunderbird

pkgname=thunderbird-hg
pkgver=54.0a1.r21260.cbc772c7b1b4
pkgrel=1
pkgdesc="Standalone mail and news reader from mozilla.org - Mercurial version"
arch=(i686 x86_64)
license=(MPL GPL LGPL)
url="https://www.mozilla.org/thunderbird/"
depends=(gtk2 mozilla-common libxt startup-notification mime-types dbus-glib alsa-lib
         libvpx libevent 'nss>=3.30' hunspell sqlite ttf-font icu gtk3 gst-libav
         gst-plugins-base-libs gst-plugins-good networkmanager)
makedepends=(unzip zip diffutils python2 yasm mesa imake gconf libpulse inetutils
             mercurial rustup python2-appdirs python2-packaging python2-pyparsing
             python2-six autoconf2.13 python2-setuptools gst-libav xorg-server-xvfb
             uuid)
optdepends=('libcanberra: for sound support')
options=(!emptydirs !makeflags)
install=$pkgname.install
options=('!emptydirs' '!makeflags')
source=(hg+http://hg.mozilla.org/comm-central
        thunderbird-hg.desktop)
sha256sums=('SKIP'
            'e4613036e6073ddc508eeb6386ae4cb2170304ff0bb0dafbbdccf1953b6a3b7c')
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
  cd $_hgrepo

  # Sync local copy
  msg2 "Syncing local copy..."
  python2 client.py checkout

  # 
  mkdir -p path
  ln -sf /usr/bin/python2 path/python

  
  echo -n "$_google_api_key" > google-api-key
  echo -n "$_mozilla_api_key" > mozilla-api-key

  # mozconfig
  cat >.mozconfig <<END
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

  # GCC 6
  CXXFLAGS+=" -fno-delete-null-pointer-checks -fno-lifetime-dse -fno-schedule-insns2"

  # Export build path
  export PATH="$srcdir/path:$PATH"

  # Set up Rust
  if [[ $(rustup show) =~ "no active toolchain" ]]; then
    msg2 "Setting default Rust Toolchain (stable)"
    rustup default stable
  fi
  
  # Build
  msg2 "Running make client.mk.."
  # make -f client.mk profiledbuild
  make -f client.mk build

#   msg2 "Running mach bootstrap.."
#   mozilla/mach bootstrap
# 
#   msg2 "Running mach build.."
#   mozilla/mach build
  #obj-.../dist/bin/thunderbird
}

package() {
  # cd $_hgrepo/obj-*

  # # Put together
  # msg2 "Running make package.."
  # make package

  # # Install
  # msg2 "Moving stuff in place..."
  # cd dist
  # tar -xf thunderbird-*.tar.bz2
  # cp -r thunderbird/ "$pkgdir"/opt/$pkgname-r$pkgver/
  
  # # /usr/bin symlink
  # ln -sf /opt/$pkgname-r$pkgver/thunderbird "$pkgdir"/usr/bin/$pkgname
  
  cd $_hgrepo
  make -f client.mk DESTDIR="$pkgdir" INSTALL_SDK= install
  mv "$pkgdir"/opt/thunderbird/ "$pkgdir"/opt/thunderbird-hg/

  _vendorjs="$pkgdir/opt/thunderbird-hg/defaults/preferences/vendor.js"
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
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/thunderbird-hg.png"
  done

  install -Dm644 ../thunderbird-hg.desktop \
    "$pkgdir/usr/share/applications/thunderbird-hg.desktop"

  # Use system-provided dictionaries
  rm -r "$pkgdir"/opt/thunderbird-hg/dictionaries
  ln -Ts /usr/share/hunspell "$pkgdir/opt/thunderbird-hg/dictionaries"
  ln -Ts /usr/share/hyphen "$pkgdir/opt/thunderbird-hg/hyphenation"

  # Install a wrapper to avoid confusion about binary path
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/thunderbird-hg" <<END
#!/bin/sh
exec /opt/thunderbird-hg/thunderbird "\$@"
END

  # Replace duplicate binary with wrapper
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -srf "$pkgdir/usr/bin/thunderbird-hg" \
    "$pkgdir/opt/thunderbird-hg/thunderbird-bin"
}
