# Maintainer: Oscar Morante <oscar@mooistudios.com>

pkgname=unityhub
pkgver=1.3.2
pkgrel=2
pkgdesc="The Unity Hub is a standalone application that streamlines the way you find, download, and manage your Unity Projects and installations."
arch=('x86_64')
url=https://forum.unity.com/threads/unity-hub-v-1-3-2-is-now-available.594139
license=('custom')
depends=('gtk2' 'nss' 'p7zip' 'tar' 'gzip' 'cpio' 'zip' 'libxss' 'gconf')
source=("${pkgname}-${pkgver}.AppImage::https://public-cdn.cloud.unity3d.com/hub/prod/UnityHubSetup.AppImage")
md5sums=('a71a4c98b265fe083eaccca33a6fd4ba')
PKGEXT='.pkg.tar'

package() {
  # Extract AppImage
  chmod +x "${pkgname}-${pkgver}.AppImage"
  "./${pkgname}-${pkgver}.AppImage" --appimage-extract

  # Patch desktop file
  _df="${srcdir}/squashfs-root/unityhub.desktop"
  sed -i "/^Exec=/cExec=unityhub" "${_df}"
  sed -i "s/^X-AppImage-Version=/Version=/" "${_df}"
  sed -i "/^X-AppImage/d" "${_df}"

  # Install
  install -d "${pkgdir}/usr/share"
  install -D ${_df} "${pkgdir}/usr/share/applications/unityhub.desktop"
  install -D "${srcdir}/squashfs-root/usr/share/icons/hicolor/48x48/apps/unityhub.png" \
             "${pkgdir}/usr/share/pixmaps/unityhub.png"

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  cp --no-preserve=all \
    "${srcdir}/squashfs-root/eula.txt" \
    "${srcdir}"/squashfs-root/LICENSE* \
    "${pkgdir}/usr/share/licenses/${pkgname}"

  rm -r "${srcdir}/squashfs-root/AppRun" \
        "${srcdir}/squashfs-root/unityhub.desktop" \
        "${srcdir}/squashfs-root/usr/share" \
        "${srcdir}/squashfs-root/eula.txt" \
        "${srcdir}"/squashfs-root/LICENSE*

  install -d "${pkgdir}/opt/${pkgname}"
  cp -r --no-preserve=all ${srcdir}/squashfs-root/* ${pkgdir}/opt/${pkgname}

  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/unityhub" "${pkgdir}/usr/bin/unityhub"
  chmod +x "${pkgdir}/opt/${pkgname}/unityhub"
}
