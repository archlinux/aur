# Maintainer: Cody Wyatt Neiman (xangelix) <neiman@cody.to>

_pkgbin=steam-rom-manager
pkgname=steam-rom-manager-appimage
pkgdesc="An app for managing ROMs in Steam."
license=("GPL3")
url="https://github.com/SteamGridDB/steam-rom-manager"
pkgver="2.4.17"
pkgrel=1
arch=("x86_64")
options=(!strip)
depends=("zlib" "fuse2" "appimagelauncher" "nss" "atk" "at-spi2-atk" "gtk3" "alsa-lib")
provides=("steam-rom-manager")
conflicts=("steam-rom-manager" "steam-rom-manager-git")
_pkgsrc="Steam-ROM-Manager-${pkgver}.AppImage"
source=("${_pkgsrc}::${url}/releases/download/v${pkgver}/${_pkgsrc}"
        "LICENSE::https://raw.githubusercontent.com/SteamGridDB/steam-rom-manager/v${pkgver}/LICENSE")
sha512sums=("b6ddc5ba365362997ffc5dc697b03f47170efeaa03cbf429e1849963efb3daa9d7ecb602dc88f5714387c2b24d820a065baef82f055781e13661e61ac22fe93e"
            "552aec8d120c9d931769f6a6b794716fce978d0055715de21746dc0f064f4a0f72b6be42d4828b98a56715b23fa427c1f66fd20aca0ef1751cc384c420db1605")


build() {
  # Extract files
  chmod +x "$srcdir/$_pkgsrc"
  $srcdir/$_pkgsrc --appimage-extract

  # Correct .desktop
  sed -e "s/AppRun/${_pkgbin}/g" -i "$srcdir/squashfs-root/$_pkgbin.desktop"
}


package() {
  install -d "$pkgdir/opt/$_pkgbin"
  cp -a "$srcdir/squashfs-root/." "$pkgdir/opt/$_pkgbin/"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$_pkgbin/$_pkgbin" "$pkgdir/usr/bin/$_pkgbin"

  install -d "$pkgdir/usr/share"
  cp -r "$srcdir/squashfs-root/usr/share/." "${pkgdir}/usr/share/"

  find "$pkgdir" -type d -exec chmod 755 {} +

  install -Dm644 "$srcdir/squashfs-root/$_pkgbin.desktop" "$pkgdir/usr/share/applications/$_pkgbin.desktop"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
