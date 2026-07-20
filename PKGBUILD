# Maintainer: Kaylin Aurora <kaylin@cmdly.dev>
pkgname=aria-fm-bin
pkgver=0.6.4
pkgrel=1
pkgdesc="Native Spotify desktop client — Go + Electron (Chromium) + librespot, FFI-first transport"
arch=('x86_64')
url="https://gitlab.com/cmdly/aria.fm"
license=('MIT')
# Runtime libs the bundled Electron/Chromium shell dlopens. Electron ships its
# own Chromium, so we no longer depend on gtk4/webkitgtk-6.0/libsoup3 (the
# WebKitGTK webview was the 60fps-capped path we migrated off). The Go sidecar
# (build/bin/aria-server, shipped under the app's resources/) embeds the
# librespot cdylib and the frontend, and links oto (alsa-lib) + librespot's
# openssl-sys (openssl).
depends=('gtk3' 'nss' 'alsa-lib' 'openssl' 'libnotify' 'at-spi2-core' 'libxss' 'hicolor-icon-theme')
provides=('aria.fm')
conflicts=('aria.fm')
# The app dir ships prebuilt Electron binaries + the stripped Go sidecar.
options=('!strip')
source=("aria-fm-${pkgver}.tar.gz::https://gitlab.com/api/v4/projects/cmdly%2Faria.fm/packages/generic/aria-fm/v${pkgver}/aria-fm-v${pkgver}-linux-x86_64.tar.gz")
sha256sums=('cc8f46fab05c722b7ff783d7dc7f0be83b490df69f8c0dd761b4ba72c9de14af')

package() {
  cd "${srcdir}/aria-fm-v${pkgver}-linux-x86_64"

  # Install the whole Electron app (shell binary + Chromium runtime + the
  # aria-server sidecar under resources/) into /opt.
  install -d "${pkgdir}/opt/aria.fm"
  cp -r ./* "${pkgdir}/opt/aria.fm/"
  # Desktop file and icon are installed separately below; don't double-ship.
  rm -f "${pkgdir}/opt/aria.fm/aria.desktop" "${pkgdir}/opt/aria.fm/aria.png" \
        "${pkgdir}/opt/aria.fm/LICENSE"
  # chrome-sandbox must be setuid root for Electron's sandbox.
  chmod 4755 "${pkgdir}/opt/aria.fm/chrome-sandbox"

  # Launcher on PATH.
  install -d "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/aria" <<'LAUNCHER'
#!/bin/sh
exec /opt/aria.fm/aria-shell "$@"
LAUNCHER
  chmod 755 "${pkgdir}/usr/bin/aria"

  install -Dm644 aria.desktop "${pkgdir}/usr/share/applications/aria.desktop"
  # Icon under the name the desktop file references (Icon=aria).
  install -Dm644 aria.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/aria.png"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
