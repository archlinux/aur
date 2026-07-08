# Maintainer: Stepan Elisev <stepan@elisev.com>
# Contributor: alananisimov (https://github.com/alananisimov)

pkgname=olcbox-bin
pkgver=1.0.111
pkgrel=1
pkgdesc="olcrtc configurator — one-tap tunnel start/stop, saved connection profiles, multiple providers (Jazz, Telemost, WB Stream, Jitsi), VP8 tuning, connectivity checks, TUN/proxy modes (pre-compiled AppImage)"
arch=('x86_64')
url="https://github.com/alananisimov/olcbox"
license=('MIT')
depends=('iproute2')
makedepends=('squashfs-tools')
provides=('olcbox')
conflicts=('olcbox')
source=("${url}/releases/download/nightly/Olcbox-${pkgver}-linux-amd64.AppImage")
sha256sums=('SKIP')

pkgver() {
  curl -sL "https://api.github.com/repos/alananisimov/olcbox/releases/tags/nightly" | \
    python3 -c "
import sys, json, re
data = json.load(sys.stdin)
for asset in data.get('assets', []):
    m = re.search(r'Olcbox-([\\d.]+)-linux-amd64\\.AppImage', asset['name'])
    if m:
        print(m.group(1))
        break
" 2>/dev/null || echo "${pkgver}"
}

prepare() {
  cd "${srcdir}"
  chmod +x "Olcbox-${pkgver}-linux-amd64.AppImage"
  ./"Olcbox-${pkgver}-linux-amd64.AppImage" --appimage-extract
}

package() {
  cd "${srcdir}"

  # Install to /opt/olcbox
  local appdir="${pkgdir}/opt/olcbox"
  mkdir -p "${appdir}"
  cp -r squashfs-root/* "${appdir}/"

  # Wrapper in PATH
  mkdir -p "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/olcbox" << 'WRAPPER'
#!/bin/sh
exec /opt/olcbox/AppRun "$@"
WRAPPER
  chmod +x "${pkgdir}/usr/bin/olcbox"

  # Desktop entry
  mkdir -p "${pkgdir}/usr/share/applications"
  cp "${appdir}/org.olcbox.app.desktopApp.desktop" \
    "${pkgdir}/usr/share/applications/olcbox.desktop"
  sed -i 's|Exec=Olcbox|Exec=olcbox|' \
    "${pkgdir}/usr/share/applications/olcbox.desktop"

  # Icon
  mkdir -p "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
  cp "${appdir}/olcbox.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/olcbox.png"

  # Clean up AppImage artifacts
  rm -f "${appdir}/.DirIcon"
}
