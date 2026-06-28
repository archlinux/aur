# Maintainer: byrdltd <byrdltd@users.noreply.github.com>

pkgname=whydpi
pkgver=1.0.1
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
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('77fe14591f06f84655b49973ba44538fe3d90ac0fb8762aaf78039eae3cd8f02')

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

  # Desktop entry (app menu) and autostart copy (login).  Same file,
  # installed twice because XDG semantics differentiate visibility by
  # location: /usr/share/applications for "I want to launch this", and
  # /etc/xdg/autostart for "session manager, please start this for me".
  install -Dm644 packaging/desktop/whydpi-tray.desktop \
    "${pkgdir}/usr/share/applications/whydpi-tray.desktop"
  install -Dm644 packaging/desktop/whydpi-tray.desktop \
    "${pkgdir}/etc/xdg/autostart/whydpi-tray.desktop"

  # Hicolor icon theme entries — Icon=whydpi in the .desktop resolves
  # to whichever size the current panel asks for.
  for sz in 16 32 48 64 128 256 512; do
    install -Dm644 "assets/icon-${sz}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${sz}x${sz}/apps/whydpi.png"
  done
}
