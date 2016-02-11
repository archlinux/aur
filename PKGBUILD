# Maintainer: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)

# based on marble from [extra]

_pkgname=marble
pkgname=$_pkgname-qt
pkgver=15.12.1
pkgrel=1
pkgdesc="Desktop Globe - Qt version"
arch=('i686' 'x86_64')
url="https://www.kde.org/applications/system/marble"
license=('GPL')
makedepends=('extra-cmake-modules' 'gpsd' 'libwlocate' 'qt5-tools')
depends=('qt5-webkit' 'quazip-qt5' 'phonon-qt5' 'qt5-svg' 'qt5-script' 'libwlocate' 'gpsd' 'hicolor-icon-theme')
optdepends=('gpsd: GPS based geolocation'
            'libwlocate: WLAN based geolocation')
provides=("$_pkgname" 'marble-data' 'libastro')
conflicts=("$_pkgname" 'marble-data' 'libastro')
install=$pkgname.install
source=("http://download.kde.org/stable/applications/$pkgver/src/$_pkgname-$pkgver.tar.xz")
md5sums=('49ae100aa2ec034d702636008dba5f2f')

prepare() {
  mkdir -p build

  # only build the KDE app
  sed -e '/mobile/d' \
      -e '/Quick/d' \
      -e '/touch/d' \
      -e '/kde/d' \
      -i $_pkgname-$pkgver/src/apps/CMakeLists.txt
}

build() {
  cd build
  cmake ../$_pkgname-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DQT_PLUGINS_DIR=lib/qt/plugins \
    -DBUILD_TESTING=OFF \
    -DBUILD_MARBLE_EXAMPLES=OFF \
    -DBUILD_MARBLE_TESTS=OFF \
    -DMOBILE=OFF \
    -DQTONLY=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
