# Maintainer: Lukas Deutz <aur at deutz dot io>

pkgname=filen-desktop-appimage
pkgver=2.0.11
pkgrel=1
pkgdesc="Filen.io Desktop Client - Zero knowledge end-to-end encrypted cloud storage"
arch=('x86_64')
url="https://filen.io/"
license=('MIT')
conflicts=()
depends=()
options=(!strip) # necessary otherwise the AppImage file in the package is truncated
source=("https://cdn.filen.io/desktop/release/${pkgver}/filen_${arch[0]}.AppImage")
sha512sums=('7712d6e25d40bbebb0d1eb1bed911fae8db7fa31bceef942daabce43679f1b196fc01e5edbd67791cf084db5d56fc732d83c2c2e243e0a02fa6e948b92447203')
_appimage_name="filen_x86_64.AppImage"
_filename="filen-desktop"
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

  _sizes=('1024x1024' '512x512' '256x256' '128x128' '64x64' '48x48' '32x32' '24x24' '16x16')
  for _size in "${_sizes[@]}"; do
    install -Dm644 \
      "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_size}/apps/${_desktop_icon}" \
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
