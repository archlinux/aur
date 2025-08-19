# Maintainer: Christian Weller <jmulesa at gmail dot com>

pkgname=reus-gog
_pkgname=reus
pkgver=1.6.5
pkgrel=1
pkgdesc="Reus Linux-native with data via GOG"
arch=("i686" "x86_64")
url="https://www.gog.com/de/game/reus"
license=("custom")
groups=("games")
provides=('reus')
source=("reus_en_1_6_5_20844.sh::gogdownloader://reus/en3installer0" "${_pkgname}.sh" "${_pkgname}.desktop")
depends=(libgl libx11 libxext desktop-file-utils)
sha256sums=('4e348564514af6930bbd8add5c4f32062548a46fd21fb02ce3e05f673e69cd9d'
            '09764ad1eba195d3209b7f4e1720ce52c7635b324fe63bacf772f2138609af74'
            'f3c29b09908183431df42e65793b45623414404600c151b06ba541c631261d91')

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
