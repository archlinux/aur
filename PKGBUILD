# Maintainer: John-Michael Mulesa <jmulesa at gmail dot com>

pkgname=torchlight2-gog
_pkgname=torchlight2
pkgver=1.25.9.7
pkgrel=2
pkgdesc="Torchlight 2 Linux-native with data via GOG"
arch=("i686" "x86_64")
url="http://www.gog.com/game/torchlight_ii"
license=("custom")
groups=("games")
provides=('torchlight2')
source=("gog_torchlight_2_2.0.0.2.sh::gogdownloader://torchlight_ii/en3installer2" "${_pkgname}.sh" "${_pkgname}.desktop")
depends=(libgl libx11 libxext desktop-file-utils)
sha256sums=('ae50c7f6d423f59242cb7d6bf0b525880e94061a554fc3c37561db7a5568c998'
            '3b53b2adc6d1e1147fb48c2c997a360c2e2969e80195ef56f6036de22a28246e'
            'b6bb77692d6d7319d57e3ac22bc4989cdc1ae0512f762f7d3c9f5b75335c250d')

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
