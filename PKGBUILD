# Maintainer: SoftwareRat <jaguar5018@gmail.com>

pkgname=mbcord-appimage
pkgver=3.0.4
pkgrel=2
pkgdesc="An Emby/Jellyfin rich presence client for Discord"
arch=('x86_64')
url="https://github.com/SandwichFox/MBCord"
license=('MIT')
conflicts=()
depends=()
options=(!strip) # necessary otherwise the AppImage file in the package is truncated
source=(
  "https://github.com/SandwichFox/MBCord/releases/download/${pkgver}/mbcord-${pkgver}.AppImage"
)
sha512sums=(
  6a2396f4e784a05aafb109aebc78669e6404f105db8ec231e564374584657634269c528fa530597b2e8ddb51431627023aa65fa7aeff4d4d280048a8c2874777
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
