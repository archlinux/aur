# Maintainer: yuf <yuf at yufarch dot com>

pkgname='siki'
pkgver=0.31.1
pkgrel=1
pkgdesc='An Electrom-based application for browsing and posting to message boards'
arch=('x86_64')
url='https://sikiapp.net'
license=('MIT')
depends=('zlib' 'hicolor-icon-theme' 'fuse2')
options=(!strip)
source=("${pkgname}-${pkgver}.AppImage::${url}/archives/${pkgver}/Siki-${pkgver}.AppImage")
noextract=("${pkgname}-${pkgver}.AppImage")
sha512sums=('ebbeb7818d6e1d001099fba60906634d128571f622af52588f8d636f307c7f5f8bdebd6894d668fd5841acf139e3ee29dbd44e3f875f2a17154f49370f78a50d')

prepare () {
  cd "${srcdir}"
  chmod +x "${pkgname}-${pkgver}.AppImage"
  "./${pkgname}-${pkgver}.AppImage" --appimage-extract >> /dev/null
}

build() {
  cd "${srcdir}"
  sed -i \
        -e "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /opt/${pkgname}/${pkgname}.AppImage|" \
        "squashfs-root/${pkgname}.desktop"
  chmod -R a-x+rX squashfs-root/usr
  _copyright=$(curl -sL ${url}/license | sed -n 's/<p>\(Copyright.*\)<\/p>/\1/p')
  sed "1i ${_copyright}\n" ./squashfs-root/LICENSE.electron.txt > LICENSE
}

package () {
  # AppImage
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/opt/${pkgname}/LICENSE"

  # Executable
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${pkgname}"

  # License
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s "/opt/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/squashfs-root/LICENSES.chromium.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"

  # Desktop file
  install -Dm644 "${srcdir}/squashfs-root/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  for _path in "${srcdir}/squashfs-root/usr/share/icons/hicolor/"*;do
    _icon=${_path%*/}
    install -Dm644 "${_path}/apps/${pkgname}.png" -t "${pkgdir}/usr/share/icons/hicolor/${_icon##*/}/apps"
  done
}

