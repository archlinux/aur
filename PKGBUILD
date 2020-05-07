# Maintainer: Charadon <dev at iotib dot net>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Based on basilisk browser PKGBUILD

pkgname=serpent-browser
pkgver=2020.05.08
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
_commit=20200506
source=("https://github.com/MoonchildProductions/Basilisk/archive/v$pkgver.tar.gz"
        "https://github.com/MoonchildProductions/UXP/archive/RELBASE_$_commit.tar.gz"
        "serpent-browser.desktop")
sha512sums=('5416d00309c2f62852f1acda58debe570f275d16cb6197f82adb5c96471996dab6b369f061fadb35b28dc1c1bd6397e88fcb577fde3ad63416328cd69226827a'
            '14ab79df0ee4098f1cb5e9396438595c3db25f66e2cbcaf4fc6a159fad870cad52959ae35c635fdbd457a8d18c07363e5cd3b43198794c3381e477355cdbb5b3'
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
export MOZILLA_OFFICIAL=0
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
