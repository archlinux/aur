pkgname=wsjtz
pkgver=2.0.14
pkgrel=1
pkgdesc="Fork of WSJT-X with automation features"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/sq9fve/wsjt-z"
license=('GPL-3')
makedepends=(cmake asciidoc asciidoctor boost dos2unix git)
options=('!lto')
depends=(hamlib qt5-base qt5-multimedia qt5-serialport qt5-tools libusb libusb-compat gcc-fortran libpulse libpng fftw qt5-websockets)
provides=(wsjtx)
conflicts=(wsjtx)
source=(https://codeload.github.com/sq9fve/wsjt-z/tar.gz/refs/tags/v$pkgver)
sha512sums=('SKIP')

prepare() {
    # fix lib/jplsubs
    sed -i '684a\      EXTERNAL SPLIT' $srcdir/wsjt-z-$pkgver/lib/jplsubs.f
}

build() {
    cd $srcdir/wsjt-z-$pkgver
    cmake -Wno-dev -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release $srcdir/wsjt-z-$pkgver \
          -DCMAKE_Fortran_FLAGS="-std=legacy -fallow-argument-mismatch" \
          -DCMAKE_CXX_FLAGS="-Wno-error -Wno-maybe-uninitialized" \
          -DCMAKE_C_FLAGS="-Wno-error -Wno-maybe-uninitialized"
    make || return 1
}

package() {
    make DESTDIR="${pkgdir}" install
}
