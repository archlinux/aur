# Maintainer: Sergey A. <murlakatamenka@disroot.org>
# based off `corectrl` PKGBUILD by Sergey Kostyuchenko <derfenix@gmail.com>

_pkgname=corectrl
pkgname="$_pkgname-git"
pkgver=1.0.3.r0.gf142706
pkgrel=1
pkgdesc="Application to control your hardware with ease using application profiles"
url="https://gitlab.com/corectrl/corectrl"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('procps-ng' 'hwids')
makedepends=('git' 'cmake>=3.3' 'botan>=2.2.0' 'qt5-base>=5.9' 'qt5-tools' 'kauth' 'karchive' 'gcc>=8' 'extra-cmake-modules' 'qt5-charts' 'qt5-quickcontrols' 'qca')
optdepends=(
    'vulkan-tools: for vulkaninfo'
    'mesa-demos: for glxinfo'
    'util-linux: for lscpu'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr/" -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTING=OFF ..
  make ${MAKEFLAGS}
}

package() {
  cd "$srcdir/$_pkgname/build"
  sed -i -- 's/\/usr/${CMAKE_INSTALL_PREFIX}/g' src/helper/cmake_install.cmake
  make install
}
