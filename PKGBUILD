# Maintainer: Michal Krenek (Mikos) <m.krenek@gmail.com>
pkgname=sdrangel-git
pkgver=r608.205fee6
pkgrel=1
pkgdesc="Qt5/OpenGL SDR and signal analyzer frontend for Airspy, BladeRF, HackRF, RTL-SDR and FunCube"
arch=('i686' 'x86_64')
url="https://github.com/f4exb/sdrangel"
license=('GPL3')
depends=('gnuradio-osmosdr' 'boost' 'fftw' 'log4cpp' 'pkg-config'
         'qt5-base' 'qt5-tools' 'qt5-multimedia')
makedepends=('git' 'cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/f4exb/sdrangel.git#branch=dev')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    mkdir build
    cd build
    cmake .. \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "$srcdir/${pkgname%-git}/build"
    for f in $(find . -name '*.so'); do
        install -Dm755 "$f" "$pkgdir/opt/sdrangel/$f"
    done
    for f in $(find . -name '*.h'); do
        install -Dm644 "$f" "$pkgdir/opt/sdrangel/$f"
    done
    install -Dm755 sdrangel "$pkgdir/opt/sdrangel/sdrangel"
    install -d "${pkgdir}/usr/bin"
    ln -s /opt/sdrangel/sdrangel "${pkgdir}/usr/bin/sdrangel"
}
