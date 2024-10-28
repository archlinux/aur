# Maintainer: yuf <yuf at yufarch dot com>

pkgname='siki'
pkgver=0.32.2
pkgrel=1
pkgdesc='An Electrom-based application for browsing and posting to message boards'
arch=('x86_64')
url='https://sikiapp.net'
license=('MIT')
depends=('zlib' 'hicolor-icon-theme' 'fuse2')
options=(!strip)
source=("${pkgname}-${pkgver}.AppImage::${url}/archives/${pkgver}/Siki-${pkgver}.AppImage")
noextract=("${pkgname}-${pkgver}.AppImage")
sha512sums=('5bdab19cf254c1338ca8cde62d6e08859b2c038cc0d8c0e297284eb0c89346ea7e8758ceab84f5a676b64a514eadd9d3fa704078c5b595b944d425212df092de')

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

