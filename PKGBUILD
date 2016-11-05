# Maintainer: Antonio Rojas <arojas@archlinux,org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kfind-git
pkgver=2.0.0.2355.af2bf52
pkgrel=1
pkgdesc="KDE file find utility. (GIT version)"
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/applications/kfind'
license=('LGPL')
depends=('kdelibs4support'
         'hicolor-icon-theme'
         )
makedepends=('extra-cmake-modules'
             'kdoctools'
             'karchive'
             'git'
             'python'
             )
conflicts=('kdebase-kfind'
           'kfind'
           )
provides=('kfind')
source=('git://anongit.kde.org/kfind')
sha256sums=('SKIP')

pkgver() {
  cd kfind
  _ver="$(cat CMakeLists.txt | grep -m1 'KFIND_VERSION' | cut -d '"' -f2)"
  echo "${_ver}.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kfind \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
