# Maintainer: Shinda <shinda@archperf.app>
pkgname=archperf-pro
pkgver=7.1.0
pkgrel=1
pkgdesc="Pro-Grade Arch Linux System Optimization Suite with Auto Performance AI"
arch=('x86_64')
url="https://archperf.app"
license=('MIT')
depends=('electron' 'polkit')
makedepends=('npm' 'appimagekit')
source=("archperf-pro-${pkgver}.AppImage::https://github.com/theyonecodes/archperf-pro/releases/download/v${pkgver}/ArchPerf%20Pro-${pkgver}.AppImage"
        'setup'
        'archperf-pro.desktop')
sha256sums=('SKIP' 'SKIP' 'SKIP')

package() {
  install -dm755 "${pkgdir}/usr/share/archperf"
  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/usr/share/applications"
  install -dm755 "${pkgdir}/usr/share/polkit-1/actions"
  install -dm755 "${pkgdir}/usr/share/icons/hicolor/scalable/apps"

  install -m755 "${srcdir}/ArchPerf Pro-${pkgver}.AppImage" "${pkgdir}/usr/share/archperf/"
  install -m755 "${srcdir}/setup" "${pkgdir}/usr/share/archperf/"
  install -m644 "${srcdir}/archperf-pro.desktop" "${pkgdir}/usr/share/applications/"

  cat > "${pkgdir}/usr/bin/archperf-pro" << 'EOF'
#!/usr/bin/env bash
exec /usr/share/archperf/"ArchPerf Pro-${pkgver}.AppImage" --disable-gpu --no-sandbox "$@"
EOF
  chmod +x "${pkgdir}/usr/bin/archperf-pro"

  ln -sf /usr/share/archperf/icon.png "${pkgdir}/usr/share/icons/hicolor/scalable/apps/archperf.png 2>/dev/null || true
}