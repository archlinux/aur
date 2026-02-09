# Maintainer: Rolf Greger <Rolf_greger@web.de>
pkgname=cachyos-service-manager
pkgver=0.1.0
pkgrel=1
pkgdesc="Full-featured systemd service manager for CachyOS (Qt6 + GTK4 frontends)"
arch=('any')
url="https://github.com/Goitonthefloor/cachyos-service-manager"
license=('MIT')
depends=(
  'python>=3.10'
  'python-psutil'
  'python-gobject'
  'qt6-base'
  'qt6-svg'
  'python-pyqt6'
  'gtk4'
  'libadwaita'
  'systemd'
)
optdepends=(
  'polkit: for privilege escalation'
  'python-pytest: for running tests'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('ad38fae376a17960212a61cc96567899433e49b3f219b4bcc759b0ebd7efcd2f')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install Python package
  python -m installer --destdir="$pkgdir" dist/*.whl 2>/dev/null || {
    python setup.py install --root="$pkgdir" --optimize=1 || \
    pip install --no-deps --root="$pkgdir" .
  }

  # Install desktop entries
  install -Dm644 packaging/cachyos-service-manager-qt.desktop \
    "${pkgdir}/usr/share/applications/cachyos-service-manager-qt.desktop"
  install -Dm644 packaging/cachyos-service-manager-gtk.desktop \
    "${pkgdir}/usr/share/applications/cachyos-service-manager-gtk.desktop"

  # Install icon
  install -Dm644 packaging/cachyos-service-manager.png \
    "${pkgdir}/usr/share/pixmaps/cachyos-service-manager.png"

  # Install license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install documentation
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 ARCHITECTURE.md "${pkgdir}/usr/share/doc/${pkgname}/ARCHITECTURE.md"
}
