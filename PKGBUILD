# Maintainer: Kanishk Mishra <kanishk.kumar412@example.com>

pkgname=notionsafe
pkgver=0.1.0
pkgrel=6
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
sha256sums=('41620c06ef5714c4a287e0f09ae9c144f69c11c01e7a210a51b124c81d828081')

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
  install -D -m644 notionsafe.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D -m644 assets/logo.png "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.png"
}
