pkgname=basket-git
pkgver=2.49.90.r1501.79a7ef1
pkgrel=1
pkgdesc="All-purpose notes taker for KDE."
arch=('i686' 'x86_64')
url="https://invent.kde.org/utilities/basket"
license=('GPL')
depends=(kcmutils  kfilemetadata  kparts  phonon-qt5  libgit2)
makedepends=('extra-cmake-modules' 'kdoctools' 'git')
provides=('basket')
conflicts=('basket')
source=('git+https://invent.kde.org/utilities/basket.git')
sha1sums=('SKIP')
#options=(debug !strip)

pkgver() {
  cd basket
  _ver="$(cat CMakeLists.txt | grep "Basket VERSION" | cut -d ' ' -f 3 | tr '\n' '.' | cut -d ")" -f1)"
  echo "$(echo ${_ver}).r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare(){
  mkdir -p build
}

#To get debug info, change -DCMAKE_BUILD_TYPE=Release to either "Debug" or "RelWithDebInfo"

build() {
  cd build
  cmake ../basket \
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

