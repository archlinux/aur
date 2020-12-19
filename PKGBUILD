# Maintainer Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=koko-git
pkgver=r520.9159df6
pkgrel=1
arch=('x86_64')
pkgdesc="Image gallery application designed for desktop and touch devices"
url="https://invent.kde.org/graphics/koko"
license=('LGPL2.1')
depends=('kirigami2' 'kcoreaddons' 'kguiaddons' 'kconfig' 'knotifications' 'exiv2')
makedepends=('extra-cmake-modules' 'qt5-tools')
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd ${srcdir}/${pkgname%-git}
  mkdir -p build
}

build() {
  cd ${srcdir}/${pkgname%-git}/build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
    cd ${srcdir}/${pkgname%-git}/build
    make DESTDIR="${pkgdir}" install
}

#vim: syntax=sh
