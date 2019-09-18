# Maintainer: alaviss <alaviss0 at gmail dot com>
# Contributor: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: artiom <a.mv at gmx dot fr>
# Contributor: ilikenwf
# Contributor: American_Jesus
pkgname=newmoon-uxp-git
_pkgname=newmoon
pkgver=28.0.0a4.r1709.518f95c2b
pkgrel=1
pkgdesc="Open source, unbranded web browser focusing on efficiency. (UXP)"
arch=('x86_64')
url="https://www.palemoon.org/"
license=('MPL' 'GPL' 'LGPL')
depends=('alsa-lib' 'dbus-glib' 'gtk2' 'hunspell' 'libvpx' 'libxt'
         'mozilla-common' 'nss' 'startup-notification')
makedepends=('autoconf2.13' 'gconf' 'git' 'libpulse' 'python2' 'unzip' 'yasm'
             'zip')
optdepends=('ffmpeg: various video and audio support'
            'gconf: set New Moon as the default browser'
            'hyphen: library for hyphenation and justification'
            'libpulse: PulseAudio audio driver'
            'mime-types: recognize MIME types')
options=('!emptydirs' '!makeflags')
source=('git+https://github.com/MoonchildProductions/UXP.git'
        'modify-install-dir.patch'
        'newmoon.desktop')
sha512sums=('SKIP'
            '266989b0c4a37254a40836a6193284a186230b48716907e4d249d73616f58382b258c41baa8c1ffc98d405f77bfafcd3438f749edcf391c7bd22185399adf4bd'
            '44cb52d6a056a090f8813bf7c1a225756497c16d7628c4265d478711d6541e0608de403ecef423acd65663b4eefdc3bdc44043ab9e12e96f6945c06496ca0b18')

_appName="palemoon"
_app="application/$_appName"

pkgver() {
  cd UXP
  printf "%s.r%s.%s" "$(cat $_app/config/version.txt)" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir path
  ln -s /usr/bin/python2 path/python

  cd UXP

  patch -Np1 -i "$srcdir/modify-install-dir.patch"

  # Rename browser so as to have separate profile from Pale Moon
  sed -i 's/Pale Moon/New Moon/' "$_app/app/application.ini"
  sed -i 's/Palemoon/Newmoon/' "$_app/confvars.sh"

  cat > .mozconfig << EOF
ac_add_options --enable-application=$_appName

ac_add_options --prefix=/usr
ac_add_options --enable-release
ac_add_options --enable-gold
ac_add_options --enable-pie
ac_add_options --enable-optimize="-O2"
ac_add_options --enable-default-toolkit=cairo-gtk2

# Branding
ac_add_options --with-distribution-id=org.archlinux

# System libraries
ac_add_options --with-system-zlib
ac_add_options --with-system-bz2
ac_add_options --with-system-icu
ac_add_options --with-system-jpeg
ac_add_options --with-system-libvpx
ac_add_options --enable-system-cairo
ac_add_options --enable-system-hunspell
ac_add_options --enable-system-sqlite
ac_add_options --enable-system-ffi

# Features
ac_add_options --enable-startup-notification
ac_add_options --enable-alsa
ac_add_options --disable-updater
EOF
}

build() {
  cd UXP

  export PATH="$srcdir/path:$PATH"
  export CPPFLAGS+=" -O2"
  make -f client.mk build
}

package() {
  cd UXP

  make -f client.mk DESTDIR="$pkgdir" INSTALL_SDK= install

  _vendorjs="$pkgdir/usr/lib/$_pkgname/browser/defaults/preferences/vendor.js"
  install -Dm644 /dev/stdin "$_vendorjs" <<END
// Use LANG environment variable to choose locale
pref("intl.locale.requested", "");

// Disable default browser checking.
pref("browser.shell.checkDefaultBrowser", false);
END

  _distini="$pkgdir/usr/lib/$_pkgname/distribution/distribution.ini"
  install -Dm644 /dev/stdin "$_distini" <<END
[Global]
id=archlinux
version=1.0
about=New Moon for Arch Linux

[Preferences]
app.distributor=archlinux
app.distributor.channel=$_pkgname
app.partner.archlinux=archlinux
END

  for i in 16 32 48; do
    install -Dm644 $_app/branding/unofficial/default$i.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$_pkgname.png"
  done

  install -Dm644 $_app/branding/unofficial/content/icon64.png \
    "$pkgdir/usr/share/icons/hicolor/64x64/apps/$_pkgname.png"
  install -Dm644 $_app/branding/unofficial/mozicon128.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/$_pkgname.png"
  install -Dm644 $_app/branding/unofficial/content/about-logo.png \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/$_pkgname.png"
  install -Dm644 $_app/branding/unofficial/content/about-logo@2x.png \
    "$pkgdir/usr/share/icons/hicolor/384x384/apps/$_pkgname.png"

  install -Dm644 "$srcdir/$_pkgname.desktop" \
    "$pkgdir/usr/share/applications/$_pkgname.desktop"

  rm -r "$pkgdir/usr/lib/$_pkgname/dictionaries"
  ln -Ts /usr/share/hunspell "$pkgdir/usr/lib/$_pkgname/dictionaries"
  ln -Ts /usr/share/hyphen "$pkgdir/usr/lib/$_pkgname/hyphenation"

  # remove duplicate binary
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  rm "$pkgdir/usr/lib/$_pkgname/$_pkgname-bin"
}
