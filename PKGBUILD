pkgname=orbitopl-toolbox-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="OrbitOPL Toolbox - PS2 OPL management GUI (prebuilt binary)"
arch=('x86_64')
url="https://github.com/Luden02/OrbitOPL-Toolbox"
license=('custom:unknown')
depends=(
  'glibc'
  'gtk3'
  'nss'
  'libxss'
  'alsa-lib'
  'libxkbcommon'
  'libsecret'
  'libnotify'
  'dbus'
  'at-spi2-core'
)

optdepends=(
  'libappindicator-gtk3: tray support'
)

provides=('orbitopl-toolbox')
conflicts=(
  'orbitopl-toolbox'
  'orbitopl-toolbox-git'
)

source=(
  "${pkgname}-${pkgver}.zip::https://github.com/Luden02/OrbitOPL-Toolbox/releases/download/v${pkgver}/orbitopl-toolbox-${pkgver}_linux.zip"
)

sha256sums=('34ed810c1fad38e300c9eea5c4a17a681bdc84d9c5a8a621647a5eb7139e15aa')

package() {
  install -dm755 "${pkgdir}/opt/orbitopl-toolbox"

  # Extracted files → /opt
  cp -a "${srcdir}/." "${pkgdir}/opt/orbitopl-toolbox/"

  # Ensure main binary is executable
  chmod +x "${pkgdir}/opt/orbitopl-toolbox/orbitopl-toolbox" || true

  # Launcher
  install -dm755 "${pkgdir}/usr/bin"
  ln -sf "/opt/orbitopl-toolbox/orbitopl-toolbox" \
    "${pkgdir}/usr/bin/orbitopl-toolbox"

  # Desktop entry (if present in zip)
  if [[ -f "${pkgdir}/opt/orbitopl-toolbox/orbitopl-toolbox.desktop" ]]; then
    install -Dm644 \
      "${pkgdir}/opt/orbitopl-toolbox/orbitopl-toolbox.desktop" \
      "${pkgdir}/usr/share/applications/orbitopl-toolbox.desktop"
  fi

  # Icon handling (if present)
  if [[ -f "${pkgdir}/opt/orbitopl-toolbox/icon.png" ]]; then
    install -Dm644 \
      "${pkgdir}/opt/orbitopl-toolbox/icon.png" \
      "${pkgdir}/usr/share/pixmaps/orbitopl-toolbox.png"
  fi
}
