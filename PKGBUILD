# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=kexi-git
pkgver=3.0.89.r12056.2599dc0
pkgrel=1
pkgdesc="A visual database applications creator. (GIT Version)"
arch=('i686' 'x86_64')
url='http://www.kexi.org'
license=('GPL2')
depends=('kdb-git'
         'ktexteditor'
         'hicolor-icon-theme'
         )
makedepends=('extra-cmake-modules'
             'git'
             'boost'
             'vc'
             'python'
             'eigen'
             'kitemmodels'
             'ki18n'
             'kitemviews'
             'kwindowsystem'
             'marble'
             'kreport-git'
             'kdb-git'
             )
optdepends=('kreport-git: Report plugin'
            'marble: Geolocation plugin'
            )
provides=('kexi')
conflicts=('kexi')
source=('git://anongit.kde.org/kexi.git')
sha1sums=('SKIP')

pkgver() {
  cd kexi
  _ver="$(cat CMakeLists.txt | grep -m3 -e KEXI_STABLE_VERSION_MAJOR -e KEXI_STABLE_VERSION_MINOR -e KEXI_VERSION_RELEASE | cut -d ')' -f1 | grep -o "[[:digit:]]*" | paste -sd'.')"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kexi \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF

  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
