# hydracad-bin – Hydra CAD (AppImage, no compile)
# Alternative to hydracad: uses upstream AppImage when native ELF build is unavailable or broken.
# Install: copy to PKGBUILD in AUR repo hydracad-bin, or use aur-upload script.
# provides=hydracad, conflicts=hydracad.

pkgname=hydracad-bin
pkgver=3.0.22
pkgrel=1
pkgdesc="Professional CAD application (C++/Qt6) – AppImage build"
arch=('x86_64')
url="https://github.com/drixber/CAD"
license=('custom')
depends=('fuse2')
optdepends=('qt6-network: in-app updates')
provides=('hydracad')
conflicts=('hydracad')

source=("HydraCAD-${pkgver}.AppImage::https://github.com/drixber/CAD/releases/download/v${pkgver}/HydraCAD-${pkgver}.AppImage")
sha256sums=('SKIP')

# No build step – AppImage is the executable.
prepare() {
  chmod +x "${srcdir}/HydraCAD-${pkgver}.AppImage"
}

package() {
  install -Dm755 "${srcdir}/HydraCAD-${pkgver}.AppImage" "${pkgdir}/usr/lib/hydracad/HydraCAD.AppImage"
  printf '%s\n' \
    '#!/bin/sh' \
    'if [ -z "$QT_QPA_PLATFORM" ] && [ -n "$WAYLAND_DISPLAY" ]; then' \
    '  export QT_QPA_PLATFORM=xcb' \
    'fi' \
    'exec /usr/lib/hydracad/HydraCAD.AppImage "$@"' |
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/hydracad"
  ln -s hydracad "${pkgdir}/usr/bin/cad_desktop"
  printf '%s\n' "Hydra CAD – AppImage. See https://github.com/drixber/CAD for license." |
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
