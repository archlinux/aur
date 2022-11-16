# Maintainer: SoftwareRat <jaguar5018@gmail.com>

pkgname=mbcord-appimage
pkgver=3.0.5
pkgrel=3
pkgdesc="An Emby/Jellyfin rich presence client for Discord"
arch=('x86_64')
url="https://github.com/SandwichFox/MBCord"
license=('MIT')
conflicts=()
optdepends=('discord: Official stable client'
            'discord-canary: Official canary client'
)
depends=()
options=(!strip) # necessary otherwise the AppImage file in the package is truncated
source=(
  "https://github.com/SandwichFox/MBCord/releases/download/${pkgver}/mbcord-${pkgver}.AppImage"
)
sha512sums=(
d968302a582a747d42c2b4e6cef3d260cf46b288fa0ed98018c3375fbe5a526595699d5a3d016d11fdef55e21e45b13924616347464cca15220195af7e4063a2
)
_appimage_name="mbcord-${pkgver}.AppImage"
_filename="mbcord"
_install_path="/opt/appimages/${_filename}"
_desktop_file="${_filename}.desktop"
_desktop_icon="${_filename}.png"

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
    "s|Icon=mbcord|Icon=/usr/share/icons/hicolor/${_size}/apps/${_desktop_icon}|" \
    "${srcdir}/squashfs-root/${_desktop_file}"
  
  sed -i -E \
    "s|Name=mbc|Name=MBC|" \
    "${srcdir}/squashfs-root/${_desktop_file}"
  (
    cd squashfs-root
    find . -type f -not -name "${_desktop_file}" \
      -exec install -Dm644 "{}" "${pkgdir}/${_install_path}/{}" \;
  )
  chmod 755 "${pkgdir}/${_install_path}/AppRun"
  chmod 755 "${pkgdir}/${_install_path}/${_filename}"

  install -Dm644 \
    "${srcdir}/squashfs-root/${_desktop_file}" \
    "${pkgdir}/usr/share/applications/${_desktop_file}"
}
