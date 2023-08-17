# Maintainer: Florian Maunier <fmauneko@dissidence.ovh>

pkgname=httpie-desktop-appimage
pkgver=2023.3.4
pkgrel=1
pkgdesc="HTTPie for Desktop (AppImage)"
arch=(x86_64 aarch64)
url="https://httpie.io/product"
license=('unknown')
depends=('fuse2')
options=(!strip) # necessary otherwise the AppImage file in the package is truncated
source_x86_64=("https://github.com/httpie/desktop/releases/download/v$pkgver/HTTPie-$pkgver.AppImage")
source_aarch64=("https://github.com/httpie/desktop/releases/download/v$pkgver/HTTPie-$pkgver-arm64.AppImage")
b2sums_x86_64=('a348f81dcb8f1fa228dc3b20f3330aa9cf0f821b79dfe17772dffba66dd31bd881bfcace2497103aa1ba6a155292c93b7677f660936f5850c6a03dda349a56d9')
b2sums_aarch64=('29b27238e359408c47ba22c8c20e62cbef7966c50fc41d8255050810d6585a59064cf14613985b97615d96f9fbc40ae88ea3ba510ce4489a025386374f8985bf')
[ $CARCH = "x86_64" ] && _filename=HTTPie-$pkgver.AppImage
[ $CARCH = "aarch64" ] && _filename=HTTPie-$pkgver-arm64.AppImage
_appimage_name=$(echo "${_filename}"|sed -E 's/-[0-9]*.[0-9]*.[0-9]*//')
_install_path="/opt/appimages/$_appimage_name"

prepare() {
  chmod +x $_filename
  mkdir -p squashfs-root/usr/share/icons/hicolor
  ./$_filename --appimage-extract "usr/share/icons/hicolor/*/apps/httpie.png" > /dev/null 2>&1
  ./$_filename --appimage-extract httpie.desktop > /dev/null 2>&1
}

build() {
  sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=0 APPIMAGELAUNCHER_DISABLE=1 /usr/bin/httpie-desktop|" squashfs-root/httpie.desktop
  # Fix permissions; .AppImage permissions are 700 for all directories
  chmod -R a-x+rX squashfs-root/usr
}

package() {
  # install icons
  install -dm755 "$pkgdir/usr/share/icons"
  cp -dpr --no-preserve=ownership "squashfs-root/usr/share/icons" "$pkgdir/usr/share"
  chmod -R 755 "$pkgdir/usr/share/icons"
  find "$pkgdir/usr/share/icons" -type f -name "httpie.png" -exec chmod 644 {} \;

  # install .desktop file and image file
  install -Dm644 "squashfs-root/httpie.desktop" "$pkgdir/usr/share/applications/httpie.desktop"
  install -Dm755 "$_filename" "$pkgdir$_install_path"
  mkdir "${pkgdir}/usr/bin/" && chmod 755 "${pkgdir}/usr/bin/"
  ln -s "${_install_path}" "${pkgdir}/usr/bin/httpie-desktop"

  # disable AppImage integration prompt
  # https://github.com/electron-userland/electron-builder/issues/1962
  install -dm755 "$pkgdir/usr/share/appimagekit"
}
