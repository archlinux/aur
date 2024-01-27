# Maintainer: Albert Lv <altair.albert [at] gmail [dot] com>

pkgname=groot
pkgver=1.0.0.r85.gca6c8f2
pkgrel=1
pkgdesc='Graphical Editor to create BehaviorTrees'
arch=('any')
url='https://github.com/BehaviorTree/Groot'
license=('custom')
depends=('qt5-base' 'qt5-svg' 'cppzmq' 'libelf')
makedepends=("cmake" "git")
source=('groot::git+https://github.com/BehaviorTree/Groot.git#branch=master')
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname
  git submodule update --init --recursive
  sed -i '/ament_index_cpp/d' CMakeLists.txt
  sed -i '/add_subdirectory(test)/d' CMakeLists.txt
  sed -i '14,19d' CMakeLists.txt
  sed -i 's/CMAKE_CXX_STANDARD 14/CMAKE_CXX_STANDARD 17/' depend/BehaviorTree.CPP/CMakeLists.txt
}

build() {
  cd $pkgname
  mkdir -p build
  cmake -S.  -Bbuild -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_TESTING=OFF
  cmake --build build -j$(nproc) -- --quiet
  sed -n '/Copyright/,/IN THE SOFTWARE./p' README.md > build/LICENSE
}

package() {
    cd "$pkgname/build"
    make DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
