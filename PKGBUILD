# Maintainer: John-Michael Mulesa <jmulesa at gmail dot com>

pkgname=trine2-gog
_pkgname=trine2
pkgver=2.0.0.5
pkgrel=2
pkgdesc="GOG version of Trine 2 Complete Story"
arch=("i686" "x86_64")
url="https://www.gog.com/game/trine_2_complete_story"
license=("custom")
groups=("games")
source=("gog_trine_2_complete_story_${pkgver}.sh::gogdownloader://trine_2_complete_story/en3installer2" "${_pkgname}.sh" "${_pkgname}.desktop")
depends=('xorg-xwininfo' 'desktop-file-utils')
depends_i686=('glu' 'libxxf86vm' 'openal' 'libdrm' 'libpng12' 'libogg' 'libvorbis' 'freetype2' 'libx11')
depends_x86_64=('lib32-glu' 'lib32-libxxf86vm' 'lib32-openal' 'lib32-libx11'
                'lib32-libdrm' 'lib32-libvorbis' 'lib32-freetype2' 'lib32-libogg'
                'lib32-gtk2' 'lib32-gdk-pixbuf2' 'lib32-libpng12')
optdepends=('lib32-gtk-engine-murrine: Fixes the Gtk-WARNING error about « murrine »'
            'lib32-gtk-engines: Fixes the Gtk-WARNING about « adwaita »')
sha256sums=('7a5d5b4a4bc9eee8a80d2975c61963e286c33fba41a115264d0f77aad9ea1408'
            '66ad2ebf559e95f1891a1e2afd7b435e30726f950e84109703a407f93befbfe6'
            'd35f9826cad06a78e9cdaa83f30c5abd20f1aca414792cf6b1acc950e139dbd2')

# If you want to use lgogdownloader add the following to /etc/makepkg.conf
# DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
DLAGENTS+=("gogdownloader::/usr/bin/echo Could not find gog installer file (%u). Manually download it to \"$(pwd)\", or set up a gogdownloader:// DLAGENT in /etc/makepkg.conf. See PKGBUILD for example.")

package() {
  # game files
  mkdir -p "${pkgdir}/opt/${_pkgname}"
  cp -r "${srcdir}/data/noarch/"* "${pkgdir}/opt/${_pkgname}/"

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
