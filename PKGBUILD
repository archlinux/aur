# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>
# Contributor: mosra <mosra@centrum.cz>

pkgname=kdevplatform-git
pkgver=1.90.90.r12597.42041a5
pkgrel=1
pkgdesc="A C/C++ development platform for KDE. (GIT Version)"
arch=('i686' 'x86_64')
url='http://www.kdevelop.org'
license=('GPL')
depends=('qt5-quick1' 'ktexteditor' 'threadweaver' 'kcmutils' 'kdelibs4support' 'knewstuff'
         'knotifyconfig'  'grantlee-qt5' 'libkomparediff2-git' 'hicolor-icon-theme')
optdepends=('kompare-git: difference checking'
            'subversion: Subversion plugin')
makedepends=('cmake' 'boost' 'git' 'extra-cmake-modules' 'kdoctools' 'subversion')
conflicts=('kdevplatform')
source=('git://anongit.kde.org/kdevplatform')
sha1sums=('SKIP')
install=kdevplatform-git.install

pkgver() {
  cd kdevplatform
  _ver="$(cat CMakeLists.txt | grep -m3 -e KDEVPLATFORM_VERSION_MAJOR -e KDEVPLATFORM_VERSION_MINOR -e KDEVPLATFORM_VERSION_PATCH | grep -o "[[:digit:]]*" | paste -sd'.')"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kdevplatform \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
