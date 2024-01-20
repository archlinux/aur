# Maintainer: zccrs <zhangjide@deepin.org>
pkgname=dtk6declarative-git
pkgver=6.0.5.r4.ge4af639
pkgrel=1
sourcename=dtk6declarative
sourcetars=("$sourcename"_"$pkgver".tar.xz)
sourcedir="$sourcename"
pkgdesc='Deepin Toolkit, declarative module for DDE look and feel'
arch=('x86_64' 'aarch64')
url="https://github.com/linuxdeepin/dtk6declarative"
license=('LGPL3')
depends=('qt6-declarative'
         'qt6-shadertools'
         'qt6-5compat'
	       'dtkcommon'
         'dtk6core'
         'dtk6gui')
makedepends=('git' 'qt6-tools' 'gtest' 'cmake'  'ninja' 'doxygen')
conflicts=('dtk6declarative')
provides=('dtk6declarative')
groups=('deepin-git')
source=("git+${url}")
sha512sums=('SKIP')

pkgver() {
  cd $sourcedir
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $sourcedir
  version=$(git describe --long --tags | awk -F'[+_~-]' '{print $1}')
  cmake -GNinja \
      -DMKSPECS_INSTALL_DIR=lib/qt6/mkspecs/modules/\
      -DQML_INSTALL_DIR=lib/qt6/qml \
      -DBUILD_DOCS=OFF \
      -DBUILD_EXAMPLES=OFF \
      -DQCH_INSTALL_DESTINATION=share/doc/qt6 \
      -DCMAKE_INSTALL_LIBDIR=lib \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_BUILD_TYPE=Release \
      -DDTK_VERSION=$version
}

package() {
  cd $sourcedir
  DESTDIR="$pkgdir" ninja install
}
