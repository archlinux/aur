# Maintainer: Alexey Andreyev <aa13q@ya.ru>

pkgname=qt5-qmllive-git
_srcname=qt5-qmllive
pkgver=v5.12.1_QtAS.r4.g402894e
pkgrel=1
pkgdesc="QmlLive live reloader environment for rapid UI development"
arch=('armv7h' 'i686' 'x86_64' 'aarch64')
url="https://code.qt.io/qt-apps/qmllive"
license=('GPL3')
depends=('qt5-base' 'qt5-declarative')
makedepends=('git')
optdepends=()
provides=("${_srcname}")
conflicts=()
source=(
  "${pkgname}::git+${url}.git"
)
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  ( set -o pipefail
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  ) 2>/dev/null
}

build() {
  cd "${srcdir}/${pkgname}"
  mkdir -p build
  cd build
  qmake ..
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  cd build
  make INSTALL_ROOT="${pkgdir}" install
}
