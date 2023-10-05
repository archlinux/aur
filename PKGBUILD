# Maintainer: Florian Maunier <fmauneko@dissidence.ovh>

pkgname=httpie-desktop-appimage
pkgver=2023.3.5
pkgrel=1
pkgdesc="HTTPie for Desktop (AppImage)"
arch=(x86_64 aarch64)
url="https://httpie.io/product"
license=('unknown')
depends=('fuse2')
options=(!strip) # necessary otherwise the AppImage file in the package is truncated
source_x86_64=("https://github.com/httpie/desktop/releases/download/v$pkgver/HTTPie-$pkgver.AppImage")
source_aarch64=("https://github.com/httpie/desktop/releases/download/v$pkgver/HTTPie-$pkgver-arm64.AppImage")
b2sums_x86_64=('4df1bb10ef240e94598783f2c9edbb57565b093a26ea75594021c5fb52eb70e1c38c4b749d734706b4426c5cb5c92416a371aa73aa65cda6ed9ff9579f4cff67')
b2sums_aarch64=('363c892c62df358e8499163196b4534daf1301833eed6472f8479e05faf3847d11a514f3f1e9127f8ebaf20c2e43b3f5dc27633d149b4065e95b5193a42a9cf8')
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
