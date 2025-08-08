# Maintainer: Bowen Zhang <bowenzhang609@gmail.com>

gitname=avcpp
pkgname=avcpp-git
pkgver=r409.50cec73
pkgrel=1
pkgdesc="Wrapper for the FFmpeg that simplify usage it from C++ projects"
arch=('x86_64')
url="https://github.com/h4tr3d/avcpp"
license=('0-BSD and LGPL')  
depends=('ffmpeg')
provides=('avcpp')
conflicts=('avcpp')
makedepends=('git' 'gcc' 'make' 'cmake')
source=("git+https://github.com/h4tr3d/avcpp.git")
sha256sums=('SKIP') 

pkgver() {
    cd "avcpp"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${gitname}"

    git submodule update --init --recursive

    rm -rf build
    mkdir -p build

    cd build

    cmake .. 
    make -j8
}

check() {
    cd "avcpp/build"
    make test || true
}

package() {
    cd "avcpp/build"
    
    make DESTDIR="$pkgdir" install
    
    install -Dm644 ../README.md "$pkgdir/usr/share/doc/avcpp/README.md"
}