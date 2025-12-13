# Maintainer: Pavetr <admin@pavetr.ru>

_pkgname=dione
pkgname=${_pkgname}-appimage
pkgver=1.0.0
pkgrel=1
pkgdesc="Dione is a platform designed to help you easily discover, install, and manage open-source AI apps. It offers a clean interface, streamlined workflows, and a growing library of tools to make running local AI apps simple and accessible."
arch=('x86_64')
url="https://github.com/dioneapp/dioneapp"
license=('MIT')
depends=('hicolor-icon-theme')
options=(!strip)

_appimage="Dione-${pkgver}-Installer-Linux.AppImage"

source=(
  "${_appimage}::https://github.com/dioneapp/dioneapp/releases/download/v${pkgver}/${_appimage}"
  "LICENSE::https://raw.githubusercontent.com/dioneapp/dioneapp/v${pkgver}/LICENSE"
  "dione.desktop"
  "dione.png"
)
noextract=("${_appimage}")
sha256sums=('a767203dd01537931f6833b9e0d561c117cb3cef54e9342448df3bb8fc2afc82'
            'd107eb4e3232de02fc9ee3e8d5805bc4d4c655a7888dbfd61e384a81cb162e74'
            'f1ba34cf7f17a0971462568e66ac23032a7bffa41038a0be38926f486aa0f7ae'
            '80aa016ed5f2bf536e4b176fb369810166eea0e119916594e53ae85cb4f55546')

prepare() {
  chmod +x "${_appimage}"
  ./"${_appimage}" --appimage-extract >/dev/null 2>&1 || true
}

package() {
  install -Dm755 "${srcdir}/${_appimage}" \
    "${pkgdir}/opt/${pkgname}/${_appimage}"

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${_pkgname}" <<EOF
#!/bin/bash
export DESKTOPINTEGRATION=false
exec /opt/${pkgname}/${_appimage} "\$@"
EOF

  install -Dm644 "${srcdir}/dione.desktop" \
    "${pkgdir}/usr/share/applications/dione.desktop"
  install -Dm644 "${srcdir}/dione.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/dione.png"

  install -Dm644 "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
