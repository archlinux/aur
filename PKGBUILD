# Maintainer: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)

# based on marble from [extra]

_pkgname=marble
pkgname=$_pkgname-qt
pkgver=15.12.0
pkgrel=1
pkgdesc="Desktop Globe - Qt version"
arch=(i686 x86_64)
url="https://www.kde.org/applications/system/marble"
license=(GPL)
makedepends=(extra-cmake-modules gpsd quazip-qt5 libwlocate phonon-qt5 qt5-webkit qt5-tools)
depends=(qt5-webkit quazip-qt5 phonon-qt5 qt5-svg qt5-script libwlocate gpsd hicolor-icon-theme)
optdepends=('gpsd: GPS based geolocation'
            'libwlocate: WLAN based geolocation')
provides=(marble)
conflicts=(marble)
install=$pkgname.install
source=("http://download.kde.org/stable/applications/$pkgver/src/$_pkgname-$pkgver.tar.xz"
	       plugin-dir.patch::"https://quickgit.kde.org/?p=marble.git&a=commitdiff&h=f59d559&o=plain")
md5sums=('a7a481936281a7d584b9168d98fcd5d5'
         'e4441d763de7588a8c4fa93b83d945fe')

prepare() {
  mkdir -p build

# fix installation designer plugins path https://bugs.kde.org/show_bug.cgi?id=348554
  cd $_pkgname-$pkgver
  #patch -p1 -i ../plugin-dir.patch
  cd ..

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
