# Maintainer: Sich <little_sich@tuta.io>
pkgname=celestia-qt6-git
pkgver=r7228.814c49354
pkgrel=1
pkgdesc="Real-time space simulation (git version with Qt6 and video capture)"
arch=(x86_64)
license=(GPL-2.0-or-later)
url="https://celestiaproject.space"
depends=('mesa' 'libepoxy' 'fmt' 'eigen' 'freetype2' 'libjpeg-turbo' 'libpng' 'glu' 'qt6-base' 'qt6-tools' 'ffmpeg' 'luajit')
makedepends=('git' 'cmake' 'make' 'boost' 'gperf')
provides=('celestia')
conflicts=('celestia')
source=(git+https://github.com/CelestiaProject/Celestia.git
        git+https://github.com/CelestiaProject/CelestiaContent.git)
sha512sums=('SKIP'
            'SKIP')

pkgver() {
    cd "$srcdir/Celestia"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/Celestia"
    git submodule update --init
}

build() {
    cd "$srcdir/Celestia"
    cmake -B build \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DENABLE_QT5=OFF \
        -DENABLE_QT6=ON \
        -DUSE_QT6=ON \
        -DENABLE_FFMPEG=ON \
        -Wno-dev
    cd build && make
    cd "$srcdir/CelestiaContent"
    cmake -B build -DCMAKE_INSTALL_PREFIX=/usr
    cd build && make
}

package() {
    cd "$srcdir/Celestia/build"
    make DESTDIR="${pkgdir}" install
    cd "$srcdir/CelestiaContent/build"
    make DESTDIR="${pkgdir}" install
}
