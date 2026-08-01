# Maintainer: in6kiar

_pkgname=echoed
pkgname="${_pkgname}-appimage"
pkgver=1.7.4
pkgrel=1
pkgdesc="Lightweight Discord alternative — No Ads, No Tracking, Built on Tauri"
arch=('x86_64')
url="https://echoed.gg"
license=('custom')
depends=('fuse2' 'hicolor-icon-theme')
options=(!strip !debug)
_appimage="${_pkgname}-${pkgver}-amd64.AppImage"
source_x86_64=(
  "${_appimage}::https://software.echoed.gg/v${pkgver}/Echoed_${pkgver}_amd64.AppImage"
)
noextract=("${_appimage}")
sha256sums_x86_64=('562ff69fd033d6e777eeaba5a0407b558b08e39d28ff5b22c8c5dc6cffc6e2cd')

prepare() {
  chmod +x "${_appimage}"
  ./"${_appimage}" --appimage-extract
}

build() {
  local desktop_file
  desktop_file=$(find squashfs-root -maxdepth 2 -name "*.desktop" | head -1)

  if [[ -n "$desktop_file" ]]; then
    sed -i -E "s|Exec=AppRun.*|Exec=env LD_PRELOAD=/usr/lib/libwayland-client.so DESKTOPINTEGRATION=0 APPIMAGELAUNCHER_DISABLE=1 /usr/bin/${_pkgname}|" \
      "$desktop_file"
  fi

  chmod -R a-x+rX squashfs-root/usr 2>/dev/null || true
}

package() {
  # Ставим сам AppImage
  install -Dm755 "${srcdir}/${_appimage}" \
    "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

  # Обёртка с LD_PRELOAD
  install -dm755 "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/${_pkgname}" << 'EOF'
#!/bin/bash
export LD_PRELOAD=/usr/lib/libwayland-client.so
exec /opt/echoed-appimage/echoed-appimage.AppImage "$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/${_pkgname}"

  # Desktop-файл
  local desktop_file
  desktop_file=$(find "${srcdir}/squashfs-root" -maxdepth 2 -name "*.desktop" | head -1)

  if [[ -n "$desktop_file" ]]; then
    install -Dm644 "$desktop_file" \
      "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  fi

  # Иконки
  if [[ -d "${srcdir}/squashfs-root/usr/share/icons" ]]; then
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
  fi
}
