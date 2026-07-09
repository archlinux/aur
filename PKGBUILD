# Maintainer: Kaylin Aurora <kaylin@cmdly.dev>
pkgname=aria-fm-bin
pkgver=0.5.2
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
depends=('gtk3' 'nss' 'alsa-lib' 'openssl' 'libnotify' 'at-spi2-core' 'libxss')
provides=('aria.fm')
conflicts=('aria.fm')
# The app dir ships prebuilt Electron binaries + the stripped Go sidecar.
options=('!strip')
source=("aria-${pkgver}.tar.gz::https://gitlab.com/api/v4/projects/cmdly%2Faria.fm/packages/generic/aria/v${pkgver}/aria-v${pkgver}-linux-x86_64.tar.gz")
sha256sums=('63f7e1fd468613f70776b8d9db8de2cb0a8882c3ef56c32ccfdc2c4329ef257b')

package() {
  cd "${srcdir}/aria-v${pkgver}-linux-x86_64"

  # Install the whole Electron app (shell binary + Chromium runtime + the
  # aria-server sidecar under resources/) into /opt.
  install -d "${pkgdir}/opt/aria.fm"
  cp -r ./* "${pkgdir}/opt/aria.fm/"
  # The desktop file is installed separately below; don't double-ship it.
  rm -f "${pkgdir}/opt/aria.fm/aria.desktop" "${pkgdir}/opt/aria.fm/LICENSE"
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
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
