# Maintainer: Aetf <aetf@unlimitedcodeworks.xyz>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
_pkgname=kgraphviewer
pkgname=kgraphviewer-git
pkgver=2.4.3a.r237.g9c0f70c
pkgrel=2
pkgdesc='A Graphviz dot graph file viewer for KDE'
arch=(x86_64)
url='http://www.kde.org/applications/graphics/kgraphviewer/'
license=(GPL FDL)
conflicts=($_pkgname)
provides=($_pkgname)
depends=(qt5-base qt5-svg kcoreaddons5 kparts5 kwidgetsaddons5 graphviz hicolor-icon-theme gcc-libs kxmlgui5 kconfig5 ki18n5 kconfigwidgets5 glibc)
makedepends=(git cmake extra-cmake-modules boost docbook-xsl kdoctools5)
source=('git+https://invent.kde.org/graphics/kgraphviewer.git')
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build(){
  cd "$srcdir"

  mkdir -p build
  cd build
  cmake ../$_pkgname \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib
  make
}

package() {
  cd "$srcdir/build"

  make DESTDIR="$pkgdir" install
}
