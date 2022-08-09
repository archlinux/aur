# Maintainer: Florian Maunier <fmauneko@dissidence.ovh>

pkgname=httpie-desktop-appimage
pkgver=2022.11.1
pkgrel=1
pkgdesc="HTTPie for Desktop (AppImage)"
arch=(x86_64 aarch64)
url="https://httpie.io/product"
license=('unknown')
depends=('fuse2')
options=(!strip) # necessary otherwise the AppImage file in the package is truncated
_filename=HTTPie-$pkgver.AppImage
_filename_aarch64=HTTPie-$pkgver-arm64.AppImage
source_x86_64=("https://github.com/httpie/desktop/releases/download/v$pkgver/$_filename")
source_aarch64=("$_filename::https://github.com/httpie/desktop/releases/download/v$pkgver/$_filename_aarch64")
sha256sums_x86_64=('69eda1c247912ce205f9df9e8b77a2ac6d4f65026cb11800c256330182a5a15c')
sha256sums_aarch64=('1df86ad015ed3d3e21307246ef52985faed11bb90979acca580b6935797c98f1')
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
