# Maintainer: Denys Vitali <denys+arch-aur@denv.it>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>

_name=firefox
_channel=developer
_codename=aurora
pkgname="${_name}-dev"
pkgdesc='Mozilla Firefox Developer Edition'
url='http://www.mozilla.org/firefox/developer'
pkgver=53.0a2_20170213084042
_ffver=53.0a2
_ffbid=20170213084042
locale="en-US"
# Next version: 53.0a2
# Current BID: 20170213084042
year=${_ffbid:0:4}
month=${_ffbid:4:2}
day=${_ffbid:6:2}
hour=${_ffbid:8:2}
minute=${_ffbid:10:2}
second=${_ffbid:12:2}
pkgrel=1
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
_file="${_name}-${_ffver}.en-US.linux-${CARCH}"
_puburl="https://archive.mozilla.org/pub/firefox/nightly"
validpgpkeys=('14F26682D0916CDD81E37B6D61B7B526D98F0353') # Mozilla Software Releases
source=(
  ${_puburl}/${year}/${month}/${year}-${month}-${day}-${hour}-${minute}-${second}-mozilla-${_codename}/${_name}-${_ffver}.${locale}.linux-${CARCH}.tar.bz2{,.asc}
  "firefox-developer.desktop"
  "vendor.js"
)
sha512sums=('SKIP'
            'SKIP'
            '9be66aec933af7495398882662b04555abda84b32a24c2f7456b6c1d719b83320aae4c42b913a805073fdf87b476e0ff70a86eeaf48f343a9540c50f6bf26454'
            'bae5a952d9b92e7a0ccc82f2caac3578e0368ea6676f0a4bc69d3ce276ef4f70802888f882dda53f9eb8e52911fb31e09ef497188bcd630762e1c0f5293cc010')
depends=('alsa-lib' 'libxt' 'libnotify' 'mime-types' 'nss' 'gtk3' 'sqlite3' 'dbus-glib' 'hunspell')

prepare() {
  # remove the dictionaries included in the archive
  rm -rf firefox/dictionaries
}

package() {
  install -d $pkgdir/{usr/{bin,share/{applications,pixmaps}},opt}
  cp -r firefox $pkgdir/opt/firefox-$_channel

  ln -s /opt/firefox-$_channel/firefox $pkgdir/usr/bin/firefox-$_channel
  install -m644 $srcdir/firefox-$_channel.desktop $pkgdir/usr/share/applications/
  install -m644 $srcdir/firefox/browser/icons/mozicon128.png $pkgdir/usr/share/pixmaps/$pkgname-icon.png
  ls
  install -Dm644 $srcdir/vendor.js $pkgdir/opt/firefox-$_channel/browser/defaults/preferences/vendor.js

  # Use system-provided dictionaries
  rm -rf "$pkgdir"/opt/firefox-$channel/{dictionaries,hyphenation}
  ln -s /usr/share/hunspell "$pkgdir/opt/firefox-$_channel/dictionaries"
  ln -s /usr/share/hyphen "$pkgdir/opt/firefox-$_channel/hyphenation"

}
