# Maintainer: Aleksander Alekseev <afiskon@gmail.com>
pkgname=sdrangel-no-sdrplay-git
pkgver=r2774.69be1d59
pkgrel=1
pkgdesc="Qt5/OpenGL SDR and signal analyzer frontend (with disabled SDRPlay support)"
arch=('i686' 'x86_64')
url="https://github.com/f4exb/sdrangel"
license=('GPL3')
depends=('gnuradio-osmosdr' 'boost' 'fftw' 'log4cpp' 'pkg-config' 'lz4' 'nanomsg' 'dsdcc-git'
         'cm256cc-git' 'libmirisdr-git' 'pulseaudio' 'qt5-base' 'qt5-tools' 'qt5-multimedia')
makedepends=('git' 'cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/f4exb/sdrangel.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-no-sdrplay-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${pkgname%-no-sdrplay-git}"
    patch plugins/samplesource/CMakeLists.txt ../../CMakeList.txt.patch
    rm -r build || true # clean if exists
    mkdir build
    cd build
    cmake .. \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/opt/sdrangel \
        -DLIBDSDCC_INCLUDE_DIR=/usr/include/dsdcc \
        -DCM256CC_INCLUDE_DIR=/usr/include/cm256cc
    make -j4
}

package() {
    cd "$srcdir/${pkgname%-no-sdrplay-git}/build"
    make DESTDIR="$pkgdir/" install

    # For some reason SDRangel only works if it is installed outside of /usr,
    # so we install it into /opt/sdrangel and create link to it in /usr/bin
    install -d "${pkgdir}/usr/bin"
    ln -s /opt/sdrangel/bin/sdrangel "${pkgdir}/usr/bin/sdrangel"
}
