# Maintainer: Florian Maunier <fmauneko@dissidence.ovh>

pkgname=httpie-desktop-appimage
pkgver=2022.13.0
pkgrel=1
pkgdesc="HTTPie for Desktop (AppImage)"
arch=(x86_64 aarch64)
url="https://httpie.io/product"
license=('unknown')
depends=('fuse2')
options=(!strip) # necessary otherwise the AppImage file in the package is truncated
source_x86_64=("https://github.com/httpie/desktop/releases/download/v$pkgver/HTTPie-$pkgver.AppImage")
source_aarch64=("https://github.com/httpie/desktop/releases/download/v$pkgver/HTTPie-$pkgver-arm64.AppImage")
b2sums_x86_64=('da80afa517e821ad228f30b47c427d177c1c82f391f029da4cf6efe4d13f10df366eb87ff7c53cdf79643bddc2c6781453d955cb46892f99c8070d61daeec6c0')
b2sums_aarch64=('3e4243662398859899d18745b05277080c7a4a66d1c55e78a612aab1c4cb2ac3cd5aeb4bed7e63c1c8412d784553a87b3270b533f199fa2da4512d21d0b5b6f2')
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
