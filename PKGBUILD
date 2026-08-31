# Maintainer: Tymon3310 <aur@tymon3310.dev>
pkgname=pipette-desktop-bin
pkgver=0.4.20
pkgrel=1
pkgdesc="Pipette — Vial-compatible keyboard configurator (AppImage)"
arch=("x86_64")
url="https://github.com/darakuneko/pipette-desktop"
license=('MIT')
provides=('pipette-desktop')
conflicts=('pipette-desktop-git')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'libxtst' 'mesa' 'libappindicator-gtk3')
options=('!strip')
_appimage="${pkgname}-${pkgver}.AppImage"
source=("${_appimage}::https://github.com/darakuneko/pipette-desktop/releases/download/v${pkgver}/Pipette-linux-x86_64.AppImage")
sha256sums=('55fe13a21631b149c478600d9e41b012db90e6aa1ba9062206f0bf580c80e123')

prepare() {
  cd "$srcdir"
  chmod +x "./${_appimage}"
  ./${_appimage} --appimage-extract >/dev/null
}

package() {
  local _install_path="/opt/${pkgname}"

  install -dm755 "${pkgdir}${_install_path}"
  cp -r --no-preserve=mode,ownership "$srcdir/squashfs-root/"* "${pkgdir}${_install_path}/"

  chmod 4755 "${pkgdir}${_install_path}/chrome-sandbox"
  chmod -R 755 "${pkgdir}${_install_path}"

  install -dm755 "$pkgdir/usr/bin"
  cat >"$pkgdir/usr/bin/pipette-desktop" <<EOF
#!/bin/sh
export APPDIR="${_install_path}"
exec "${_install_path}/AppRun" "\$@"
EOF
  chmod 755 "$pkgdir/usr/bin/pipette-desktop"

  install -Dm644 "${pkgdir}${_install_path}/pipette-desktop.desktop" \
    "$pkgdir/usr/share/applications/pipette-desktop.desktop"

  sed -i "s|^Exec=.*|Exec=pipette-desktop --no-sandbox %U|" \
    "$pkgdir/usr/share/applications/pipette-desktop.desktop"

  local _icon_src="${pkgdir}${_install_path}/usr/share/icons/hicolor/1024x1024/apps/pipette-desktop.png"

  install -Dm644 "$_icon_src" \
    "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/pipette-desktop.png"

  install -Dm644 "$_icon_src" \
    "$pkgdir/usr/share/pixmaps/pipette-desktop.png"
}
