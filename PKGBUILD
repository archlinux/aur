# Maintainer: Kanishk Mishra <kanishk.kumar412@example.com>

pkgname=notionsafe
pkgver=0.1.0
pkgrel=3
pkgdesc="A cross-platform desktop app to backup Notion workspaces locally."
arch=('any')
url="https://github.com/KanishkMishra143/NotionSafe"
license=('MIT')
# List only dependencies that exist in Arch repos
depends=(
    'python-gobject'
    'python-gitpython'
    'python-keyring'
    'python-pyyaml'
    'python-requests'
    'python-psutil'
    'python-rich'
    'python-sqlalchemy'
    'git'
)
# Build tools needed to install from pyproject.toml
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/KanishkMishra143/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('bcf8126b383e49251e1d3fc32836ec87faed994c2518d56b55bd2bdd09cf3077')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # Create a wheel from the pyproject.toml
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # Use python-installer to place the wheel and its dependencies from pyproject.toml into the package
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Install desktop file and icon
  install -D -m644 notionsafe.desktop "${pkgdir}/usr/share/applications/notionsafe.desktop"
  install -D -m644 assets/logo.png "${pkgdir}/usr/share/icons/hicolor/scalable/apps/notionsafe.png"
}
