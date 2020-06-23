# Maintainer: neeshy <neeshy@tfwno.gf>
# Contributor: Charadon <dev at iotib dot net>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
pkgname=serpent-browser
pkgver=2020.06.10
pkgrel=1
pkgdesc="Unbranded version of Basilisk web browser"
arch=('x86_64')
url="https://www.basilisk-browser.org/"
license=('MPL' 'GPL' 'LGPL')
depends=('gtk2' 'gtk3' 'libxt' 'mime-types' 'nss' 'alsa-lib' 'icu' 'ttf-font' 'libpulse')
makedepends=('unzip' 'zip' 'python2' 'yasm' 'mesa' 'autoconf2.13')
optdepends=('hunspell: spell checker and morphological analyzer'
            'hyphen: library for hyphenation and justification'
            'ffmpeg: record, convert, and stream audio and video')
provides=('basilisk')
conflicts=('basilisk')
options=(!emptydirs !makeflags)
_commit=8797b20746cd80c51cc56225f70ddea6c6b94f9d
source=("https://github.com/MoonchildProductions/Basilisk/archive/v$pkgver.tar.gz"
        "https://github.com/MoonchildProductions/UXP/archive/$_commit.tar.gz"
        "https://raw.githubusercontent.com/MoonchildProductions/Pale-Moon/1f08c80172805b68ac36dd368a36f1e6828fc662/palemoon/branding/official/palemoon.desktop")
sha256sums=('95bf84ed387e1fd57d6008e4eb18d9359b0c647c523722942d9faf897d67c11d'
            'cd22f27ec1f2dfadafd2c512268ab8f437504a432c9a32adf491945b09d6c1c9'
            '98fce6e155a0c0243886b09364ab925d742cdc97d631bfd1019a2c597aed42fc')

prepare() {
  cd "$srcdir/Basilisk-$pkgver"

  mv -T "$srcdir/UXP-$_commit" platform
  ln -s serpent browser

  cat > .mozconfig << EOF
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
ac_add_options --disable-necko-wifi
ac_add_options --disable-dbus
ac_add_options --disable-gconf
ac_add_options --disable-gio
ac_add_options --disable-debug-symbols 
ac_add_options --disable-tests
ac_add_options --prefix=/usr
export MOZILLA_OFFICIAL=0
mk_add_options MOZ_MAKE_FLAGS="-j$(nproc)"
EOF
}

build() {
  cd "$srcdir/Basilisk-$pkgver"

  make -f client.mk build
}

package() {
  cd "$srcdir/Basilisk-$pkgver"

  make -f client.mk DESTDIR="$pkgdir" install

  local _i
  for _i in 16 32 48; do
    install -Dm644 "basilisk/branding/unofficial/default$_i.png" \
      "$pkgdir/usr/share/icons/hicolor/${_i}x${_i}/apps/basilisk.png"
  done
  install -Dm644 basilisk/branding/unofficial/content/icon64.png \
    "$pkgdir/usr/share/icons/hicolor/64x64/apps/basilisk.png"
  install -Dm644 basilisk/branding/unofficial/mozicon128.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/basilisk.png"
  install -Dm644 basilisk/branding/unofficial/content/about-logo.png \
    "$pkgdir/usr/share/icons/hicolor/192x192/apps/basilisk.png"
  install -Dm644 basilisk/branding/unofficial/content/about-logo@2x.png \
    "$pkgdir/usr/share/icons/hicolor/384x384/apps/basilisk.png"

  install -Dm644 "$srcdir/palemoon.desktop" \
    "$pkgdir/usr/share/applications/serpent.desktop"
  sed -i -e "s:Pale Moon:Serpent:" -e "s:palemoon:basilisk:" \
    -e "s@https://start.palemoon.org@about:newtab@" \
    "$pkgdir/usr/share/applications/serpent.desktop"

  # Use system-provided dictionaries
  rm -rf "$pkgdir"/usr/local/lib/basilisk/{dictionaries,hyphenation}
  ln -s /usr/share/hunspell "$pkgdir/usr/lib/basilisk-52.9.0/dictionaries"
  ln -s /usr/share/hyphen "$pkgdir/usr/lib/basilisk-52.9.0/hyphenation"

  # Replace duplicate binary with symlink
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -sf basilisk "$pkgdir/usr/lib/basilisk-$(< basilisk/config/version.txt)/basilisk-bin"
}
