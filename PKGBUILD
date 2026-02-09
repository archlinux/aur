# Maintainer: Rolf Greger <Rolf_greger@web.de>
pkgname=cachyos-service-manager
pkgver=0.2.1
pkgrel=1
sha256sums=('cb964155bb83b70b7cd5def4fafed394e32317457db0c2d1af891c2b10d387ef')

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

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install main Python files
  install -dm755 "${pkgdir}/usr/lib/${pkgname}"
  cp -r src/* "${pkgdir}/usr/lib/${pkgname}/"
  cp -r config "${pkgdir}/usr/lib/${pkgname}/"
  
  # Install main application launchers
  install -Dm755 full_service_manager_plasma.py "${pkgdir}/usr/lib/${pkgname}/"
  install -Dm755 full_service_manager_gtk.py "${pkgdir}/usr/lib/${pkgname}/"

  # Create launcher scripts
  install -dm755 "${pkgdir}/usr/bin"
  
  cat > "${pkgdir}/usr/bin/cachyos-service-manager-qt" <<'EOF'
#!/bin/bash
cd /usr/lib/cachyos-service-manager
exec python full_service_manager_plasma.py "$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/cachyos-service-manager-qt"

  cat > "${pkgdir}/usr/bin/cachyos-service-manager-gtk" <<'EOF'
#!/bin/bash
cd /usr/lib/cachyos-service-manager
exec python full_service_manager_gtk.py "$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/cachyos-service-manager-gtk"

  # Install desktop entries
  install -Dm644 packaging/cachyos-service-manager-qt.desktop \
    "${pkgdir}/usr/share/applications/cachyos-service-manager-qt.desktop"
  install -Dm644 packaging/cachyos-service-manager-gtk.desktop \
    "${pkgdir}/usr/share/applications/cachyos-service-manager-gtk.desktop"

  # Update Exec paths in desktop files
  sed -i 's|python -m cachy_service_manager.qt_app|cachyos-service-manager-qt|g' \
    "${pkgdir}/usr/share/applications/cachyos-service-manager-qt.desktop"
  sed -i 's|python -m cachy_service_manager.gtk_app|cachyos-service-manager-gtk|g' \
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
