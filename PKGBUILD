# Maintainer: Lukas Deutz <aur at deutz dot io>

pkgname=filen-desktop-appimage
pkgver=1.6.2
pkgrel=2
pkgdesc="Filen.io Desktop Client - Zero knowledge end-to-end encrypted cloud storage"
arch=('x86_64')
url="https://filen.io/"
license=('MIT')
conflicts=()
depends=()
options=(!strip) # necessary otherwise the AppImage file in the package is truncated
source=(
  "https://github.com/FilenCloudDienste/filen-desktop/releases/download/${pkgver}/filen-setup.AppImage"
)
sha512sums=(
  2bf601c71b87b19649db9192e33f79a558c2ea1e8b48ea5707580d260297c5d6abd43f145761c2e4bb55893ad047e8a279894b9ba08c8476872798e8274206d8
)
_appimage_name="filen-setup.AppImage"
_filename="filen-desktop-client"
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

  _sizes=('256x256' '128x128' '64x64' '48x48' '32x32' '22x22' '16x16')
  for _size in "${_sizes[@]}"; do
    install -Dm644 \
      "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${_desktop_icon}" \
      "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/${_desktop_icon}"
  done

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
