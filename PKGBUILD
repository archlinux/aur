# Maintainer: Antti <antti@antti.codes>

pkgname=osu-fm-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="Last.fm scrobbler for osu! (lazer)"
arch=('x86_64')
url="https://github.com/Chicken/osu-fm"
license=('MIT')
depends=()
options=(!strip)

source=(
  "https://github.com/Chicken/osu-fm/releases/download/v${pkgver}/osu-fm-${pkgver}.AppImage"
)
sha512sums=('012489d4c1aeae84719640b99ff0a23a20e7a019e5f0ec64ceae198782b736964e16fa5ffd2108a6ebfd0d75fc443ab51b37e4ee744c3df872c513692794ea07')

_appimage_name="osu-fm-${pkgver}.AppImage"
_appname="osu-fm"
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

  _sizes=('512x512')
  for _size in "${_sizes[@]}"; do
    install -Dm644 \
      "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_size}/apps/${_desktop_icon}" \
      "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/${_desktop_icon}"
  done

  sed -i -E \
    "s|Icon=osu-fm|Icon=/usr/share/icons/hicolor/${_size}/apps/${_desktop_icon}|" \
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
