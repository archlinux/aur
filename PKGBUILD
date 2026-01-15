# Maintainer: Henri <sandwichd@proton.me>

pkgname=ampere-git
_pkgname=ampere
pkgver=0.1.11
pkgrel=1
pkgdesc="Ampere – a simple desktop audio player"
arch=('any')
url="https://your-host/your-user/ampere-audio-player"
license=('MIT')
depends=(
  'python'
  'pyside6'
  'python-mutagen'
  'python-vlc'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
)
provides=('ampere')
conflicts=('ampere')
source=(
  "${_pkgname}::git+${url}.git"
)
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  if git describe --tags --long &>/dev/null; then
    git describe --tags --long | sed 's/^v//;s/-/./g'
  else
    printf "%s.r%s.g%s" "0.1.11" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}

build() {
  cd "${srcdir}/${_pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}