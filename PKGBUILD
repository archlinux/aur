# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Det <nimetonmaili g-mail>
# Based on [extra]'s thunderbird: https://git.archlinux.org/svntogit/packages.git/tree/trunk?h=packages/thunderbird

pkgname=thunderbird-beta
_pkgname=thunderbird
_pkgver=75.0
pkgver=75.0b1
_major=${pkgver/[br]*}
_build=${pkgver/*rc}
pkgrel=2
pkgdesc="Standalone mail and news reader from mozilla.org - Bleeding edge version"
arch=(x86_64)
license=(MPL GPL LGPL)
url="https://www.mozilla.org/thunderbird/"
depends=(gtk3 mozilla-common libxt startup-notification mime-types dbus-glib alsa-lib
         nss hunspell sqlite ttf-font icu)
makedepends=(unzip zip diffutils python python2 yasm nasm mesa imake libpulse inetutils xorg-server-xvfb autoconf2.13 rust clang llvm gtk2 cbindgen nodejs)
optdepends=('libcanberra: sound support')
provides=("thunderbird=$pkgver")
conflicts=('thunderbird-beta-bin')
options=(!emptydirs !makeflags)
install=$pkgname.install
source=(https://ftp.mozilla.org/pub/thunderbird/releases/$pkgver/source/thunderbird-$pkgver.source.tar.xz
		'thunderbird-beta.desktop')
sha256sums=('5a594451468137b9b90dac5d9bfce192bb6603c242c2453ec19b450e3fecd7fb'
            'd7aa1bd77f74c255446eec4171e4360c7a6215dac1d29c8ee71ec1f2a03bda3d')

# RC
#if [[ $_build = ? ]]; then
#  source[0]="https://ftp.mozilla.org/pub/thunderbird/candidates/$_major-candidates/build$_build/#source/thunderbird-$_major.source.tar.xz"
#fi

prepare() {
  
cd $_pkgname-$_pkgver

  # mozconfig
  cat >.mozconfig <<END

ac_add_options --enable-application=comm/mail
ac_add_options --enable-calendar

ac_add_options --prefix=/usr
ac_add_options --enable-release
ac_add_options --enable-linker=gold
ac_add_options --enable-hardening
ac_add_options --enable-optimize
ac_add_options --disable-elf-hack

# Branding

ac_add_options --with-branding=comm/mail/branding/nightly 
#ac_add_options --enable-update-channel=nightly
ac_add_options --with-distribution-id=org.archlinux

# System libraries
ac_add_options --with-system-zlib
ac_add_options --with-system-bz2
ac_add_options --with-system-icu
ac_add_options --with-system-jpeg
ac_add_options --with-system-nspr
ac_add_options --with-system-nss
ac_add_options --enable-system-sqlite
ac_add_options --enable-system-ffi

# Features
ac_add_options --enable-alsa
ac_add_options --disable-jack
ac_add_options --enable-startup-notification
ac_add_options --disable-crashreporter
ac_add_options --disable-updater
ac_add_options --disable-gconf
END
}

build() {
  cd $_pkgname-$_pkgver
  ./mach configure
  ./mach build
}

package() {
  cd $_pkgname-$_pkgver
  DESTDIR="$pkgdir" ./mach install

  _vendorjs="$pkgdir/usr/lib/$pkgname/defaults/preferences/vendor.js"
  install -Dm644 /dev/stdin "$_vendorjs" <<END
// Use LANG environment variable to choose locale
pref("intl.locale.requested", "");

// Use system-provided dictionaries
pref("spellchecker.dictionary_path", "/usr/share/hunspell");

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

  for i in 16 22 24 32 48 64 128 256; do
    install -Dm644 comm/mail/branding/thunderbird/default${i}.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$pkgname.png"
  done
  install -Dm644 comm/mail/branding/thunderbird/TB-symbolic.svg \
    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/thunderbird-symbolic.svg"

  install -Dm644 ../$pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  # Use system-provided dictionaries
  ln -Ts /usr/share/hunspell "$pkgdir/usr/lib/$pkgname/dictionaries"
  ln -Ts /usr/share/hyphen "$pkgdir/usr/lib/$pkgname/hyphenation"

  # Install a wrapper to avoid confusion about binary path
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" <<END
#!/bin/sh
exec /usr/lib/$pkgname/thunderbird "\$@"
END

  # Replace duplicate binary with wrapper
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -srf "$pkgdir/usr/bin/$pkgname" \
    "$pkgdir/usr/lib/$pkgname/thunderbird-bin"
}

