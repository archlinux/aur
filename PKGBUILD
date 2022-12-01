# Maintainer: Antti <antti@antti.codes>

pkgname=jfcord-appimage
pkgver=4.1.2
pkgrel=1
pkgdesc="An Jellyfin rich presence client for Discord"
arch=('x86_64')
url="https://github.com/Chicken/JFCord"
license=('MIT')
depends=()
optdepends=(
  'discord: Official stable client'
  'discord-ptb: Official ptb client'
  'discord-canary: Official canary client'
)
options=(!strip)

source=(
  "https://github.com/Chicken/JFCord/releases/download/v${pkgver}/jfcord-${pkgver}.AppImage"
)
sha512sums=('5166c6d3788e5fe2bdecf139008d3fd97d9c149757fe0653b8ca4749e248294d3427840c1aef3c1ea2b9a2341db1dd0fdbd2c952d6522e6cef27528649df10b8')

_appimage_name="jfcord-${pkgver}.AppImage"
_appname="jfcord"
_install_path="/opt/${_appname}"
_desktop_file="${_appname}.desktop"
_desktop_icon="${_appname}.png"

prepare() {
  cd "${srcdir}"
  chmod +x ${_appimage_name}
  ./${_appimage_name} --appimage-extract >/dev/null 2>&1
  rm ${_appimage_name}
}

package() {
  sed -i -E \
    "s|Exec=AppRun|Exec=env APPDIR=${_install_path} ${_install_path}/AppRun|" \
    "${srcdir}/squashfs-root/${_desktop_file}"

  _sizes=('0x0')
  for _size in "${_sizes[@]}"; do
    install -Dm644 \
      "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_size}/apps/${_desktop_icon}" \
      "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/${_desktop_icon}"
  done

  sed -i -E \
    "s|Icon=jfcord|Icon=/usr/share/icons/hicolor/${_size}/apps/${_desktop_icon}|" \
    "${srcdir}/squashfs-root/${_desktop_file}"
  
  sed -i -E \
    "s|Name=jfc|Name=JFC|" \
    "${srcdir}/squashfs-root/${_desktop_file}"
  (
    cd squashfs-root
    find . -type f -not -name "${_desktop_file}" \
      -exec install -Dm644 "{}" "${pkgdir}/${_install_path}/{}" \;
  )
  chmod 755 "${pkgdir}/${_install_path}/AppRun"
  chmod 755 "${pkgdir}/${_install_path}/${_appname}"

  install -Dm644 \
    "${srcdir}/squashfs-root/${_desktop_file}" \
    "${pkgdir}/usr/share/applications/${_desktop_file}"
}
