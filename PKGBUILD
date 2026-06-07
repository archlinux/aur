# Maintainer: Twilight0 <twilight0@vivaldi.net>
pkgname=elograf-git
pkgver=r197.g3742f9e
pkgrel=1
pkgdesc="A PyQt6 system tray utility for launching and configuring nerd-dictation"
arch=('any')
url="https://github.com/papoteur-mga/elograf"
license=('GPL3')
depends=(
    'nerd-dictation-git'
    'python'
    'python-pyqt6'
    'python-ujson'
    'python-vosk'
)
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
provides=('elograf')
conflicts=('elograf')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname%-git}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname%-git}"

  # Force python-installer to place files, ignoring the duplicate script error block
  python -m installer --destdir="${pkgdir}" dist/*.whl || true

  # Ensure the binary path is correctly unique and present if it failed to drop clean
  if [ ! -f "${pkgdir}/usr/bin/elograf" ]; then
    install -Dm755 elograf "${pkgdir}/usr/bin/elograf"
  fi
}
