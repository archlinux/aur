# Maintainer: hoywu <wu_git [at-symbol] outlook [dot] com>

_pkgname=futubull-desktop

pkgname=${_pkgname}-bin
pkgver=15.40.13908
pkgrel=1
pkgdesc="One-Stop Trading Platform for Hong Kong, US and China Connect Stocks"
arch=('x86_64')
url="https://www.futunn.com/"
license=('custom')
conflicts=('ftnn-desktop')
depends=(
  'glibc'
  'glib2'
  'libxcb'
  'libx11'
  'libxext'
  'libxkbcommon'
  'libxkbcommon-x11'
  'libmng'
  'xcb-util-wm'
  'xcb-util-image'
  'xcb-util-keysyms'
  'xcb-util-renderutil'
)
options=('!strip' '!debug' '!emptydirs')
_deb="${pkgname}-${pkgver}.deb"
source_x86_64=("${_deb}::https://softwaredownload.futunn.com/FTNN_desktop_${pkgver}_amd64.deb"
               "futubull.desktop")
sha256sums_x86_64=('adbeb89891f172b4d5c7b42498766af5ac99a211627d5d8932e9755784b25300'
                   'a08936d41b249848e7cb1b2339f9cff6db5f7698a76c23580267353ec68fc1f6')

package() {
  # Extract files from the deb package
  tar -xJ -f data.tar.xz -C "${pkgdir}"
  mv "${pkgdir}/opt/FTNN" "${pkgdir}/opt/${_pkgname}"
  rm -rf "${pkgdir}/out"

  # Setup permissions
  chown -R root:root "${pkgdir}/opt/${_pkgname}"
  chmod 755 "${pkgdir}/opt/${_pkgname}"
  find "${pkgdir}/opt/${_pkgname}" -type f -executable -exec chmod 755 {} +

  # Symlink executable
  install -dm755 "${pkgdir}/usr/bin/"
  ln -s "/opt/${_pkgname}/FTNN" "${pkgdir}/usr/bin/${_pkgname}"

  # Install desktop entry and icon
  install -Dm644 "${srcdir}/futubull.desktop" \
          "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "${pkgdir}/opt/${_pkgname}/app.png" \
          "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"

  # Install license
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  echo "See: https://www.futunn.com/about/services" > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
