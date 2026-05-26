# Maintainer: LY <ly-niko@qq.com>

pkgname=momentum4-control-git
_pkgname=momentum4-control
pkgver=r2.c9d28cb
pkgrel=1
pkgdesc="Unofficial Linux/KDE tray controller for Sennheiser Momentum 4 headphones"
arch=('any')
url="https://github.com/f3Y0/momentum4-control"
license=('MIT')
depends=('python' 'python-pyqt6' 'bluez')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -Dm755 momentum4_gui.py "${pkgdir}/usr/share/${_pkgname}/moment4_gui.py"

  mkdir -p "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/momentum4-control" << 'WRAPPER'
#!/usr/bin/env bash
set -euo pipefail
exec /usr/share/momentum4-control/moment4_gui.py "$@"
WRAPPER
  chmod 755 "${pkgdir}/usr/bin/momentum4-control"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 momentum4-control.desktop "${pkgdir}/usr/share/applications/momentum4-control.desktop"
  install -Dm644 momentum4-control-autostart.desktop "${pkgdir}/etc/xdg/autostart/momentum4-control.desktop"

  sed -i "s#Exec=python3 @APP_PATH@/momentum4_gui.py#Exec=momentum4-control#" \
    "${pkgdir}/usr/share/applications/momentum4-control.desktop"
  sed -i "s#Exec=python3 @APP_PATH@/momentum4_gui.py --start-hidden#Exec=momentum4-control --start-hidden#" \
    "${pkgdir}/etc/xdg/autostart/momentum4-control.desktop"
}
