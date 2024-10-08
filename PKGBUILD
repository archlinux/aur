# Maintainer: 
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org>
# Contributor: Alfredo Ramos <alfredo dot ramos at yandex dot com>

pkgname=screencloud-git
pkgver=1.5.3.r1.gd8453cc
pkgrel=2
pkgdesc='An easy to use screenshot sharing tool'
arch=(x86_64)
url="https://github.com/olav-st/screencloud"
license=(GPL-2.0-only)
depends=(qt5-x11extras  qt5-multimedia pythonqt
         quazip-qt5 xdg-utils hicolor-icon-theme python) #qt5-svg
optdepends=('python-pycryptodome: for SFTP support')
makedepends=(cmake git qt5-tools)
provides=(screencloud)
conflicts=(screencloud)
source=("git+https://github.com/olav-st/screencloud.git")
sha512sums=('SKIP')

pkgver() {
  cd screencloud
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  local _flags=(
    -DQUAZIP_INCLUDE_DIR:PATH=/usr/include/QuaZip-Qt5-1.4/quazip
    -DQUAZIP_LIBRARY:FILEPATH=/usr/lib/libquazip1-qt5.so
  )

  cmake -B build -S "screencloud" -Wno-dev \
    -DPYTHON_USE_PYTHON3=ON \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
