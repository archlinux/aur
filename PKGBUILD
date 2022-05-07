# Maintainer: Cody Wyatt Neiman (xangelix) <neiman@cody.to>

_pkgbin=steam-rom-manager
pkgname=steam-rom-manager-appimage
pkgdesc="An app for managing ROMs in Steam."
license=("GPL3")
url="https://github.com/SteamGridDB/steam-rom-manager"
pkgver=2.3.32
pkgrel=1
arch=("x86_64")
options=(!strip)
provides=("steam-rom-manager")
conflicts=("steam-rom-manager" "steam-rom-manager-git")
_pkgsrc="Steam-ROM-Manager-${pkgver}.AppImage"
source=(
  "${_pkgsrc}::${url}/releases/download/v${pkgver}/${_pkgsrc}"
  "LICENSE::https://raw.githubusercontent.com/SteamGridDB/steam-rom-manager/v${pkgver}/LICENSE"
)
sha512sums=("c0d36a5878412b5253f3dc1d37b193890e6a5d0df52fbc98a9de278f68880d6b49312b00b38128bbe2fe929a8708cb7da982befc8f7f21824bd579b3f93af700"
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
