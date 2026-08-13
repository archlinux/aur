# Maintainer: Kaylin Aurora <kaylin@cmdly.dev>
pkgname=aria-fm-bin
pkgver=0.6.6
pkgrel=1
pkgdesc="Native Spotify desktop client — Go + Electron (Chromium) + librespot, FFI-first transport"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/cmdly/aria.fm"
license=('MIT')
# Runtime libs the bundled Electron/Chromium shell dlopens. Electron ships its
# own Chromium, so we no longer depend on gtk4/webkitgtk-6.0/libsoup3 (the
# WebKitGTK webview was the 60fps-capped path we migrated off). The Go sidecar
# (build/bin/aria-server, shipped under the app's resources/) embeds the
# librespot cdylib and the frontend.
#
# alsa-lib is a runtime dependency by two independent routes: the bundled
# Chromium links libasound.so.2 directly (objdump -p aria-shell | grep NEEDED),
# and the cgo-free Go sidecar dlopens it through purego for audio output
# (internal/audio/backend_alsa_linux.go). PipeWire/PulseAudio users still need
# it — their ALSA plugins live behind the same libasound.
#
# openssl is NOT a dependency any more: librespot-ffi moved from native-tls to
# rustls, so the cdylib links no libssl/libcrypto (verified via objdump -p
# NEEDED). Trust roots are read from the system store, which is ca-certificates
# on Arch — already pulled in by the base system.
depends=('gtk3' 'nss' 'alsa-lib' 'libnotify' 'at-spi2-core' 'libxss' 'hicolor-icon-theme')
provides=('aria.fm')
conflicts=('aria.fm')
# The app dir ships prebuilt Electron binaries + the stripped Go sidecar.
options=('!strip')
# Per-arch prebuilt tarballs. Arch's $CARCH spellings (x86_64/aarch64) are
# exactly the ones the release assets use, so the arch appears in the URL and
# in the extracted directory name with no mapping table.
#
# The download is renamed per arch: both tarballs would otherwise land in
# makepkg's shared SRCDEST under one name, and a cached x86_64 tarball would be
# reused for an aarch64 build (and vice versa) — a wrong-arch package that only
# fails when the user runs it.
source_x86_64=("aria-fm-${pkgver}-x86_64.tar.gz::https://gitlab.com/api/v4/projects/cmdly%2Faria.fm/packages/generic/aria-fm/v${pkgver}/aria-fm-v${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("aria-fm-${pkgver}-aarch64.tar.gz::https://gitlab.com/api/v4/projects/cmdly%2Faria.fm/packages/generic/aria-fm/v${pkgver}/aria-fm-v${pkgver}-linux-aarch64.tar.gz")
sha256sums_x86_64=('09f3ddc332830786a8eb60a179e530085d03c9b40ef2e659fe1536e9f13fc0a1')
# Both sums are written by scripts/bump-aur.sh from the PUBLISHED tarballs, not
# from a local build — the bytes users fetch are the bytes that must be pinned.
# Never 'SKIP' here: that disables verification entirely, so a truncated or
# wrong-arch download would build silently. A stale hash fails loudly instead.
sha256sums_aarch64=('0bf8a565974566d1f0dc485c128158ffef9418a6be3b546912ee273fce64b1e6')

package() {
  cd "${srcdir}/aria-fm-v${pkgver}-linux-${CARCH}"

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
