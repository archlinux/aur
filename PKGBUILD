# Maintainer: byrdltd <byrdltd@users.noreply.github.com>

pkgname=whydpi-git
_pkgname=whydpi
pkgver=0.2.0.r0.gb45a5d2
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
backup=()
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  # Produces: <setup.py version>.r<commits since>.g<short sha>
  local ver
  ver=$(python -c "import re,pathlib;print(re.search(r'version=\"([^\"]+)\"', pathlib.Path('setup.py').read_text()).group(1))")
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

  # Python module + console_script
  python -m installer --destdir="${pkgdir}" dist/*.whl

  # Systemd unit (optional; user enables it explicitly)
  install -Dm644 whydpi.service "${pkgdir}/usr/lib/systemd/system/whydpi.service"

  # License & docs
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
