# Maintainer: duanluan <duanluan@outlook.com>

pkgname=pilauncher-bin
_pkgname=pilauncher
_appname=PiLauncher
pkgver=0.1.41
pkgrel=1
pkgdesc='Modern gamepad-friendly Minecraft launcher built with Tauri (prebuilt binary)'
arch=('x86_64')
url='https://github.com/MrShellad/pilauncher'
license=('custom')
depends=('dbus' 'fontconfig' 'gcc-libs' 'glibc' 'gtk3' 'hicolor-icon-theme' 'systemd-libs' 'webkit2gtk-4.1')
provides=('pilauncher')
conflicts=('pilauncher')
options=('!strip')
source=(
  "${_appname}_${pkgver}_amd64.AppImage::https://github.com/MrShellad/pilauncher/releases/download/v0.1.41/PiLauncher_0.1.41_amd64.AppImage"
  'LICENSE'
)
noextract=("${_appname}_${pkgver}_amd64.AppImage")
sha256sums=(
  'e350add69ec7a558202db5f249a136619ed2a8f8377d56ac675cba4fafbf1225'
  '7157f59f7e954221b7d3d5754c2f963881620ec0490152720493133ea0afb6f8'
)

package() {
  local appimage="${srcdir}/${_appname}_${pkgver}_amd64.AppImage"
  local extract_dir="${srcdir}/appimage-extract"
  local appdir
  local icon_source
  local icon_dir

  chmod +x "${appimage}"
  rm -rf "${extract_dir}"
  install -dm755 "${extract_dir}"

  (
    cd "${extract_dir}"
    APPIMAGE_EXTRACT_AND_RUN=1 "${appimage}" --appimage-extract >/dev/null
  )

  appdir="${extract_dir}/squashfs-root"

  install -Dm755 "${appdir}/usr/bin/${_appname}" "${pkgdir}/opt/${_pkgname}/usr/bin/${_appname}"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/pilauncher" <<SCRIPT
#!/bin/sh
export APPDIR=/opt/${_pkgname}
export GDK_BACKEND="\${GDK_BACKEND:-x11}"
export WEBKIT_DISABLE_DMABUF_RENDERER="\${WEBKIT_DISABLE_DMABUF_RENDERER:-1}"
cd /opt/${_pkgname}/usr || exit 1
exec /opt/${_pkgname}/usr/bin/${_appname} "\$@"
SCRIPT

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/pilauncher.desktop" <<DESKTOP
[Desktop Entry]
Type=Application
Version=1.0
Name=PiLauncher
Comment=Modern gamepad-friendly Minecraft launcher
Exec=pilauncher %U
Icon=pilauncher
Terminal=false
StartupNotify=true
StartupWMClass=PiLauncher
Categories=Game;
Keywords=Minecraft;Launcher;PiLauncher;
X-AppImage-Version=0.1.41
DESKTOP

  while IFS= read -r icon_source; do
    icon_dir="${icon_source#${appdir}/usr/share/icons/hicolor/}"
    icon_dir="${icon_dir%/apps/*}"
    install -Dm644 "${icon_source}" "${pkgdir}/usr/share/icons/hicolor/${icon_dir}/apps/pilauncher.png"
  done < <(find "${appdir}/usr/share/icons/hicolor" -type f -iname "${_appname}.png")

  install -Dm644 "${appdir}/${_appname}.png" "${pkgdir}/usr/share/pixmaps/pilauncher.png"
}
