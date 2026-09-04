# Maintainer: Mikhail f. Shiryaev <mr dot felixoid at gmail dot com>
# Community-driven packaging

pkgname="rotatrix"
pkgver=1.5.1
pkgrel=1
pkgdesc="Rotatrix configuration application (AppImage)"
arch=('x86_64')
url="https://rotatrix.com/"
license=('LicenseRef-Rotatrix')
options=('!strip' '!debug')
_appimage=Rotatrix-${pkgver}-linux-x86_64.AppImage
source=(
  "${_appimage}::rotatrix://${_appimage}"
  LICENSE # url: https://rotatrix.com/eula/
)
sha256sums=(
  7e0e5cbae055262ba723c59404549107d186a8cf1217cfd449cff3e46f68059a
  c38bb9b9c10c1a0cf7aa327432c3fd12cece2714ab9fe06799c7440cac383dfb
)
DLAGENTS+=("rotatrix::${startdir}/rotatrix-download %u %o")

prepare() {
  chmod +x "${_appimage}"
  cd "$srcdir"
  msg2 "Extracting AppImage"
  ./"$_appimage" --appimage-extract

  sed -i "s|Exec=AppRun|Exec=/usr/bin/rotatrix|g" \
    "squashfs-root/RotatrixApp.desktop"
}

package() {
  cd "$srcdir"

  install -d "$pkgdir/opt/${pkgname}/"
  cp -a squashfs-root/usr "$pkgdir/opt/${pkgname}/"

  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/rotatrix" << EOF
#!/usr/bin/env bash
export APPIMAGE="$_appimage"
exec "/opt/${pkgname}/usr/bin/rotatrix" "\$@"
EOF
  chmod 0755 "$pkgdir/usr/bin/rotatrix"

  install -Dm644 "squashfs-root/RotatrixApp.desktop" -t \
    "$pkgdir/usr/share/applications/"

  install -d "$pkgdir/usr/share/icons/"
  cp -r squashfs-root/usr/share/icons/hicolor/ "$pkgdir/usr/share/icons/"

  install -d "$pkgdir/usr/share/licenses/${pkgname}"

  cp "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}"
}
