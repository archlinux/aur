# Maintainer: Thomas Andres <thomas at andres dot in>
pkgname=openhantek6022-git
_gitname=OpenHantek6022
pkgver=933.e7f7a5d
pkgrel=1
pkgdesc="A DSO software for Hantek USB digital signal oscilloscopes 6022BE/BL. (Compiled form git main branch)"
arch=('i686' 'x86_64')
url="https://github.com/OpenHantek/OpenHantek6022"
license=('GPL3')
depends=('fftw>=3' 'qt5-base>=5.4' 'qt5-svg>=5.4' 'libusb>=1.0.16')
makedepends=('git' 'cmake>=3.5' 'make' 'sed' 'gcc>=4.3' 'gendesk' 'qt5-tools>=5.4')
conflicts=(openhantek6022 openhantek openhantek-git)
provides=(openhantek6022)
source=("$_gitname::git+https://github.com/OpenHantek/OpenHantek6022.git")
md5sums=('SKIP')

prepare() {
    cd $_gitname
    # change the udev directory to match arch defaults
    sed -i 's/\/lib\/udev\/rules.d\//\/usr\/lib\/udev\/rules.d\//g' CMakeLists.txt
}

pkgver() {
    cd $_gitname
    echo "$(git rev-list --all --count).$(git rev-parse --short HEAD)"
}

build() {
    cd $_gitname
    #git checkout $(git describe --tags $(git rev-list --tags --max-count=1)) -q
    [[ ! -d build ]] && mkdir -p build
    cd build
    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        ../
    make
}

package() {
    cd $_gitname/build
    make DESTDIR=$pkgdir install
}

