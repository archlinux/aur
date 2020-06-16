# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=krename-git
pkgver=5.0.60.r543.141e811
pkgrel=1
pkgdesc="A very powerful batch file renamer for KDE. (GIT Version)"
arch=('x86_64')
url='https://kde.org/applications/en/utilities/org.kde.krename'
license=('GPL')
depends=('kio'
         'taglib'
         'podofo'
         'kjs'
         'exiv2'
         'hicolor-icon-theme'
         )
makedepends=('git'
             'extra-cmake-modules'
             'python'
             'kdoctools'
             )
provides=('krename')
conflicts=('krename')
source=('git+https://invent.kde.org/utilities/krename.git')
sha1sums=('SKIP')

pkgver() {
  cd krename
  _ver="$(cat CMakeLists.txt | grep -m1 'krename VERSION' | grep -o "[[:digit:]]*" | paste -sd'.')"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../krename \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF

  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
