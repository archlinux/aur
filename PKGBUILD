# Maintainer: CastSound Team <ci@castsound.app>
pkgname=castsound-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="Stream audio between computer and phone"
arch=('x86_64' 'aarch64')
url="https://castsound.app"
license=('custom')
depends=('alsa-lib' 'libpulse' 'pipewire')
optdepends=('pipewire-pulse: PulseAudio compatibility via PipeWire')
source=('.managed_by_aur')
sha256sums=('e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855')
source_x86_64=("CastSound-0.1.2-linux-x86_64.tar.gz::https://github.com/CastSound/CastSound-Desktop/releases/download/v${pkgver}/CastSound-0.1.2-linux-x86_64.tar.gz")
source_aarch64=("CastSound-0.1.2-linux-aarch64.tar.gz::https://github.com/CastSound/CastSound-Desktop/releases/download/v${pkgver}/CastSound-0.1.2-linux-aarch64.tar.gz")
sha256sums_x86_64=('291a666c8ac51c18091121a422cf802e9dadba62ea6beb919e83eeb3c68dba4e')
sha256sums_aarch64=('9ffe1647790ccd6bc197b9e729394cc39d03c86351994f27b474a2dc508d5b12')

package() {
  cd "${srcdir}"

  install -Dm755 castsound "${pkgdir}/usr/bin/castsound"

  # The release archive is expected to ship the desktop entry as
  # com.devculi.castsound.desktop (Task 1.2). Fall back to the legacy name
  # castsound.desktop for local testing before that rename lands.
  if [[ -f com.devculi.castsound.desktop ]]; then
    install -Dm644 com.devculi.castsound.desktop \
      "${pkgdir}/usr/share/applications/com.devculi.castsound.desktop"
  elif [[ -f castsound.desktop ]]; then
    install -Dm644 castsound.desktop \
      "${pkgdir}/usr/share/applications/com.devculi.castsound.desktop"
  fi

  for size in 16 32 48 64 128 256 512; do
    if [[ -f icon-${size}.png ]]; then
      install -Dm644 "icon-${size}.png" \
        "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/com.devculi.castsound.png"
    fi
  done

  # LICENSE must be provided by the product owner (see
  # docs/plans/desktop-distribution-manual-steps.md). The build fails here
  # intentionally if it is missing, so the package is not published without it.
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Marker used by the desktop app to detect the AUR channel and disable the
  # built-in self-updater.
  install -Dm644 .managed_by_aur "${pkgdir}/usr/share/${pkgname}/.managed_by_aur"
}
