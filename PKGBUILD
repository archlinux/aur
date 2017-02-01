# Maintainer: dreieck
# Contributor:  WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: artiom <a.mv at gmx dot fr>
# Contributor: ilikenwf
# Contributor: American_Jesus

_pkgname=palemoon
pkgname="${_pkgname}-26"
pkgver=26.5.0
pkgrel=2
pkgdesc="Pale Moon web browser, old version 26 (still with the jetpack SDK addon technology, but not maintained anymore). Unofficial New Moon-branding."
arch=(
      'i686'
      'x86_64'
     )
url="http://www.palemoon.org/"
provides=(
          "${_pkgname}=${pkgver}"
          "newmoon=${pkgver}"
         )
conflicts=(
           "${_pkgname}"
           "newmoon"
          )
license=(
         'MPL'
         'GPL'
         'LGPL'
        )
depends=(
         'alsa-lib'
         'dbus-glib'
         'desktop-file-utils'
         'gtk2'
         'libxt'
         'mime-types'
        )
makedepends=(
             'autoconf2.13'
             'gcc5'
             'git'
             'gstreamer'
             'gst-plugins-base'
             'python2'
             'unzip'
             'yasm'
             'zip'
            )
optdepends=(
            'hunspell: spell checker and morphological analyzer'
            'hyphen: library for hyphenation and justification'
            'gst-libav: h.264 support'
            'gst-plugins-good: h.264 support'
           )
source=(
        git+"https://github.com/MoonchildProductions/Pale-Moon#tag=${pkgver}_Release"
        "mozconfig.in"
       )
sha256sums=(
            'SKIP'
            '2f5b82b4257af9e7d77fbde1af406bf6cc9861fb3195161c2a9bba74c255e91b'
           )

prepare() {
  sed 's#%SRCDIR%#'"$srcdir"'#g' mozconfig.in > mozconfig
  cd Pale-Moon

  chmod -R +x build/autoconf/* python/*
  find . -name '*.sh' -exec chmod +x {} \;
}

build() {
  cd Pale-Moon

  export MOZBUILD_STATE_PATH="$srcdir/mozbuild"
  export MOZCONFIG="$srcdir/mozconfig"
  export CPPFLAGS="$CPPFLAGS -O2"
  python2 mach build || echo "Next =>"
  python2 mach build
}

package() {
  cd pmbuild
  make package
  cd dist
  install -d "$pkgdir"/usr/{bin,lib}
  cp -r palemoon/ "$pkgdir/usr/lib/${_pkgname}"
  ln -s "../lib/${_pkgname}/palemoon" "$pkgdir/usr/bin/palemoon"

  # icons
  install -Dm644 palemoon/browser/chrome/icons/default/default16.png \
    "$pkgdir/usr/share/icons/hicolor/16x16/apps/${_pkgname}.png"
  install -Dm644 palemoon/browser/chrome/icons/default/default32.png \
    "$pkgdir/usr/share/icons/hicolor/32x32/apps/${_pkgname}.png"
  install -Dm644 palemoon/browser/chrome/icons/default/default48.png \
    "$pkgdir/usr/share/icons/hicolor/48x48/apps/${_pkgname}.png"
  install -Dm644 palemoon/browser/icons/mozicon128.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png"

  # use system-provided dictionaries
  rm -rf "$pkgdir/usr/lib/${_pkgname}"/{dictionaries,hyphenation}
  ln -s /usr/share/hunspell "$pkgdir/usr/lib/${_pkgname}/dictionaries"
  ln -s /usr/share/hyphen "$pkgdir/usr/lib/${_pkgname}/hyphenation"

  # avoid duplicate binaries
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  #ln -sf palemoon "$pkgdir/usr/lib/${_pkgname}/palemoon-bin"
  rm -f "$pkgdir/usr/lib/${_pkgname}/palemoon-bin"

  # install desktop file
  install -Dm644 "$srcdir/Pale-Moon/browser/branding/official/palemoon.desktop" "$pkgdir/usr/share/applications/${_pkgname}.desktop"
}
