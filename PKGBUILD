# Maintainer: John-Michael Mulesa <jmulesa at gmail dot com>

pkgname=broforce-gog
_pkgname=broforce
pkgver=1130_20201008
pkgrel=3
pkgdesc="Broforce Linux-native with data via GOG"
arch=("i686" "x86_64")
url="http://www.gog.com/game/broforce"
license=("custom")
groups=("games")
provides=('broforce')
conflicts=('broforce-steam')
source=("broforce_${pkgver}_41824.sh::gogdownloader://broforce/en3installer0" "${_pkgname}.sh" "${_pkgname}.desktop")
depends=(libgl libx11 libxext desktop-file-utils)
sha256sums=('405793776eda4d2fb54dcf20652021bc994070be60db2964395b79b61fbdae7f'
            'cae03d845e18a3879864bbdd039c30ffdf3e5aa50f79ffae81d5663f23117cc7'
            'f4d0ab0b9014724ded958a7cf4a6c62e6bcc056c1ffc27ea21a11d506f22bebf')

# If you want to use lgogdownloader add the following to /etc/makepkg.conf
# DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
DLAGENTS+=("gogdownloader::/usr/bin/echo Could not find gog installer file (%u). Manually download it to \"$(pwd)\", or set up a gogdownloader:// DLAGENT in /etc/makepkg.conf. See PKGBUILD for example.")

package() {
  # game files
  mkdir -p "${pkgdir}/opt/${_pkgname}"
  cp -r "${srcdir}/data/noarch/"* "${pkgdir}/opt/${_pkgname}/"

  # launcher and permissions
  # Note: Saves and Levels data may be permissions restricted to one user by default.
  chmod 755 "${pkgdir}/opt/${_pkgname}/start.sh"
  chmod 755 "${pkgdir}/opt/${_pkgname}/game/Broforce.x86_64"
  chmod 755 "${pkgdir}/opt/${_pkgname}/game/Broforce.x86"
  chmod 777 "${pkgdir}/opt/${_pkgname}/game"
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
