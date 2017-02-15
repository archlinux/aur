# Maintainer: Michal Krenek (Mikos) <m.krenek@gmail.com>
pkgname=sdrangel-git
pkgver=r1688.7e6ab820
pkgrel=1
pkgdesc="Qt5/OpenGL SDR and signal analyzer frontend for Airspy, BladeRF, HackRF, RTL-SDR, SDRplay and FunCube"
arch=('i686' 'x86_64')
url="https://github.com/f4exb/sdrangel"
license=('GPL3')
depends=('gnuradio-osmosdr' 'boost' 'fftw' 'log4cpp' 'pkg-config' 'lz4' 'nanomsg' 'dsdcc-git'
         'cm256cc-git' 'libmirisdr4-git' 'pulseaudio' 'qt5-base' 'qt5-tools' 'qt5-multimedia')
makedepends=('git' 'cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/f4exb/sdrangel.git')
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
        -DCMAKE_INSTALL_PREFIX=/opt/sdrangel \
        -DLIBDSDCC_INCLUDE_DIR=/usr/include/dsdcc \
        -DCM256CC_INCLUDE_DIR=/usr/include/cm256cc
    make
}

package() {
    cd "$srcdir/${pkgname%-git}/build"
    make DESTDIR="$pkgdir/" install

    # For some reason SDRangel only works if it is installed outside of /usr,
    # so we install it into /opt/sdrangel and create link to it in /usr/bin
    install -d "${pkgdir}/usr/bin"
    ln -s /opt/sdrangel/bin/sdrangel "${pkgdir}/usr/bin/sdrangel"
}
