# Maintainer: Ilya Elenskiy 

pkgname=enroute-git
_name=enroute
pkgver=1.8.1.r136.gee7bad1
pkgrel=2
pkgdesc="Enroute Flight Navigation"
arch=('i686' 'x86_64')
url="https://akaflieg-freiburg.github.io/enroute/"
license=('GPL3')
makedepends=('git' 'cmake' 'clang')
depends=('qt5-location' 'hicolor-icon-theme')
source=("enroute::git+https://github.com/Akaflieg-Freiburg/enroute.git#branch=master")
md5sums=('SKIP')

pkgver() {
    cd "$_name"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${_name}"
    git submodule update --init --recursive

    sed -i 's/\/usr\/share\/qt5/\/usr\/share\/qt/g' src/CMakeLists.txt
}

build() {
    cd "${_name}"

    export ASAN_OPTIONS=detect_leaks=0
    export CC=clang
    export CXX=clang++

    cmake -S . -B ./build \
        -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
	-DCMAKE_FIND_ROOT_PATH:STRING='/usr/share/qt' \
        -Wno-dev 
	
    cd build
    make
}

package() {
    cd "${_name}"
    
    make -C build DESTDIR="$pkgdir" install
}
