# Maintainer: Pol Rivero <aur at polrivero dot com>
# Contributor: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: aulonsal <seraur at aulonsal dot com>
pkgname=dbgate-premium-bin
_pkgname=dbgate-premium
pkgver=6.7.3
_electron_version=38
pkgrel=1
pkgdesc="Database manager for MySQL, PostgreSQL, SQL Server, MongoDB, SQLite and others. Premium edition (proprietary). (Uses system-wide Electron)"
arch=('x86_64')
url="https://github.com/dbgate/dbgate"
license=('MIT')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
depends=("electron${_electron_version}")
_appimage_file_name="${_pkgname}-${pkgver}.AppImage"
source=(
  "${_appimage_file_name}::${url}/releases/download/v${pkgver}/dbgate-premium-latest.AppImage"
  "LICENSE-${pkgver}::https://raw.githubusercontent.com/dbgate/dbgate/v${pkgver}/LICENSE"
  "${_pkgname}.sh"
)

sha256sums=('836c0c01af418253508e3ddd0cd66e564b168e473e118e91a0a9d7aa8ebd9db1'
            'SKIP'
            '5a5efc7622eff23064bb00809b9549df58e48ba9dec6c56ca6a735ea57bb18d7')

prepare() {
  # Prepare launcher script for system Electron
  sed -i -e "
    s/@electronversion@/${_electron_version}/g
    s/@appname@/${_pkgname}/g
    s/@runname@/app.asar/g
    s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
  " "${srcdir}/${_pkgname}.sh"

  # Extract AppImage contents
  chmod +x "${srcdir}/${_appimage_file_name}"
  "${srcdir}/${_appimage_file_name}" --appimage-extract

  # Find asar payload
  _asar="$(find "${srcdir}/squashfs-root" -type f -name 'app.asar' | head -n1)"
  if [[ -z "${_asar}" ]]; then
    echo "app.asar not found in AppImage" >&2
    exit 1
  fi

  mkdir -p "${srcdir}/opt/${_pkgname}/resources"
  cp -f "${_asar}" "${srcdir}/opt/${_pkgname}/resources/app.asar"
  if [[ -d "$(dirname "${_asar}")/app.asar.unpacked" ]]; then
    cp -a "$(dirname "${_asar}")/app.asar.unpacked" "${srcdir}/opt/${_pkgname}/resources/"
  fi

  # Cleanup windows/macos files, fix directory permissions
  if [[ -d "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked" ]]; then
    find "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked" -type f \
      \( -name "*darwin*" -o -name "*win32*" \) -exec rm -f {} +
    find "${srcdir}/opt/${_pkgname}/resources" -type d -exec chmod 755 {} +
  fi

  # Desktop entry: prefer one from AppImage, else create minimal one
  _desktop_src="$(find "${srcdir}/squashfs-root" -maxdepth 2 -type f -name '*.desktop' | head -n1)"
  if [[ -n "${_desktop_src}" ]]; then
    cp -f "${_desktop_src}" "${srcdir}/${_pkgname}.desktop"
  else
    cat > "${srcdir}/${_pkgname}.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=DbGate Premium
Exec=${_pkgname} %U
Icon=${_pkgname}
Categories=Development;Database;
Terminal=false
EOF
  fi
  # Normalize Exec/Icon/WMClass to the packaged names
  sed -i -e "s|^Exec=.*|Exec=${_pkgname} %U|g" \
         -e "s|^Icon=.*|Icon=${_pkgname}|g" \
         -e "s|^StartupWMClass=.*|StartupWMClass=${_pkgname}|g" \
         "${srcdir}/${_pkgname}.desktop"

  # Icons: copy hicolor set if present; else fall back to .DirIcon
  rm -rf "${srcdir}/icons"
  _copied_icons=0
  if [[ -d "${srcdir}/squashfs-root/usr/share/icons/hicolor" ]]; then
    mkdir -p "${srcdir}/icons"
    cp -a "${srcdir}/squashfs-root/usr/share/icons/hicolor" "${srcdir}/icons/"
    # Ensure icon file name matches desktop Icon= entry
    for p in $(find "${srcdir}/icons/hicolor" -type f -name '*.png'); do
      b="$(basename "$p")"
      [[ "$b" != "${_pkgname}.png" ]] && mv "$p" "$(dirname "$p")/${_pkgname}.png" || true
      _copied_icons=1
    done
  fi
  if [[ $_copied_icons -eq 0 && -f "${srcdir}/squashfs-root/.DirIcon" ]]; then
    mkdir -p "${srcdir}/icons/hicolor/256x256/apps"
    install -m644 "${srcdir}/squashfs-root/.DirIcon" \
      "${srcdir}/icons/hicolor/256x256/apps/${_pkgname}.png"
  fi
}

package() {
  # Launcher
  install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"

  # App resources for system Electron
  install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" \
    -t "${pkgdir}/usr/lib/${_pkgname}"
  if [[ -d "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked" ]]; then
    cp -Pr --no-preserve=ownership \
      "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked" \
      "${pkgdir}/usr/lib/${_pkgname}"
  fi

  # Icons (copy whatever sizes we found)
  if [[ -d "${srcdir}/icons/hicolor" ]]; then
    while IFS= read -r -d '' iconfile; do
      rel="${iconfile#${srcdir}/icons/}"
      install -Dm644 "${iconfile}" "${pkgdir}/usr/share/icons/${rel}"
    done < <(find "${srcdir}/icons/hicolor" -type f -name '*.png' -print0)
  fi

  # Desktop entry
  install -Dm644 "${srcdir}/${_pkgname}.desktop" \
    -t "${pkgdir}/usr/share/applications"

  # License
  install -Dm644 "${srcdir}/LICENSE-${pkgver}" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
