# Maintainer: Thomas Andres <thomas at andres dot in>
pkgname=openhantek6022
_gitname=OpenHantek6022
pkgver=3.4.1.rc2
pkgrel=2
pkgdesc="A DSO software for Hantek USB digital signal oscilloscopes 6022BE/BL."
arch=('i686' 'x86_64')
url="https://github.com/OpenHantek/OpenHantek6022"
license=('GPL3')
depends=('fftw>=3' 'qt6-base>=6.2' 'qt6-svg>=6.2' 'libusb>=1.0.16')
makedepends=('git' 'cmake>=3.12' 'make' 'sed' 'gcc>=4.3' 'qt6-tools>=6.2')
conflicts=(openhantek6022-git openhantek openhantek-git)
provides=(openhantek6022)
source=("$_gitname::git+https://github.com/OpenHantek/OpenHantek6022.git")
md5sums=('SKIP')

pkgver() {
    git_tag_name=$(curl --silent https://api.github.com/repos/OpenHantek/OpenHantek6022/releases/latest | grep -Po '"tag_name": "\K.*?(?=")')
    echo $git_tag_name | sed 's/-/./'
}

build() {
    cd $_gitname
    git checkout $git_tag_name -q
    [[ ! -d build ]] && mkdir -p build
    cd build
    cmake \
        -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" \
        ../
    cmake --build .
}

package() {
    cd $_gitname/build
    cmake --install .
}
