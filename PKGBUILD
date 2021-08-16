# Maintainer: Christoph Haag <christoph.haag@collabora.com>

_realname='openxr-explorer'
pkgname="$_realname-git"
pkgver=v1.1.r2.gb11f564
pkgrel=1
pkgdesc='OpenXR capabilities explorer and runtime switcher with a CLI and GUI.'
arch=('i686' 'x86_64')
url='https://github.com/maluoi/openxr-explorer'
depends=('openxr' 'libxcb' 'xcb-util-keysyms' 'glew' 'xcb-util-cursor')
provides=("$_realname="$pkgver)
conflicts=("$_realname")
makedepends=('cmake' 'git' 'ninja')
license=('MIT')

source=('git+https://github.com/maluoi/openxr-explorer.git')
md5sums=('SKIP')

prepare() {
  cd $_realname
  git submodule update --init --recursive
}

pkgver() {
  cd $_realname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $_realname
  # -DBUILD_WITH_STD_FILESYSTEM=OFF for https://github.com/KhronosGroup/OpenXR-SDK-Source/issues/260
  cmake \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DCMAKE_BUILD_TYPE=Release \
  -GNinja -Bbuild \
  -DBUILD_WITH_STD_FILESYSTEM=OFF
  ninja -C build
}

#check() {
#  cd $_realname
#  ninja -C build test
#}

package() {
  cd $_realname
  DESTDIR="$pkgdir" ninja -C build install

  # delete mistakenly installed openxr sdk
  rm -rf "$pkgdir/usr/include"
  rm -rf "$pkgdir/usr/lib"
  rm -rf "$pkgdir/usr/share"
}
