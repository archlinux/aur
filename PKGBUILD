# Maintainer: CloverGit <clovergit@hotmail.com>

pkgname=stm32cubemx2-electron
_pkgname=stm32cubemx2
pkgver=1.2.0
pkgrel=3
pkgdesc="STM32CubeMX2 - new flavor of STM32CubeMX tool. Run with system electron"
arch=('x86_64')
url="https://www.st.com/en/development-tools/stm32cubemx.html"
license=('custom:SLA0048')
groups=('stm32cube')
makedepends=('gendesk')
depends=('electron44' 'libsecret')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
replaces=("${_pkgname}")

options=('!strip' '!debug')

_bundle="stm32cubemx-application-${pkgver}-x86_64-linux.bundle"
source=(
  "https://developer.st.com/bundles/s/${_bundle}"
  "${_pkgname}.sh"
)
sha256sums=('8284b4d4e5c0931d1a832a9e270c701d7831b6ccc2792b5ea1a0dd3090555fb8'
            'f4aa6680da9f0ffc3eeee3adac15e7b9f80e669a69eec1db3c562863e5e15f70')

prepare() {
  cd "${srcdir}"

  gendesk -f -n \
    --pkgname "${pkgname}" \
    --pkgdesc "${pkgdesc}" \
    --name "STM32CubeMX2" \
    --genericname "new flavor configuration tool for STM32 microcontrollers" \
    --exec "${_pkgname} %F" \
    --icon "${_pkgname}" \
    --categories "Development;IDE"

  mkdir -p build
  bsdtar -C build -xf "${_bundle}"
}

package() {
  cd "${srcdir}/build"

  appdir="${pkgdir}/opt/${_pkgname}"

  # STM32CubeMX2 application and bundles
  install -d "${appdir}/bundles" "${appdir}/dist/resources"
  cp -rp bundles/. "${appdir}/bundles/"
  cp -rp dist/resources/app "${appdir}/dist/resources/"
  install -Dm755 dist/bin.js "${appdir}/dist/bin.js"
  install -Dm755 dist/start-and-load-headless-bin.js "${appdir}/dist/start-and-load-headless-bin.js"

  install -d "${appdir}/bin"
  ln -s "../bundles/cube-wrapper/0.11.2/bin/cube" "${appdir}/bin/cube"

  # Launcher
  install -d "${pkgdir}/usr/bin"
  install -m755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/opt/${_pkgname}/bin/${_pkgname}"
  ln -s "/opt/${_pkgname}/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 \
    "dist/resources/app/plugins/st-cube-core/extension/img/Subbrand_STM32-2_STM32.png" \
    "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
  install -m644 "AdditionalLicenseTerms.md" "${pkgdir}/usr/share/licenses/${pkgname}/AdditionalLicenseTerms.md"
}

# vim: set sw=2 ts=2 et:
