# Maintainer: BangL <henno.rickowski@gmail.com>
pkgname=taskbar-cat-git
_pkgname=taskbar-cat
pkgver=r1.fec814e
pkgrel=1
pkgdesc="Pixel-Art-Tamagotchi-Katze für KDE Plasma 6 / Wayland, lebt auf Boden und Fensteroberkanten"
arch=('any')
url="https://github.com/BangL/taskbar-cat"
license=('MIT')
depends=('python' 'python-pyqt6' 'qt6-declarative' 'qt6-wayland' 'layer-shell-qt' 'kwin')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/BangL/taskbar-cat.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${_pkgname}"
  QT_QPA_PLATFORM=offscreen python -m pytest
}

package() {
  cd "${srcdir}/${_pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 data/${_pkgname}.desktop "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # Icon wird prozedural erzeugt, es liegt kein PNG im Quell-Repo
  install -d "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
  QT_QPA_PLATFORM=offscreen PYTHONPATH="${PWD}" python -m taskbar_cat.sprites --icon \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"
}
