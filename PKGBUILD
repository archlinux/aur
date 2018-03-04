# Maintainer: Yardena Cohen <yardenack at gmail dot com>
# Contributor: Max Roder <maxroder@web.de>
# Contributor: Sebastian Jug <seb AT stianj DOT ug>
# Contributor: midgard <arch dot midgard "at symbol" janmaes "youknowwhat" com>

# To port this PKGBUILD to another language of tor-browser you
# have to change $pkgname, $_language, $pkgdesc and $url in PKGBUILD
# AND (!) the first line in the .install file!

pkgname='tor-browser-en'
pkgver='7.5'
_language='en-US'
pkgrel=2
pkgdesc='Tor Browser Bundle: anonymous browsing using Firefox and Tor'
url='https://www.torproject.org/projects/torbrowser.html.en'
arch=('x86_64')
license=('GPL')
depends=('gtk2' 'mozilla-common' 'libxt' 'startup-notification' 'mime-types'
         'dbus-glib' 'alsa-lib' 'desktop-file-utils' 'hicolor-icon-theme'
         'libvpx' 'icu' 'libevent' 'nss' 'hunspell' 'sqlite')
optdepends=('zenity: simple dialog boxes'
            'kdialog: KDE dialog boxes'
            'gst-plugins-good: H.264 video'
            'gst-libav: H.264 video'
            'libpulse: PulseAudio audio driver'
            'libnotify: Gnome dialog boxes')
install="${pkgname}.install"
validpgpkeys=('EF6E286DDA85EA2A4BA7DE684E2C6E8793298290')
source=("https://dist.torproject.org/torbrowser/${pkgver}/tor-browser-linux64-${pkgver}_${_language}.tar.xz"{,.asc}
        "${pkgname}.desktop"
        "${pkgname}.png"
        "${pkgname}.sh")
md5sums=('61df5c68f34c4a28fcb8f164a24f2fa7'
         'SKIP'
         '69c75e328c117249b30a757f60b634bf'
         '7cd059a3b8194745d7d458a628ccc43a'
         'f0f321b774c77f687d78a8bbdc1d1a15')
sha256sums=('67735b807da20fc3a94978f40c39d034d33c74310ea75622cdf91f09cbc648c5'
            'SKIP'
            '5a3c8dc36f46b22a2bc45de6209d5efa14898e24d968cd08a7e0e767ea3259bd'
            'bb6b0f27c33d21e0ef6df961e25418327c5e8b01c003bbe18c0a8dae3e16d77d'
            '485b968e31d3aade4fac4544db9b826b9a2349cb60649939f3e099f1c74f23da')
sha512sums=('697b14956dddb84596faefab7d8e72b27eef02727c11ad526b1879b504b8274b27a54453a52bb57d7f8e5e6f7eae154b9af15b53456b800c0ddfc55b335b8cf6'
            'SKIP'
            '1318a652f7b65e30cdb0c607faf4391035288bcfcaffc50f7713de8eeb7d9151c115269fad1225fccd71d4d38537a804f05fba03b3df516afbce8a79d8988d7c'
            '89d971f4f0db7d1b50e090040ddce0f7191d511f4c1cae9d2c3364fda40a43b7f506d0c015ddd1485304fadbc0bf7d5d61d1dbc12bf645a7e615f51c1d1261e0'
            'd957e2107c0277fd43ad3ae7b03e60aa442b00fcf0d372855d95f4bac6d518bbee842ae7f05f3492be16017d146f19910036bb6de6c564bbbc8cf221bf1f849a')
noextract=("tor-browser-linux64-${pkgver}_${_language}.tar.xz")

prepare() {
   # We search and replace using sed with / as delimiter below so we can't allow slashes in these vars.
   # Makepkg already enforces that there're no slashes in $pkgname, so we don't check that again here.
   if [[ $pkgver = */* || $_language = */* || $pkgdesc = */* ]]; then
      error '$pkgver, $_language and $pkgdesc for this package are not allowed to contain /' >&2
      return 1
   fi
}

package() {
   cd "${srcdir}"

   sed -i "s/REPL_NAME/${pkgname}/g"       "${pkgname}.sh"
   sed -i "s/REPL_VERSION/${pkgver}/g"     "${pkgname}.sh"
   sed -i "s/REPL_LANGUAGE/${_language}/g" "${pkgname}.sh"

   sed -i "s/REPL_NAME/${pkgname}/g"       "${pkgname}.desktop"
   sed -i "s/REPL_LANGUAGE/${_language}/g" "${pkgname}.desktop"
   sed -i "s/REPL_COMMENT/${pkgdesc}/g"    "${pkgname}.desktop"

   install -Dm 644 "${pkgname}.desktop"    "${pkgdir}/usr/share/applications/${pkgname}.desktop"
   install -Dm 644 "${pkgname}.png"        "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
   install -Dm 755 "${pkgname}.sh"         "${pkgdir}/usr/bin/${pkgname}"

   install -Dm 644 "tor-browser-linux64-${pkgver}_${_language}.tar.xz" "${pkgdir}/opt/${pkgname}/tor-browser-linux64-${pkgver}_${_language}.tar.xz"
}

# vim: set et ts=3 sw=3 :
