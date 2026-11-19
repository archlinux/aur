# Maintainer: CloverGit <clovergit@hotmail.com>

pkgname=stm32cubemx2-electron
_pkgname=stm32cubemx2
pkgver=1.2.0
pkgrel=1
pkgdesc="STM32CubeMX2 - new flavor of STM32CubeMX tool"
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

_installer="stm32cubemx2-${pkgver}-X64-Linux-installer"
source=("local://${_installer}" "${_pkgname}.sh")
sha256sums=('1b95155270d15c2e5ee266330579bc25bf659bca15e788a3ec3a865cc314af17'
            'd2a2297c49600dd01af70ea157466585f7eaaeb8c5971fe676025db999d659f0')

if [ ! -f "${startdir}/${_installer}" ]; then
  echo ""
  echo "  ==> ERROR: Source package '${_installer}' not found in build directory!"
  echo "  ==> Please download the Linux installer manually from:"
  echo "      ${url}"
  echo "  ==> And place it in: ${startdir}"
  echo ""
fi

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

  # The ELF embeds a gzip archive, use binwalk to locate where the gzip data starts,
  # binwalk counts from 0, while tail -c +N counts from 1, so tail needs offset + 1
  tail -c +$((0x526084 + 1)) "${_installer}" >data.tar.gz
  mkdir -p build
  bsdtar -C build -zxf data.tar.gz
}

package() {
  cd "${srcdir}/build"

  dist="resources/stm32cubemx-application/${pkgver}/dist"
  appdir="${dist}/resources/app"
  appdest="${pkgdir}/opt/${_pkgname}/resources/stm32cubemx-application/${pkgver}/dist"

  # STM32Cube CLI
  install -Dm755 .bin/cube "${pkgdir}/opt/${_pkgname}/.bin/cube"

  # STM32CubeMX2 application and bundles
  install -d "${appdest}/resources"
  cp -rp "resources/stm32cubemx-application/${pkgver}/bundles" "${pkgdir}/opt/${_pkgname}/resources/stm32cubemx-application/${pkgver}/"
  cp -rp "${appdir}" "${appdest}/resources/"
  install -Dm755 "${dist}/bin.js" "${appdest}/bin.js"
  install -Dm755 "${dist}/start-and-load-headless-bin.js" "${appdest}/start-and-load-headless-bin.js"

  # Launcher
  install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
  sed -i "s/@PKGVER@/${pkgver}/" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "STM32CubeMX2.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSES.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

# vim: set sw=2 ts=2 et:
