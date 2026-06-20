# Maintainer: Boof2015 <contact@novaml.ai>
pkgname=astra-music-bin
pkgver=0.6.1.beta
pkgrel=1
pkgdesc="Audiophile music player with advanced visualization"
arch=('x86_64')
url="https://github.com/Boof2015/astra"
license=('GPL-3.0-only')
provides=('astra')
conflicts=('astra')
depends=('fuse2')
options=(!strip !debug)
source=("astra-0.6.1.beta.AppImage::https://github.com/Boof2015/astra/releases/download/v0.6.1-beta/Astra-0.6.1-beta-Linux.AppImage")
noextract=("astra-${pkgver}.AppImage")
sha256sums=('9e84e13841ce03bee4275961de6820caca4e91ba559aa3b19d91e6470264dc36')

prepare() {
  cd "${srcdir}"

  chmod +x "astra-${pkgver}.AppImage"
  rm -rf squashfs-root
  "./astra-${pkgver}.AppImage" --appimage-extract >/dev/null
}

package() {
  local _appdir="${srcdir}/squashfs-root"
  local _appimage_source="${srcdir}/astra-${pkgver}.AppImage"
  local _appimage_target="${pkgdir}/opt/astra/astra.AppImage"
  local _desktop_path="${pkgdir}/usr/share/applications/astra.desktop"
  local _desktop_source
  local _icon_source
  local _icon_relative
  local _icon_ext
  local _icon_installed=0
  local _root_icon

  install -Dm755 "${_appimage_source}" "${_appimage_target}"

  install -dm755 "${pkgdir}/usr/bin"
  printf '%s\n' '#!/bin/sh' 'exec /opt/astra/astra.AppImage --no-sandbox "$@"' > "${pkgdir}/usr/bin/astra"
  chmod 755 "${pkgdir}/usr/bin/astra"

  _desktop_source="$(find "${_appdir}" -type f -iname '*.desktop' | LC_ALL=C sort | head -n 1)"
  if [[ -z "${_desktop_source}" ]]; then
    echo "No desktop file found in extracted AppImage." >&2
    return 1
  fi

  install -dm755 "${pkgdir}/usr/share/applications"
  sed \
    -e 's|^Exec=.*|Exec=astra %U|' \
    -e 's|^TryExec=.*|TryExec=astra|' \
    -e 's|^Icon=.*|Icon=astra|' \
    "${_desktop_source}" > "${_desktop_path}"

  if ! grep -q '^TryExec=' "${_desktop_path}"; then
    sed -i '/^Exec=astra %U$/a TryExec=astra' "${_desktop_path}"
  fi

  if ! grep -q '^Icon=' "${_desktop_path}"; then
    sed -i '/^\[Desktop Entry\]$/a Icon=astra' "${_desktop_path}"
  fi

  if [[ -d "${_appdir}/usr/share/icons/hicolor" ]]; then
    while IFS= read -r -d '' _icon_source; do
      _icon_relative="${_icon_source#${_appdir}/usr/share/icons/hicolor/}"
      _icon_relative="${_icon_relative%/*}"
      _icon_ext="${_icon_source##*.}"
      install -Dm644 \
        "${_icon_source}" \
        "${pkgdir}/usr/share/icons/hicolor/${_icon_relative}/apps/astra.${_icon_ext}"
      _icon_installed=1
    done < <(
      find "${_appdir}/usr/share/icons/hicolor" \
        -type f \
        \( -iname '*.png' -o -iname '*.svg' \) \
        -path '*/apps/*' \
        -print0
    )
  fi

  if (( !_icon_installed )); then
    _root_icon="$(find "${_appdir}" -maxdepth 1 -type f \( -iname '*.png' -o -iname '*.svg' \) | LC_ALL=C sort | head -n 1)"
    if [[ -z "${_root_icon}" ]]; then
      echo "No icon assets found in extracted AppImage." >&2
      return 1
    fi

    _icon_ext="${_root_icon##*.}"
    install -Dm644 \
      "${_root_icon}" \
      "${pkgdir}/usr/share/icons/hicolor/512x512/apps/astra.${_icon_ext}"
  fi
}
