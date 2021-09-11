# Maintainer: John-Michael Mulesa <jmulesa at gmail dot com>

pkgname=trine-gog
_pkgname=trine
pkgver=2.0.0.2
pkgrel=1
pkgdesc="GOG version of Trine Enchanted Edition"
arch=("i686" "x86_64")
url="https://www.gog.com/game/trine_enchanted_edition"
license=("custom")
groups=("games")
source=("gog_trine_enchanted_edition_${pkgver}.sh::gogdownloader://trine_enchanted_edition/en3installer1" "${_pkgname}.sh" "${_pkgname}.desktop")
depends=('xorg-xwininfo' 'desktop-file-utils')
depends_i686=('glu' 'libxxf86vm' 'openal' 'libdrm' 'libpng12' 'libogg' 'libvorbis' 'freetype2' 'libx11')
depends_x86_64=('lib32-glu' 'lib32-libxxf86vm' 'lib32-openal' 'lib32-libx11'
                'lib32-libdrm' 'lib32-libvorbis' 'lib32-freetype2' 'lib32-libogg'
                'lib32-gtk2' 'lib32-gdk-pixbuf2' 'lib32-libpng12')
optdepends=('lib32-gtk-engine-murrine: Fixes the Gtk-WARNING error about « murrine »'
            'lib32-gtk-engines: Fixes the Gtk-WARNING about « adwaita »')
sha256sums=('c1d0a0c882f3b0b687b81e571de3f878b28485bcbb3bb6e6bea788980e6d971f'
            'a87c43acaddc4e8e3ee44760b3ad524c5ff07077d26707dd7c61bf1166e65ab8'
            '7a26ff417afc017c956c65cbe9ed0a211c4a3d0b9ee76003661d8a70a22618b1')

# If you want to use lgogdownloader add the following to /etc/makepkg.conf
# DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
DLAGENTS+=("gogdownloader::/usr/bin/echo Could not find gog installer file (%u). Manually download it to \"$(pwd)\", or set up a gogdownloader:// DLAGENT in /etc/makepkg.conf. See PKGBUILD for example.")

package() {
  # game files
  mkdir -p "${pkgdir}/opt/${_pkgname}"
  cp -r "${srcdir}/data/noarch/"* "${pkgdir}/opt/${_pkgname}/"
  rm "${pkgdir}/opt/${_pkgname}/lib/"*

  # launcher
  chmod 755 "${pkgdir}/opt/${_pkgname}/start.sh"
  install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"

  # desktop environment integration
  install -Dm644 \
    "${srcdir}/data/noarch/support/icon.png" \
    "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  install -Dm644 \
    "${srcdir}/${_pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  # license
  install -Dm644 \
    "${srcdir}/data/noarch/docs/End User License Agreement.txt" \
    "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
