# Maintainer: John-Michael Mulesa <jmulesa at gmail dot com>

pkgname=broforce-gog
pkgver=1130_20201008
pkgrel=2
pkgdesc="GOG version of Broforce"
arch=("i686" "x86_64")
url="http://www.gog.com/game/broforce"
license=("custom")
groups=("games")
source=("broforce_${pkgver}_41824.sh::gogdownloader://broforce/en3installer0" "broforce-gog" "broforce-gog.desktop")
sha256sums=('405793776eda4d2fb54dcf20652021bc994070be60db2964395b79b61fbdae7f'
            'e3f5fd7d180e2db767d288befbb0c1b23e724d5b7fced1b0c98680277ea21219'
            'd0a43b39be7b3160f3e199554a7f97d0dbe75666d55a8c479128dce935f5d3e4')
depends=(libgl libx11 libxext desktop-file-utils)

# If you want to use lgogdownloader add the following to /etc/makepkg.conf
# DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
DLAGENTS+=("gogdownloader::/usr/bin/echo Could not find gog installer file (%u). Manually download it to \"$(pwd)\", or set up a gogdownloader:// DLAGENT in /etc/makepkg.conf. See PKGBUILD for example.")

package() {
  # game files
  mkdir -p "${pkgdir}/opt/${pkgname}"
  cp -r "${srcdir}/data/noarch/"* "${pkgdir}/opt/${pkgname}/"

  # launcher and permissions
  # Note: Saves and Levels data may be permissions restricted to one user by default.
  chmod 755 "${pkgdir}/opt/${pkgname}/start.sh"
  chmod 755 "${pkgdir}/opt/${pkgname}/game/Broforce.x86_64"
  chmod 755 "${pkgdir}/opt/${pkgname}/game/Broforce.x86"
  chmod 777 "${pkgdir}/opt/${pkgname}/game"
  install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  # desktop environment integration
  install -Dm644 \
    "${srcdir}/data/noarch/support/icon.png" \
    "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 \
    "${srcdir}/${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # license
  install -Dm644 \
    "${srcdir}/data/noarch/docs/End User License Agreement.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
