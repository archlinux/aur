pkgname=cutrail-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='Desktop video clipping utility for batch range exports'
arch=('x86_64')
url='https://github.com/sabinmarcu/cutrail'
license=('MIT')
makedepends=('squashfs-tools')
depends=('fuse2' 'glibc' 'gtk3' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'libdrm' 'alsa-lib')
optdepends=('ffmpeg: fallback ffmpeg binary for diagnostics and overrides')
provides=('cutrail')
conflicts=('cutrail' 'cutrail-git')
source_x86_64=("cutrail-${pkgver}.AppImage::https://github.com/sabinmarcu/cutrail/releases/download/v${pkgver}/Cutrail-${pkgver}.AppImage")
sha256sums_x86_64=('SKIP')

package() {
  local appimage_path
  appimage_path="${srcdir}/cutrail-${pkgver}.AppImage"

  install -d "${pkgdir}/opt/${pkgname}"
  install -Dm755 "${appimage_path}" "${pkgdir}/opt/${pkgname}/cutrail.AppImage"

  local extract_dir
  extract_dir="${srcdir}/squashfs-root"
  rm -rf "${extract_dir}"

  # Electron Builder emits Type-2 AppImage files where the SquashFS payload
  # starts at a runtime-reported offset instead of byte 0.
  chmod +x "${appimage_path}"

  local appimage_offset
  appimage_offset="$("${appimage_path}" --appimage-offset)"

  if [[ -z "${appimage_offset}" ]]; then
    echo "Unable to determine AppImage payload offset for extraction."
    exit 1
  fi

  unsquashfs -f -o "${appimage_offset}" -d "${extract_dir}" "${appimage_path}"

  local icon_source
  for candidate in \
    "${extract_dir}/.DirIcon" \
    "${extract_dir}/cutrail.png" \
    "${extract_dir}/usr/share/icons/hicolor/512x512/apps/cutrail.png" \
    "${extract_dir}/usr/share/icons/hicolor/256x256/apps/cutrail.png"; do
    if [[ -f "${candidate}" ]]; then
      icon_source="${candidate}"
      break
    fi
  done

  if [[ -z "${icon_source}" ]]; then
    echo "Unable to locate Cutrail icon in extracted AppImage payload."
    exit 1
  fi

  install -Dm644 "${icon_source}" "${pkgdir}/usr/share/pixmaps/cutrail.png"

  install -d "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/cutrail" <<'EOF'
#!/usr/bin/env sh
exec /opt/cutrail-bin/cutrail.AppImage "$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/cutrail"

  install -d "${pkgdir}/usr/share/applications"
  cat > "${pkgdir}/usr/share/applications/cutrail.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Cutrail
Comment=Desktop video clipping utility for batch range exports
Exec=cutrail %U
Icon=cutrail
Terminal=false
Categories=AudioVideo;Video;
EOF
}
