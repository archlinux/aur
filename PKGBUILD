# Maintainer: byrdltd <byrdltd@users.noreply.github.com>

pkgname=whydpi
pkgver=1.2.1
pkgrel=2
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
sha256sums=('b1c3f7a454bfe5298071fa8ea378968610b890b76d0e351ae2cc3e0848fe71ad')

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
