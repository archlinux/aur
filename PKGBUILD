# Maintainer: Shatur <genaloner@gmail.com>

# Use KDE API features (recommended for Plasma users)
_plasma=false

# Submodule versions
_singleapplication=3.1.3.1

pkgname=optimus-manager-qt
pkgver=1.5.2
pkgrel=1
pkgdesc='A Qt interface for Optimus Manager that allows to configure and switch GPUs on Optimus laptops using the tray menu'
arch=(x86_64)
url=https://github.com/Shatur95/optimus-manager-qt
license=(GPL3)
depends=(qt5-base qt5-svg qt5-x11extras 'optimus-manager>=1.3')
makedepends=(qt5-tools extra-cmake-modules libxrandr)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz
        SingleApplication-$_singleapplication.tar.gz::https://github.com/itay-grudev/SingleApplication/archive/v$_singleapplication.tar.gz)
sha256sums=(4ec83e59a667183ceadcc40d7bdf1a66e28dc24318dfe3fb936c9b4c380c1942
            bbc20faa3e914cda8fe94b5d0bf98af640d3298a791a16cad4571a9ccbf1d030)

if [ $_plasma == true ]
then
  depends+=(knotifications kiconthemes)
fi

# Move submodules into the project
prepare() {
  mv SingleApplication-$_singleapplication/* $pkgname-$pkgver/src/third-party/singleapplication
}

build() {
  mkdir -p $pkgname-$pkgver/build
  cd $pkgname-$pkgver/build

  if [ $_plasma == true ]
  then
      cmake -D CMAKE_INSTALL_PREFIX="$pkgdir/usr" -D PLASMA=ON ..
  else
      cmake -D CMAKE_INSTALL_PREFIX="$pkgdir/usr" ..
  fi

  cmake --build .
}

package() {
  cd $pkgname-$pkgver/build

  cmake --install .
  rm -f "${pkgdir}/usr/share/icons/hicolor/icon-theme.cache"
}
