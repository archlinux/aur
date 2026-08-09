# Maintainer: CloverGit <clovergit@hotmail.com>

pkgname=stm32cubemx2
_pkgname=stm32cubemx2
pkgver=1.1.1
pkgrel=1
pkgdesc="STM32CubeMX2 - new flavor of STM32CubeMX tool"
arch=('x86_64')
url="https://www.st.com/en/development-tools/stm32cubemx.html"
license=('custom:SLA0048')
groups=('stm32cube')
makedepends=('gendesk')
options=('!strip' '!debug')

_installer="stm32cubemx2-${pkgver}-X64-Linux-installer"
source=("local://${_installer}")
sha256sums=('8fc23d1960ca6bac0922ecd3bfab34d7881f2be6fb382d80430503d7a01a0f3d')

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
    --icon "${pkgname}" \
    --categories "Development;IDE"

  # The ELF embeds a gzip archive, use binwalk to locate where the gzip data starts,
  # binwalk counts from 0, while tail -c +N counts from 1, so tail needs offset + 1
  tail -c +12853518 "${_installer}" >data.tar.gz
  mkdir -p build
  bsdtar -C build -zxf data.tar.gz
}

package() {
  cd "${srcdir}/build"

  install -d "${pkgdir}/opt/${_pkgname}"
  cp -rp . "${pkgdir}/opt/${_pkgname}/"

  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "STM32CubeMX2.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSES.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

# vim: set sw=2 ts=2 et:
