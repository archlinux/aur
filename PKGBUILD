# Maintainer: Dominik Schreiber <dev@dominikschreiber.de>
pkgname=plasma5-runners-symbols
pkgver=1.1.0
pkgrel=1
pkgdesc="A little krunner plugin (Plasma 5) to retrieve unicode symbols, or any other string, based on a corresponding keyword"
arch=('x86_64')
url="https://github.com/domschrei/krunner-symbols"
license=('GPL')
depends=('krunner' 'qt5-base' 'ki18n')
makedepends=('cmake' 'extra-cmake-modules' 'kdelibs4support')
optdepends=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/domschrei/krunner-symbols/archive/${pkgver}.tar.gz")
sha256sums=('f7f2094f0df142bf7f40e68e12feeeeacf8cf2659431f71eea3f74b36775852c')

prepare() {
  mkdir -p build
}

build() {
  cd build

  # Get correct installation directories
  prefix=$(kf5-config --prefix) 
  loc_plugin=$(kf5-config --qt-plugins|sed 's.^'"$prefix"'/..')
  loc_desktop=$(kf5-config --path services|awk -F ':' '{print $NF}'|sed 's.^'"$prefix"'/..')
  loc_config=share/config

  cmake ../krunner-symbols-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=$prefix \
    -DLOCATION_PLUGIN=$loc_plugin \
    -DLOCATION_DESKTOP=$loc_desktop \
    -DLOCATION_CONFIG=$loc_config \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make install DESTDIR="${pkgdir}"
}

