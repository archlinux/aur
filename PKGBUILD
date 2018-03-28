# Maintainer:  WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: artiom <a.mv at gmx dot fr>
# Contributor: ilikenwf
# Contributor: American_Jesus
pkgname=palemoon
pkgver=27.8.3
pkgrel=1
pkgdesc="Open source web browser based on Firefox focusing on efficiency."
arch=('i686' 'x86_64')
url="https://www.palemoon.org/"
license=('MPL' 'GPL' 'LGPL')
depends=('gtk2' 'dbus-glib' 'desktop-file-utils' 'libxt' 'mime-types' 'alsa-lib'
         'startup-notification' 'icu')
makedepends=('git' 'python2' 'autoconf2.13' 'unzip' 'zip' 'yasm'
             'libpulse' 'gcc5')
optdepends=('libpulse: PulseAudio audio driver'
            'hunspell: spell checker and morphological analyzer'
            'hyphen: library for hyphenation and justification'
            'ffmpeg: various video and audio support')
source=(git+"https://github.com/MoonchildProductions/Pale-Moon#tag=${pkgver}_Release"
        mozconfig.in)
md5sums=('SKIP'
         '3b1d2eff90892a99ff6a0e078b35a839')

prepare() {
  sed 's#%SRCDIR%#'"$srcdir"'#g' mozconfig.in > mozconfig
  sed -i 's#xlocale#locale#' Pale-Moon/intl/icu/source/i18n/digitlst.cpp
}

build() {
  cd Pale-Moon

  # gcc5 doesn't understand the -fno-plt flag, strip it out of C{,XX}FLAGS
  export CFLAGS="${CFLAGS//-fno-plt/}"
  export CXXFLAGS="${CFLAGS//-fno-plt/}"

  export MOZBUILD_STATE_PATH="$srcdir/mozbuild"
  export MOZCONFIG="$srcdir/mozconfig"
  export CPPFLAGS="$CPPFLAGS -O2"
  python2 mach build
}

package() {
  cd pmbuild
  make package
  cd dist
  install -d "$pkgdir"/usr/{bin,lib}
  cp -r palemoon/ "$pkgdir/usr/lib/$pkgname"
  ln -s "../lib/$pkgname/palemoon" "$pkgdir/usr/bin/palemoon"

  # icons
  install -Dm644 palemoon/browser/chrome/icons/default/default16.png \
    "$pkgdir/usr/share/icons/hicolor/16x16/apps/$pkgname.png"
  install -Dm644 palemoon/browser/chrome/icons/default/default32.png \
    "$pkgdir/usr/share/icons/hicolor/32x32/apps/$pkgname.png"
  install -Dm644 palemoon/browser/chrome/icons/default/default48.png \
    "$pkgdir/usr/share/icons/hicolor/48x48/apps/$pkgname.png"
  install -Dm644 palemoon/browser/icons/mozicon128.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname.png"

  # use system-provided dictionaries
  rm -rf "$pkgdir"/usr/lib/$pkgname/{dictionaries,hyphenation}
  ln -s /usr/share/hunspell "$pkgdir/usr/lib/$pkgname/dictionaries"
  ln -s /usr/share/hyphen "$pkgdir/usr/lib/$pkgname/hyphenation"

  # avoid duplicate binaries
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  #ln -sf palemoon "$pkgdir/usr/lib/$pkgname/palemoon-bin"
  rm -f "$pkgdir/usr/lib/$pkgname/palemoon-bin"

  # install desktop file
  install -Dm644 "$srcdir/Pale-Moon/browser/branding/official/palemoon.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
