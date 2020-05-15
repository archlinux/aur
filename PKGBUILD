# Maintainer: Brenton Horne <brentonhorne77 at gmail dot com>
# Contributor: Ramon Buldó <ramon@manjaro.org>

pkgname=maia-gtk-theme
pkgdesc="Maia GTK theme"
_pkgname=maia-gtk
pkgrel=1
_gitcommit=9f2c31c27d95e000958975d36c7c2b53ad2127b6
pkgver=$(echo ${_gitcommit} | cut -c1-7)
url="https://gitlab.manjaro.org/artwork/themes/maia-gtk"
arch=('any')
license=('LGPL')
depends=('bash')
makedepends=('qt5-base' 'extra-cmake-modules')
source=("$url/-/archive/$_gitcommit.tar.gz")
sha256sums=('c02fbb14a0544b775386c0e714c28e52bc2a8a025ca89ac9a39dfc1bcd6599bd')

prepare() {
  mv $srcdir/maia-gtk-$_gitcommit $srcdir/${_pkgname}
  mkdir -p $srcdir/${_pkgname}/build

  # Fix for following error
  # CMake Error at Maia-Dark-gtk/cmake_install.cmake:73 (file):
  # file INSTALL cannot find "/home/user/maia-gtk-theme/src/maia-gtk/Maia-Dark-gtk/gtk-3.18/gtk.css
  sed -i $srcdir/${_pkgname}/Maia-Dark-gtk/CMakeLists.txt \
    -e "s;FILES gtk-3.18/gtk.css;FILES gtk-3.20/gtk.css;"
}

build() {
  cd $srcdir/${_pkgname}/build
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd $srcdir/${_pkgname}/build
  make DESTDIR="${pkgdir}" install
}
