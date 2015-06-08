# Maintainer: Antonio Rojas

pkgname=oxygen-kde4-git
pkgver=r3761.58923d0
pkgrel=1
pkgdesc='Oxygen widget style for KDE4 applications'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/kde-workspace'
license=('LGPL')
depends=('kdelibs')
makedepends=('extra-cmake-modules' 'automoc4' 'git')
conflicts=('kdebase-workspace' 'oxygen-kde4')
provides=('oxygen-kde4')
source=('git://anongit.kde.org/oxygen.git')
md5sums=('SKIP')

pkgver() {
  cd oxygen
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../oxygen \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF \
    -DUSE_KDE4=ON
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install

# needed so that pure Qt4 apps are correctly themed
  install -d -m755 "$pkgdir"/usr/lib/qt4/plugins/styles
  ln -sr "$pkgdir"/usr/lib/kde4/plugins/styles/oxygen.so "$pkgdir"/usr/lib/qt4/plugins/styles
}
