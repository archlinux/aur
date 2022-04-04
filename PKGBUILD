# Maintainer: Martin Chang <marty188586@gmail.com>
pkgname=diligent-engine-git
pkgver=2.5.2.r0.ga4e03562
pkgrel=1
pkgdesc='A modern cross-platform low-level graphics library and rendering framework '
arch=('x86_64')
url='https://github.com/DiligentGraphics/DiligentEngine'
license=('Apache')
depends=(libxcursor mesa-utils python-distlib libxrandr libglvnd libxinerama libxi)
makedepends=(cmake git make clang)
checkdepends=()
optdepends=(vulkan-devel)
provides=(diligent-engine)
conflicts=()
replaces=()
options=()
source=("$pkgname::git+https://github.com/DiligentGraphics/DiligentEngine.git")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname"
  git checkout master
  git pull
  git submodule update --recursive --init
}

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
  [ -d build ] && rm -rf build
  mkdir build
  cd build
  cmake                          \
    -DCMAKE_BUILD_TYPE=RELEASE   \
    -DCMAKE_INSTALL_PREFIX=/usr  \
    -DCMAKE_C_COMPILER=clang     \
    -DCMAKE_CXX_COMPILER=clang++ \
    ..
	make -j4
}

package() {
	cd "$pkgname/build"
	make DESTDIR="$pkgdir/" install
}

