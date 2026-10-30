# Maintainer: enzo <enzojore@live.fr>

pkgname=strata-app-bin
pkgver=0.2.8
pkgrel=2
pkgdesc="Strata Desktop - Local inference engine and GUI for frontier AI models"
arch=('x86_64')
url="https://github.com/Niko1221/Strata"
license=('MIT')
depends=(
  'fuse2'
  'gcc-libs'
  'glibc'
  'hicolor-icon-theme'
  'python312'
  'zlib'
)
optdepends=(
  'cuda: NVIDIA GPU acceleration support'
  'cudnn: Fast tensor execution paths'
)
options=('!strip')
source=(
  "Strata-${pkgver}-${CARCH}.AppImage::https://github.com/Niko1221/Strata/releases/download/v${pkgver}/Strata-${pkgver}-linux-${CARCH}.AppImage"
  "LICENSE-${pkgver}::https://raw.githubusercontent.com/Niko1221/Strata/v${pkgver}/LICENSE"
)
sha256sums=(
  'a042f05dd7a740e0cd8c43cad6d8958152595b16fc3a566c029280a836ad3b6e'
  '949b9b0aada7476006469e58ee4ffb0e0f68c2d9137e90a356757b61a09d37f0'
)

prepare() {
  chmod +x "Strata-${pkgver}-${CARCH}.AppImage"
  # Extract AppImage payload
  ./"Strata-${pkgver}-${CARCH}.AppImage" --appimage-extract
}

package() {
  install -d "${pkgdir}/opt/${pkgname}"
  cp -a squashfs-root/* "${pkgdir}/opt/${pkgname}/"

  # Normalize runtime file permissions
  chmod -R u=rwX,go=rX "${pkgdir}/opt/${pkgname}"
  chmod +x "${pkgdir}/opt/${pkgname}/AppRun"*
  [ -d "${pkgdir}/opt/${pkgname}/apprun-hooks" ] && chmod -R +x "${pkgdir}/opt/${pkgname}/apprun-hooks"

  # Launcher wrapper in /usr/bin
  # Prevent AppImage's internal LD_LIBRARY_PATH and Python variables from breaking system Python 3.12
  install -d "${pkgdir}/usr/bin"
  cat <<'EOF' > "${pkgdir}/usr/bin/strata"
#!/bin/sh
export APPDIR="/opt/strata-app-bin"

# Unset Python environment variables that the AppImage might leak into child processes
unset PYTHONHOME
export PYTHONPATH="/usr/lib/python3.12/site-packages:${PYTHONPATH}"

exec /opt/strata-app-bin/AppRun "$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/strata"
  ln -sf /usr/bin/strata "${pkgdir}/usr/bin/strata-desktop"

  # Desktop integration
  install -d "${pkgdir}/usr/share/applications"
  if [ -f "squashfs-root/Strata.desktop" ]; then
    install -Dm644 squashfs-root/Strata.desktop "${pkgdir}/usr/share/applications/strata.desktop"
    sed -i 's|^Exec=.*|Exec=/usr/bin/strata|' "${pkgdir}/usr/share/applications/strata.desktop"
    sed -i 's|^Icon=.*|Icon=strata|' "${pkgdir}/usr/share/applications/strata.desktop"
  fi

  # Application icon
  install -d "${pkgdir}/usr/share/icons/hicolor"
  if [ -d "squashfs-root/usr/share/icons/hicolor" ]; then
    cp -a squashfs-root/usr/share/icons/hicolor/* "${pkgdir}/usr/share/icons/hicolor/"
  fi
  if [ -f "squashfs-root/Strata.png" ]; then
    install -Dm644 "squashfs-root/Strata.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/strata.png"
  fi

  # License
  install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Clean up empty icon directories created during copy to satisfy packaging linters
  find "${pkgdir}/usr/share/icons" -type d -empty -delete 2>/dev/null || true

  # Directory sanity check for pacman
  find "${pkgdir}/usr/share" -type d -exec chmod 755 {} +
}
