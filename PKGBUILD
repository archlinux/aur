# Maintainer: Charadon <dev at iotib dot net>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Based on basilisk browser PKGBUILD

pkgname=serpent-browser
pkgver=2020.04.15
pkgrel=1
pkgdesc="Unbranded version of Basilisk web browser"
arch=('x86_64')
license=('MPL' 'GPL' 'LGPL')
url="https://www.basilisk-browser.org/"
conflicts=('basilisk' 'basilisk-bin')
replaces=('basilisk' 'basilisk-bin')
provides=('basilisk' 'basilisk-bin')
depends=('gtk2' 'gtk3' 'dbus-glib' 'libxt' 'mime-types' 'nss' 'alsa-lib' 'icu' 'ttf-font' 'dbus' 'libpulse')
optdepends=('hunspell: spell checker and morphological analyzer'
            'hyphen: library for hyphenation and justification'
            'ffmpeg: record, convert, and stream audio and video')
makedepends=('unzip' 'zip' 'python2' 'yasm' 'mesa' 'autoconf2.13')
options=(!emptydirs !makeflags)
_commit=20200408
source=("https://github.com/MoonchildProductions/Basilisk/archive/v$pkgver.tar.gz"
        "https://github.com/MoonchildProductions/UXP/archive/RELBASE_$_commit.tar.gz"
        "serpent-browser.desktop")
sha512sums=('bc24549f3d1c5634d3836cc58a361d2c9ff1d0d7840ace0fbf8e20810a40bf5fbab0bd4587bb261ecaf8c0ca08bb35a4887d56d7c598a6efc72c1dbb8a4987aa'
            '4739c5921eea513faa76aef3fb017a68aba2edcfb948ffe82c6ef51af006e035a1eb890aefbdb274da7b759a8d5b811ae7c565448317f273ac57d5ccb6d7ef8a'
            'c30a3b149adada481165c2f207e25144ff55791d93dd9febfc6a15dbafac907277d9e0fa63b284abdf71dd5ffeb11fca8bcdec4e859d497364fb9524921d0073')

prepare() {
  cd "$srcdir/Basilisk-$pkgver"

  mv -T "$srcdir/UXP-RELBASE_$_commit" platform
  ln -s serpent browser
  cat >.mozconfig <<END
mk_add_options AUTOCLOBBER=1
ac_add_options --enable-application=basilisk
mk_add_options PYTHON=/usr/bin/python2
mk_add_options AUTOCONF=/usr/bin/autoconf-2.13
 
# Please see https://www.palemoon.org/redist.shtml for restrictions when using the official branding.
# Build options taken from official Basilisk binary from its about:buildconfig
 
ac_add_options --enable-default-toolkit=cairo-gtk3
ac_add_options --enable-jemalloc
ac_add_options --enable-strip
ac_add_options --with-pthreads
ac_add_options --enable-update-channel=release
ac_add_options --enable-av1
ac_add_options --enable-eme
ac_add_options --disable-official-vendor
ac_add_options --enable-optimize="-O2 -msse2 -mfpmath=sse"
ac_add_options --disable-gconf
ac_add_options --disable-debug-symbols 
ac_add_options --disable-tests
ac_add_options --prefix=/usr

mk_add_options MOZ_MAKE_FLAGS="-j$(nproc)"

END
}

build() {
  cd "$srcdir/Basilisk-$pkgver"
  make -f client.mk build
}

package() {
  cd "$srcdir/Basilisk-$pkgver"
  make -f client.mk DESTDIR="$pkgdir" install

  for i in 16 32 48; do
    install -Dm644 basilisk/branding/unofficial/default$i.png \
      "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/basilisk.png"
  done
  install -Dm644 basilisk/branding/unofficial/content/icon64.png \
    "$pkgdir/usr/share/icons/hicolor/64x64/apps/basilisk.png"
  install -Dm644 basilisk/branding/unofficial/mozicon128.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/basilisk.png"
  install -Dm644 basilisk/branding/unofficial/content/about-logo.png \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/basilisk.png"
  install -Dm644 basilisk/branding/unofficial/content/about-logo@2x.png \
    "$pkgdir/usr/share/icons/hicolor/384x384/apps/basilisk.png"
   install -Dm644 "$srcdir/serpent-browser.desktop" \
    "$pkgdir/usr/share/applications/serpent-browser.desktop"

  # Use system-provided dictionaries
  rm -rf "$pkgdir"/usr/local/lib/basilisk/{dictionaries,hyphenation}
  ln -s /usr/share/hunspell "$pkgdir/usr/lib/basilisk-52.9.0/dictionaries"
  ln -s /usr/share/hyphen "$pkgdir/usr/lib/basilisk-52.9.0/hyphenation"

  # Replace duplicate binary with symlink
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
local _mozhome="$pkgdir/usr/lib/basilisk-$(< basilisk/config/version.txt)"
  ln -sf basilisk "$_mozhome/basilisk-bin"
}
