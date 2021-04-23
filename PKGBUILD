# Maintainer: Thomas Andres <thomas at andres dot in>
pkgname=openhantek6022
_gitname=OpenHantek6022
pkgver=3.2.2
pkgrel=2
pkgdesc="A DSO software for Hantek USB digital signal oscilloscopes 6022BE/BL."
arch=('i686' 'x86_64')
url="https://github.com/OpenHantek/OpenHantek6022"
license=('GPL3')
depends=('fftw>=3' 'qt5-base>=5.4' 'qt5-svg>=5.4' 'libusb>=1.0.16')
makedepends=('git' 'cmake>=3.5' 'make' 'sed' 'gcc>=4.3' 'qt5-tools>=5.4')
conflicts=(openhantek6022-git openhantek openhantek-git)
provides=(openhantek6022)
source=("$_gitname::git+https://github.com/OpenHantek/OpenHantek6022.git")
md5sums=('SKIP')

pkgver() {
    curl --silent https://api.github.com/repos/OpenHantek/OpenHantek6022/releases/latest | grep -Po '"tag_name": "\K.*?(?=")'
}

build() {
    cd $_gitname
    git checkout $pkgver -q
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
