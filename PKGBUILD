# Maintainer: Antti <antti@antti.codes>

pkgname=osu-fm-bin
pkgver=1.0.1
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
sha512sums=('ce744477b76295554a47b4087e55a57a59563a41eb0323e1ff138705fb84333d7c5bbf73a2d85e2779d36254e91316f7a20c59fb4f60e15bcdf4301e7aec4394')

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

  _sizes=('0x0')
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
