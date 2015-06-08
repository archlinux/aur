# Maintainer: Antonio Rojas <nqn1976 @ gmail.com>

pkgname=breeze-kde4-git
pkgver=r547.bf148b3
pkgrel=1
pkgdesc='Breeze widget style for KDE4 applications'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/workspace/breeze'
license=('LGPL')
depends=('kdelibs')
makedepends=('extra-cmake-modules' 'git' 'automoc4' 'ki18n')
conflicts=('breeze-kde4')
provides=('breeze-kde4')
source=('git://anongit.kde.org/breeze.git')
md5sums=('SKIP')

pkgver() {
  cd breeze
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../breeze \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_KDE4=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install

# needed so that pure Qt4 apps are correctly themed
  install -d -m755 "$pkgdir"/usr/lib/qt4/plugins/styles
  ln -sr "$pkgdir"/usr/lib/kde4/plugins/styles/breeze.so "$pkgdir"/usr/lib/qt4/plugins/styles
}
