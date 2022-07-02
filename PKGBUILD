#Maintainer: Henrik Vesterager <henrikvesterager@proton.me>
pkgname=concordium-desktop-wallet-appimage
pkgver=1.4.1
pkgrel=1
pkgdesc="The latest stable AppImage of the official Concordium Dektop Wallet"
arch=('x86_64')
url="https://www.concordium.com/desktop-wallets"
license=('Apache License 2.0')
depends=('fuse2')
options=(!strip) # Needed otherwise the AppImage file in the package is truncated
_filename=concordium-desktop-wallet-$pkgver.AppImage
source=("https://distribution.mainnet.concordium.software/tools/linux/${_filename}")
sha256sums=('800cacd0ddd003af847f071328374dc2097c475d2dbc69b75f2c4f73179925f7')
INSTALL_PATH="/opt/${pkgname}/${_filename}"


prepare() {
  chmod +x $_filename
  mkdir -p squashfs-root/usr/share/icons/hicolor
  ./$_filename --appimage-extract "usr/share/icons/hicolor/*/apps/concordium-desktop-wallet.png" > /dev/null 2>&1
  ./$_filename --appimage-extract concordium-desktop-wallet.desktop > /dev/null 2>&1
}

build() {
  sed -i -E "s|Exec=AppRun|Exec=${INSTALL_PATH}|" squashfs-root/concordium-desktop-wallet.desktop
  # Fix permissions; .AppImage permissions are 700 for all directories
  chmod -R a-x+rX squashfs-root/usr
}

package() {
  # install icons
  install -dm755 "${pkgdir}/usr/share/icons"
  cp -dpr --no-preserve=ownership "squashfs-root/usr/share/icons" "${pkgdir}/usr/share"
  chmod -R 755 "${pkgdir}/usr/share/icons"
  find "${pkgdir}/usr/share/icons" -type f -name "concordium-desktop-wallet.png" -exec chmod 644 {} \;

  # install .desktop file and image file
  install -Dm644 "squashfs-root/concordium-desktop-wallet.desktop" "${pkgdir}/usr/share/applications/concordium-desktop-wallet.desktop"
  install -Dm755 "${_filename}" "${pkgdir}${INSTALL_PATH}"

  # disable AppImage integration prompt
  # https://github.com/electron-userland/electron-builder/issues/1962
  install -dm755 "${pkgdir}/usr/share/appimagekit"
  touch "${pkgdir}/usr/share/appimagekit/no_desktopintegration"
  chmod 644 "${pkgdir}/usr/share/appimagekit/no_desktopintegration"
}

