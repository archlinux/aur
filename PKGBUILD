# Maintainer: Cody Wyatt Neiman (xangelix) <neiman@cody.to>

_pkgbin=steam-rom-manager
pkgname=steam-rom-manager-appimage
pkgdesc="An app for managing ROMs in Steam (extracted from AppImage package)"
license=("GPL3")
url="https://github.com/SteamGridDB/steam-rom-manager"
pkgver="2.5.14"
pkgrel=1
arch=("x86_64")
options=(!strip)
depends=("zlib" "fuse2" "appimagelauncher" "nss" "atk" "at-spi2-atk" "gtk3" "alsa-lib")
provides=("steam-rom-manager")
conflicts=("steam-rom-manager" "steam-rom-manager-git")
_pkgsrc="Steam-ROM-Manager-${pkgver}.AppImage"
source=("${_pkgsrc}::${url}/releases/download/v${pkgver}/${_pkgsrc}"
        "LICENSE::https://raw.githubusercontent.com/SteamGridDB/steam-rom-manager/v${pkgver}/LICENSE")
sha512sums=("43d63da4b25a555e9e1f426c44b772bfbf0e39c2f5b4f59a0c04af3cd5e2b5c9827268a130d4f59a3466a0e7213509d2ab26036908f442bc4109147fd81b5212"
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
