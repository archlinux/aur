# Maintainer: Stanislav Seletskiy <s.seletskiy@gmail.com>

pkgname=konsole-cursor
_pkgname=konsole
pkgver=r6136.8d27a2d3
pkgrel=1
arch=('i686' 'x86_64')
url='http://kde.org/applications/system/konsole/'
pkgdesc="Konsole with better cursor"
license=('GPL' 'LGPL' 'FDL')
groups=('kde-applications' 'kdebase')
conflicts=('konsole')
provides=('konsole')
depends=('knotifyconfig' 'kpty' 'kparts')
makedepends=('extra-cmake-modules' 'kdoctools' 'python')
optdepends=('kdebase-keditbookmarks: to manage bookmarks')
replaces=('kdebase-konsole' 'konsole')
conflicts=('kdebase-konsole<4.14.3-2' 'konsole')

source=('git://anongit.kde.org/konsole.git'
        "0001-remove-cursor-height-padding-from-top.patch")
sha1sums=('SKIP'
          'f4c8e0d88c89c43b2863ced4399e6af9683271b5')

pkgver() {
    cd konsole
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
  cd ${srcdir}/konsole
  patch -Np1 -i ${srcdir}/0001-remove-cursor-height-padding-from-top.patch
}

build() {
  cd build
  cmake ../konsole \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
