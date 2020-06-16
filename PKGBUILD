# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: A Rojas < nqn1976 @ gmail.com >

pkgname=partitionmanager-git
pkgver=4.1.0.r1434.d05914c
pkgrel=1
pkgdesc="A KDE utility that allows you to manage disks, partitions, and file systems. (GIT version)"
arch=('x86_64')
url='https://kde.org/applications/en/system/org.kde.partitionmanager'
license=('GPL2')
depends=('kpmcore'
         'kio'
         'hicolor-icon-theme'
         )
conflicts=('partitionmanager')
provides=('partitionmanager')
makedepends=('extra-cmake-modules'
             'kdoctools'
             'git'
             'python'
             )
source=('git+https://invent.kde.org/system/partitionmanager.git')
sha256sums=('SKIP')

pkgver() {
  cd partitionmanager
  _ver="$(cat CMakeLists.txt | grep -m3 -e MAJOR -e MINOR -e RELEASE | cut -d '"' -f2 | paste -sd'.')"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../partitionmanager \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF

  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
