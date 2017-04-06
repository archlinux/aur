# Maintainer: Det <nimetonmaili g-mail>
# Based on [extra]'s thunderbird

pkgname=thunderbird-beta-gtk3
pkgver=53.0b1
_major=${pkgver/[br]*}
_pkgver=53.0
_beta=b1
_build=build3
pkgrel=4
pkgdesc="Standalone Mail/News reader - Beta version with GTK3"
arch=('i686' 'x86_64')
url="https://www.mozilla.org/thunderbird"
license=('GPL' 'LGPL' 'MPL')
depends=('gtk2' 'gtk3' 'mozilla-common' 'libxt' 'startup-notification' 'mime-types'
         'dbus-glib' 'alsa-lib' 'libvpx' 'libevent' 'nss' 'hunspell'
         'sqlite' 'ttf-font' 'icu')
makedepends=('unzip' 'zip' 'diffutils' 'python2' 'yasm' 'mesa' 'gconf'
             'libpulse' 'inetutils')
optdepends=('libcanberra: for sound support')
provides=("thunderbird=$pkgver")
conflicts=("thunderbird-beta")
install=$pkgname.install
options=('!emptydirs' '!makeflags')
#source=(https://launchpadlibrarian.net/312243637/thunderbird_${_pkgver}~${_beta}+${_build}.orig.tar.bz2
#source=("https://ftp.mozilla.org/pub/thunderbird/releases/$pkgver/source/thunderbird-$pkgver.source.tar.xz"
source=("https://ftp.mozilla.org/pub/thunderbird/candidates/${pkgver}-candidates/$_build/source/thunderbird-${pkgver}.source.tar.xz"
        fix-wifi-scanner.diff
        thunderbird-install-dir.patch
        $pkgname.desktop
        $pkgname-safe.desktop)
sha512sums=('739390c337ffe7fb8292b7122bd27e67052be6b85be4c80e3e122d4216b8b74e26ddf0ce1bf9a487e25f1b8031e6fa5d3dc172a1ee06e7a8c66f21b96dc0a7b4'
            '1bd2804bea1fe8c85b602f8c5f8777f4ba470c9e767ad284cb3d0287c6d6e1b126e760738d7c671f38933ee3ec6b8931186df8e978995b5109797ae86dfdd85a'
            '8100fd3ea37d998905498d41c8504bfdd6d86766542d6b93107c92382a7525da7f75a83f8ff1e15ad95039d51da2add7e6b18af76d45516a41cdfd1e9f98f262'
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
# Link Python2
mkdir -p path
ln -sf /usr/bin/python2 path/python

#cd thunderbird-${_pkgver}~${_beta}+${_build}
cd thunderbird-${pkgver}

msg2 "thunderbird-install-dir.patch"
  patch -Np1 -i ../thunderbird-install-dir.patch

  # https://bugzilla.mozilla.org/show_bug.cgi?id=1314968
  msg2 "fix-wifi-scanner.diff"
  patch -d mozilla -Np1 < ../fix-wifi-scanner.diff

echo -n "$_google_api_key" >google-api-key
echo -n "$_mozilla_api_key" >mozilla-api-key

#mozconfig
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
ac_add_options --enable-alsa

# Features
ac_add_options --enable-default-toolkit=cairo-gtk3
ac_add_options --enable-startup-notification
ac_add_options --disable-crashreporter
ac_add_options --disable-updater
ac_add_options --enable-calendar
ac_add_options --disable-tests ###
ac_add_options --disable-debug-symbols ###
ac_add_options --enable-rust
STRIP_FLAGS="--strip-debug"
END
}

build() {
  cd thunderbird-${pkgver}
  # Build flags
   # _FORTIFY_SOURCE causes configure failures
  CPPFLAGS+=" -O2"

  # Hardening
  LDFLAGS+=" -Wl,-z,now"
  #CFLAGS+="-std=c11"

  # Export build path
  export PATH="$srcdir/path:$PATH"
  #export PYTHON="/usr/bin/python2"

  # Build
    msg2 "Running make.."
    ./mozilla/mach clobber
    ./mozilla/mach build
}

package() {
  cd thunderbird-${pkgver}
  make -f client.mk DESTDIR="$pkgdir" INSTALL_SDK= install
  _vendorjs="$pkgdir/usr/lib/thunderbird-beta/defaults/preferences/vendor.js"
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
    install -Dm644 other-licenses/branding/thunderbird/mailicon$i.png "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/thunderbird-beta.png"
  done

  install -Dm644 ../$pkgname.desktop \
    "$pkgdir/usr/share/applications/thunderbird-beta.desktop"
  install -Dm644 ../$pkgname-safe.desktop \
    "$pkgdir/usr/share/applications/thunderbird-beta-safe.desktop"
  # Use system-provided dictionaries
  rm -r "$pkgdir"/usr/lib/thunderbird-beta/dictionaries
  ln -Ts /usr/share/hunspell "$pkgdir/usr/lib/thunderbird-beta/dictionaries"
  ln -Ts /usr/share/hyphen "$pkgdir/usr/lib/thunderbird-beta/hyphenation"

  # Install a wrapper to avoid confusion about binary path
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/thunderbird-beta" <<END
#!/bin/sh
exec /usr/lib/thunderbird-beta/thunderbird "\$@"
END

  # Replace duplicate binary with wrapper
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  rm "$pkgdir/usr/bin/thunderbird"
  ln -srf "$pkgdir/usr/bin/thunderbird-beta" \
    "$pkgdir/usr/lib/thunderbird-beta/thunderbird-bin"
}
