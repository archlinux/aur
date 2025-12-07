# Maintainer: arbitar <aur@arbi.in>
# Original Maintainer: Harrison <contact@htv04.com>
# Original Co-Maintainer: Kaleb Elwert <belak@coded.io>

pkgname=picotron
pkgver=0.2.1e
pkgrel=1
pkgdesc="A fantasy workstation for making pixelart games, animations, music, demos and other curiosities."
arch=("x86_64" "aarch64")
url="https://www.lexaloffle.com/picotron.php"
license=("custom:commercial")
depends=("sdl2")
optdepends=()
provides=("${pkgname}")

source=("${pkgname}.desktop"
        "${pkgname}.xml")
source_x86_64=("file://${pkgname}_${pkgver}_amd64.zip")
source_aarch64=("file://${pkgname}_${pkgver}_raspi.zip")

sha256sums=("04862c5d2f4ec10f4979ec316c4e14b01e073806d90bc23290e8420e142f710a"
            "45525e5ff68d3380492e188e626cf2208491ba0df79cc246aa8560e05f5b3100")
sha256sums_x86_64=("2690c6c1558e2efbd2c092ba2cc182b31a7ad218dc58c7076f669075e7a7aa99")
sha256sums_aarch64=("7a3cbd4833d3cc74b1164f9270c70dcb517da683761ea61f817f1d87129641ae")

package() {
  # Desktop entry
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${pkgname}.xml" "${pkgdir}/usr/share/mime/packages/${pkgname}.xml"
  install -Dm644 "picotron/lexaloffle-${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  # License
  install -Dm644 "picotron/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Binaries
  install -Dm644 "picotron/picotron.dat" "${pkgdir}/opt/${pkgname}/picotron.dat"
  install -Dm755 "picotron/picotron_dyn" "${pkgdir}/opt/${pkgname}/picotron_dyn"
  install -Dm644 "picotron/picotron_manual.txt" "${pkgdir}/opt/${pkgname}/picotron_manual.txt"

  local _target="picotron_dyn"

  # picotron is the stripped binary and is only available on some platforms, so
  # we only install (and prefer) it if it exists.
  if [[ -f "picotron/picotron" ]]; then
    install -Dm755 "picotron/picotron" "${pkgdir}/opt/${pkgname}/picotron"
    _target="picotron"
  fi

  # Link the preferred binary to /usr/bin
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/${_target}" "${pkgdir}/usr/bin/picotron"
}
