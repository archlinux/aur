# Maintainer: byrdltd <byrdltd@users.noreply.github.com>

pkgname=whydpi-git
_pkgname=whydpi
pkgver=1.2.1.r10.g36e83b0
pkgrel=1
pkgdesc="Adaptive, per-SNI DPI bypass that learns optimal TLS fragmentation per host (git, main branch)"
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
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
install="${pkgname}.install"
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  # Produces: <pyproject.toml version>.r<commits since>.g<short sha>
  local ver
  ver=$(python -c "import re,pathlib;print(re.search(r'^version\s*=\s*\"([^\"]+)\"', pathlib.Path('pyproject.toml').read_text(), re.M).group(1))")
  printf '%s.r%s.g%s' \
    "${ver}" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}"

  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 whydpi.service "${pkgdir}/usr/lib/systemd/system/whydpi.service"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  # Application-menu launcher; post_install opens the first-run dialog.
  install -Dm644 packaging/desktop/whydpi-tray.desktop \
    "${pkgdir}/usr/share/applications/whydpi-tray.desktop"
  install -Dm755 packaging/linux/first-run-launch.sh \
    "${pkgdir}/usr/lib/whydpi/first-run-launch.sh"

  for sz in 16 32 48 64 128 256 512; do
    install -Dm644 "assets/icon-${sz}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${sz}x${sz}/apps/whydpi.png"
  done
}
