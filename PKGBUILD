# Maintainer: Your Name <your.email@example.com>
pkgname=linux-ryzen-undervolt-git
_pkgname=ruv-gui
pkgver=0.0.0.r196.ecd7d73
pkgrel=1
pkgdesc="Ryzen CPU undervolting tool (GUI) using the ryzen_smu driver"
arch=('x86_64')
url="https://github.com/softwaresocialist/linux-ryzen-undervolt"
license=('GPL3')
depends=(
    'python'
    'python-pyqt6'
    'python-requests'
    'python-psutil'
    'polkit'
)
optdepends=(
    'ryzen_smu-dkms-git: required kernel module for accessing SMU registers'
)
makedepends=('git')
provides=("${_pkgname}=${pkgver}" "ruv-gui=${pkgver}")
conflicts=("${_pkgname}" "ruv-gui")
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

# No pkgver() function – version is static and manually updated

prepare() {
  cd "${srcdir}/${_pkgname}"
  sed -i 's|^INSTALLED_BIN_PATH = .*|INSTALLED_BIN_PATH = "/usr/bin/ruv-gui"|' ruv_gui.py
  sed -i 's|Exec=/usr/local/bin/ruv-gui|Exec=/usr/bin/ruv-gui|' ruv-gui.desktop
}

check() {
  cd "${srcdir}/${_pkgname}"
  python -m py_compile ruv_gui.py
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm755 ruv_gui.py "${pkgdir}/usr/bin/ruv-gui"
  install -Dm644 ruv-gui.desktop "${pkgdir}/usr/share/applications/ruv-gui.desktop"
  if [[ -f ruv-gui.png ]]; then
    install -Dm644 ruv-gui.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/ruv-gui.png"
  fi
  if [[ -f ruv-gui.1 ]]; then
    install -Dm644 ruv-gui.1 "${pkgdir}/usr/share/man/man1/ruv-gui.1"
  fi
  install -dm755 "${pkgdir}/etc/ruv/profiles"
  install -dm755 "${pkgdir}/var/cache/ruv"
}
