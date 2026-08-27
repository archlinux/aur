# Maintainer: byrdltd <byrdltd@users.noreply.github.com>

pkgname=whydpi
pkgver=1.2.0
pkgrel=1
pkgdesc="Adaptive, per-SNI DPI bypass that learns optimal TLS fragmentation per host"
arch=('any')
url="https://github.com/byrdltd/whyDPI"
license=('MIT')
depends=(
  'python>=3.10'
  'iptables'
)
optdepends=(
  'systemd: run whydpi as a service at boot'
  'python-pystray: system-tray icon with Start/Stop/status from the desktop'
  'python-pillow: icon rendering for the tray'
  'libnotify: desktop toasts on tray startup and state change'
  'tk: first-run acceptable-use dialog'
  'zenity: native first-run dialog'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
conflicts=("${pkgname}-git")
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('54ceca9b05addb6d3589c2bc9a7cefb6543d5f0f1d235a15a55d5fe5e2b9a109')

build() {
  cd "whyDPI-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "whyDPI-${pkgver}"

  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 whydpi.service "${pkgdir}/usr/lib/systemd/system/whydpi.service"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  # Application-menu launcher.  Login autostart stays opt-in from the
  # tray.  first-run-launch.sh is invoked by the .install hook so the
  # acceptable-use dialog appears immediately after pacman finishes.
  install -Dm644 packaging/desktop/whydpi-tray.desktop \
    "${pkgdir}/usr/share/applications/whydpi-tray.desktop"
  install -Dm755 packaging/linux/first-run-launch.sh \
    "${pkgdir}/usr/lib/whydpi/first-run-launch.sh"

  # Hicolor icon theme entries — Icon=whydpi in the .desktop resolves
  # to whichever size the current panel asks for.
  for sz in 16 32 48 64 128 256 512; do
    install -Dm644 "assets/icon-${sz}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${sz}x${sz}/apps/whydpi.png"
  done
}
