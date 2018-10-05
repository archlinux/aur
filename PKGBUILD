# Maintainer: Oscar Morante <oscar@mooistudios.com>

pkgname=unityhub
pkgver=1.1.0
pkgrel=1
pkgdesc="The Unity Hub is a standalone application that streamlines the way you find, download, and manage your Unity Projects and installations."
arch=('x86_64')
url="https://forum.unity.com/threads/unity-hub-v-1-1-0-is-now-available.564763/"
license=('custom')
depends=('gtk2' 'nss' 'p7zip' 'tar' 'gzip' 'cpio' 'zip')
source=("https://public-cdn.cloud.unity3d.com/hub/prod/UnityHubSetup.AppImage")
md5sums=('7b3fd6f7d66680603a6f3342d77e8a49')
PKGEXT='.pkg.tar'

package() {
  # Extract AppImage
  chmod +x UnityHubSetup.AppImage
  ./UnityHubSetup.AppImage --appimage-extract

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
