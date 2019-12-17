# Maintainer: Oscar Morante <oscar@mooistudios.com>

pkgname=unityhub
pkgver=2.2.2
pkgrel=1
pkgdesc="The Unity Hub is a standalone application that streamlines the way you find, download, and manage your Unity Projects and installations."
arch=('x86_64')
license=('custom')
depends=('gtk2' 'nss' 'p7zip' 'tar' 'gzip' 'cpio' 'zip' 'libxss' 'gconf' 'libxtst')
source=("${pkgname}-${pkgver}.AppImage::https://public-cdn.cloud.unity3d.com/hub/prod/UnityHub.AppImage")
md5sums=('585164e362a5d354fcf9ce8521fbf1fa')
PKGEXT='.pkg.tar'

build() {
  # Extract AppImage
  chmod +x "${pkgname}-${pkgver}.AppImage"
  "./${pkgname}-${pkgver}.AppImage" --appimage-extract

  # Patch desktop file
  _df="${srcdir}/squashfs-root/unityhub.desktop"
  sed -i "/^Exec=/cExec=unityhub" "${_df}"
  sed -i "s/^X-AppImage-Version=/Version=/" "${_df}"
  sed -i "/^X-AppImage/d" "${_df}"
}

package() {
  # Install
  _df="${srcdir}/squashfs-root/unityhub.desktop"
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
  # Fix 7z permissions
  chmod +x "${pkgdir}/opt/${pkgname}/resources" \
           "${pkgdir}/opt/${pkgname}/resources/app.asar.unpacked" \
           "${pkgdir}/opt/${pkgname}/resources/app.asar.unpacked/lib/linux" \
           "${pkgdir}/opt/${pkgname}/resources/app.asar.unpacked/lib/linux/7z" \
           "${pkgdir}/opt/${pkgname}/resources/app.asar.unpacked/lib/linux/7z/linux64" \
           "${pkgdir}/opt/${pkgname}/resources/app.asar.unpacked/lib/linux/7z/linux64/7z"
}
