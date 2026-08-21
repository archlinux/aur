# Based on the template from https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html
# Maintainer : Sergey Kostrukov <sergey at kostrukov dot com>
# Contributor : Tianrui Wei <archlinux_aur at mail dot tianrui-wei dot com>
# Contributor : Marcio Silva <marcionps at gmail dot com>

_pkgname=todoist

pkgname="${_pkgname}"-appimage
pkgver=9.30.0
pkgrel=2
pkgdesc="The to-do list to organize work & life."
arch=('x86_64')
url="https://todoist.com/"
license=('custom:Commercial')
depends=('zlib' 'fuse2' 'appimagelauncher')
options=('!strip' '!debug')
_appimage="${pkgname}-${pkgver}.AppImage"
source_x86_64=("${_appimage}::https://electron-dl.todoist.net/linux/Todoist-linux-${pkgver}-x86_64-latest.AppImage")
noextract=("${_appimage}")
sha256sums_x86_64=('21ec180a3daee7398d3b1ec1217fdd0c7078ab66db0e5cb23c82ac10aa734c9e')

prepare() {
  chmod +x "${_appimage}"
  ./"${_appimage}" --appimage-extract
}

build() {
  local _desktop="squashfs-root/${_pkgname}.desktop"

  # Adjust .desktop so it will work outside of AppImage container.
  # Upstream's Exec already ends in "--no-sandbox %U", so the replacement must
  # not add a field code of its own: the spec allows at most one per Exec line
  # and GLib (uwsm, gio launch) rejects the entry outright when there are two.
  sed -i -E "s|^Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|" "${_desktop}"

  # Same environment for the desktop action, and an absolute path instead of $PATH
  sed -i -E "s|^Exec=${_pkgname} |Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname} |" "${_desktop}"

  # Upstream ships a [Desktop Action new-window] group without declaring it
  grep -q '^Actions=' "${_desktop}" || \
    sed -i -E "/^\[Desktop Entry\]/a Actions=new-window;" "${_desktop}"

  # Upstream lists image/jpeg twice
  sed -i -E "s|image/jpeg;image/jpeg;|image/jpeg;|" "${_desktop}"

  # Guard: fail the build if the main Exec ever ends up with >1 field code again
  local _codes
  _codes=$(grep -m1 '^Exec=env' "${_desktop}" | grep -o -- '%[fFuU]' | wc -l)
  if (( _codes > 1 )); then
    echo "error: Exec line has ${_codes} field codes, expected at most 1" >&2
    return 1
  fi

  # Fix permissions; .AppImage permissions are 700 for all directories
  chmod -R a-x+rX squashfs-root/usr
}

package() {
  # AppImage
  install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

  # Desktop file
  install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  # Icon
  install -dm755 "${pkgdir}/usr/share/"
  cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
  mkdir -p "${pkgdir}/usr/share/pixmaps/"
  install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/todoist.png" "${pkgdir}/usr/share/pixmaps"

  # Symlink executable
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}
