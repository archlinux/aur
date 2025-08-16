# Maintainer: Harrison <contact@htv04.com>
# Co-Maintainer: Kaleb Elwert <belak@coded.io>

pkgname=picotron
pkgver=0.2.0h3
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
sha256sums_x86_64=("4f11ab2c92725596564b93b1d31ab4b30b5a7d3d85ad9b27ae919602febcb6d9")
sha256sums_aarch64=("67709ff5fe45a23499f25251a1db403e78c0ff5ae1b0a776ffc4cf5b2af87d6b")

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
