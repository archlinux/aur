# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=edytornc-git
_pkgname=edytornc
pkgver=r187.52fe345
pkgrel=1
pkgdesc="Text editor for CNC programmers"
arch=('x86_64')
url='https://github.com/u-235/edytornc'
license=('LGPL-3.0')
provides=('edytornc')
depends=('qt5-base')
makedepends=('git')
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}/${_pkgname}"
  qmake PREFIX="/usr"
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make INSTALL_ROOT="${pkgdir}" install
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname%-git}"
  ln -s /usr/share/licenses/common/LGPL3/license.txt "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
}