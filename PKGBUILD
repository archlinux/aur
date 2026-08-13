# Maintainer: in6kiar

_pkgname=echoed
pkgname="${_pkgname}-appimage"
pkgver=1.7.8
pkgrel=1
pkgdesc="Lightweight Discord alternative — No Ads, No Tracking, Built on Tauri"
arch=('x86_64')
url="https://echoed.gg"
license=('custom')
depends=('fuse2' 'hicolor-icon-theme')
makedepends=('squashfs-tools')
options=(!strip !debug)
_appimage="${_pkgname}-${pkgver}-amd64.AppImage"
source_x86_64=(
  "${_appimage}::https://software.echoed.gg/v1.7.8/Echoed_1.7.8_amd64.AppImage"
)
noextract=("${_appimage}")
sha256sums_x86_64=('ea42ea59a75eec85ca1f07f4a4d9cd2a0263f09551ddf3787fd885038284257f')

prepare() {
  # Clean old paths
  rm -rf "${srcdir}/squashfs-root"

  # Extract safely inside an isolated network sandbox
  chmod +x "${srcdir}/${_appimage}"
  unshare -n -r "${srcdir}/${_appimage}" --appimage-extract
}

build() {
  local desktop_file
  desktop_file=$(find "${srcdir}/squashfs-root" -maxdepth 2 -name "*.desktop" | head -1)

  if [[ -n "$desktop_file" ]]; then
    # Fix Exec
    sed -i -E "s|Exec=AppRun.*|Exec=/usr/bin/${_pkgname} %U|" "$desktop_file"

    # Set categories
    if grep -q '^Categories=' "$desktop_file"; then
      sed -i -E 's|^Categories=.*|Categories=Network;InstantMessaging;|' "$desktop_file"
    else
      echo "Categories=Network;InstantMessaging;" >> "$desktop_file"
    fi

    sed -i -E "s|^Name=.*|Name=Echoed|" "$desktop_file" || true
  fi

  # Fix permissions
  chmod -R a-x+rX "${srcdir}/squashfs-root/usr" 2>/dev/null || true
}

package() {
  # Install AppImage
  install -Dm755 "${srcdir}/${_appimage}" \
    "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

  # Install wrapper
  install -dm755 "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/${_pkgname}" << 'EOF'
#!/bin/bash
export LD_PRELOAD=/usr/lib/libwayland-client.so${LD_PRELOAD:+:$LD_PRELOAD}
exec /opt/echoed-appimage/echoed-appimage.AppImage "$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/${_pkgname}"

  # Install desktop
  local desktop_file
  desktop_file=$(find "${srcdir}/squashfs-root" -maxdepth 2 -name "*.desktop" | head -1)
  if [[ -n "$desktop_file" ]]; then
    install -Dm644 "$desktop_file" \
      "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  fi

  # Install icons
  if [[ -d "${srcdir}/squashfs-root/usr/share/icons" ]]; then
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
  fi

  # Install license
  install -Dm644 "${srcdir}/squashfs-root/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 2>/dev/null || \
  echo "Custom license. See upstream website." > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
