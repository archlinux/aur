# Maintainer: Marius Glo <marius@mgl.dev>
# Contributor: Oscar Morante <oscar@mooistudios.com>

pkgname=unityhub
pkgver=2.3.1
pkgrel=1
pkgdesc="The Unity Hub is a standalone application that streamlines the way you find, download, and manage your Unity Projects and installations."
arch=('x86_64')
license=('custom')
depends=('gtk2' 'nss' 'p7zip' 'tar' 'gzip' 'cpio' 'zip' 'libxss' 'gconf' 'libxtst')
source=("${pkgname}-${pkgver}.AppImage::https://public-cdn.cloud.unity3d.com/hub/prod/UnityHub.AppImage")
PKGEXT='.pkg.tar'
sha256sums=('dea24cb7c5729fa1776580b744a836d9e0bcea4a87e543737e70503ba97cd926')

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
    "${srcdir}"/squashfs-root/LICENSE* \
    "${pkgdir}/usr/share/licenses/${pkgname}"

  rm -r "${srcdir}/squashfs-root/AppRun" \
        "${srcdir}/squashfs-root/unityhub.desktop" \
        "${srcdir}/squashfs-root/usr/share" \
        "${srcdir}"/squashfs-root/LICENSE*

  install -d "${pkgdir}/opt/${pkgname}"
  sed -i 's/^SCRIPT_DIR.*$/SCRIPT_DIR=\/opt\/unityhub/g' ${srcdir}/squashfs-root/unityhub
  cp -r --no-preserve=all ${srcdir}/squashfs-root/* ${pkgdir}/opt/${pkgname}

  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/unityhub" "${pkgdir}/usr/bin/unityhub"
  chmod +x "${pkgdir}/opt/${pkgname}/unityhub" "${pkgdir}/opt/${pkgname}/unityhub-bin"
  # Fix 7z permissions
  chmod +x "${pkgdir}/opt/${pkgname}/resources" \
           "${pkgdir}/opt/${pkgname}/resources/app.asar.unpacked" \
           "${pkgdir}/opt/${pkgname}/resources/app.asar.unpacked/lib/linux" \
           "${pkgdir}/opt/${pkgname}/resources/app.asar.unpacked/lib/linux/7z" \
           "${pkgdir}/opt/${pkgname}/resources/app.asar.unpacked/lib/linux/7z/linux64" \
           "${pkgdir}/opt/${pkgname}/resources/app.asar.unpacked/lib/linux/7z/linux64/7z"
}
