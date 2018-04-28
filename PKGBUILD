# Maintainer: Alexey Andreyev <aa13q@ya.ru>

pkgname=qt5-sparql-git
_srcname=qt5-sparql
pkgver=0.2.18.r0.g2332b2d
pkgrel=1
pkgdesc="Library for accessing RDF stores"
arch=('armv7h' 'i686' 'x86_64' 'aarch64')
url="https://git.merproject.org/mer-core/libqtsparql"
license=('GPL3' 'CUSTOM')
depends=('qt5-base' 'qt5-declarative' 'tracker')
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
  export QT_SELECT=5
  ./configure -prefix /usr
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
