# Maintainer: Ilya Elenskiy 

pkgname=enroute-git
_name=enroute
pkgver=10.0.1.r0.g539698af
pkgrel=1
pkgdesc="Enroute Flight Navigation"
arch=('i686' 'x86_64')
url="https://akaflieg-freiburg.github.io/enroute/"
license=('GPL3')
makedepends=('git' 'cmake' 'clang')
depends=('qt5-location' 'qt5-translations' 'qt5-quickcontrols2' 'qt5-graphicaleffects' 'qt5-webview' 'hicolor-icon-theme' 'geoclue')
source=("enroute::git+https://github.com/Akaflieg-Freiburg/enroute.git#branch=master")
md5sums=('SKIP')

pkgver() {
    cd "$_name"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${_name}"
    
    git submodule init
    # replace relative pathes with absolute to avoid looking in build dir
    git config submodule."3rdParty/qhttpengine".url https://github.com/Akaflieg-Freiburg/qhttpengine.git
    git config submodule."3rdParty/enrouteText".url https://github.com/Akaflieg-Freiburg/enrouteText.git
    
    git submodule update --recursive
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
