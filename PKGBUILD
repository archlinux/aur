# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sddm
pkgver=0.11.0
pkgrel=3
pkgdesc='QML based X11 display manager'
arch=('i686' 'x86_64')
url='http://github.com/sddm/sddm'
license=('GPL')
depends=('qt5-declarative')
makedepends=('cmake' 'python-docutils' 'qt5-tools')
install="${pkgname}.install"
backup=('usr/share/sddm/scripts/Xsetup')
provides=('display-manager')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz"
        kubuntu_dbus-config-rename.patch)
md5sums=('e110a7683867400dc9484d4744fd41dd'
         '7c2934003e61c46d1d82d3d9a93ed35b')

prepare() {
  mkdir -p build

  cd $pkgname-$pkgver
  # FS#42445
  patch -p1 -i ../kubuntu_dbus-config-rename.patch
}

build() {
  cd build
  cmake ../${pkgname}-${pkgver} \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_LIBEXECDIR=/usr/lib/sddm \
        -DBUILD_MAN_PAGES=ON
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
