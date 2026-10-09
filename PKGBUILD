# Maintainer: Twooey Rhone twooey@rhone.dev	

pkgname=quiver-launcher-bin
pkgver=3.5.0
pkgrel=1
pkgdesc='Launcher for downloading, installing, and running apps from GitHub and GitLab releases (prebuilt AppImage)'
arch=('x86_64')
url='https://github.com/tgeorgiadis/quiver-launcher'
license=('MIT')
depends=('fuse2')
optdepends=(
  'flatpak: install and manage direct Flatpak release bundles'
  'wine: run Windows applications managed by Quiver'
  'steam: Steam/Proton integration and shortcuts'
)
provides=('quiver-launcher')
conflicts=('quiver-launcher')
options=('!strip')
source=(
  "${pkgname}-${pkgver}.AppImage::https://github.com/tgeorgiadis/quiver-launcher/releases/download/v${pkgver}/QuiverLauncher-linux-x64.AppImage"
  "LICENSE-${pkgver}::https://raw.githubusercontent.com/tgeorgiadis/quiver-launcher/v${pkgver}/LICENSE"
)
sha256sums=(
  '8dfe4aa1b0da8e85df229cf177b654d59eaa87965d121d9ac062b54d2a1bc3d0'
  '59cfef4bce249fc3db346fd32d90963719a27c7ffbfa38e42af00496c9b138dc'
)

prepare() {
  chmod +x "${srcdir}/${pkgname}-${pkgver}.AppImage"

  cd "${srcdir}"
  rm -rf squashfs-root
  "./${pkgname}-${pkgver}.AppImage" --appimage-extract >/dev/null
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" \
    "${pkgdir}/opt/quiver-launcher/QuiverLauncher.AppImage"

  install -Dm644 "${srcdir}/LICENSE-${pkgver}" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -dm755 "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/quiver-launcher" <<'WRAPPER'
#!/bin/sh
# Package updates are handled by pacman/AUR helpers, not Quiver's self-updater.
export QuiverLauncher_SKIP_UPDATES=1
exec /opt/quiver-launcher/QuiverLauncher.AppImage "$@"
WRAPPER
  chmod 755 "${pkgdir}/usr/bin/quiver-launcher"

  install -dm755 "${pkgdir}/usr/share/applications"
  cat > "${pkgdir}/usr/share/applications/quiver-launcher.desktop" <<'DESKTOP'
[Desktop Entry]
Type=Application
Name=Quiver Launcher
Comment=Download, install, and run apps from GitHub and GitLab releases
Exec=quiver-launcher
Icon=quiver-launcher
Terminal=false
Categories=Game;Utility;
StartupNotify=true
DESKTOP

  install -Dm644 "${srcdir}/squashfs-root/.DirIcon" "${pkgdir}/usr/share/pixmaps/quiver-launcher.png"
}
