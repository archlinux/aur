# Maintainer: Alexandre Demers <alexandre.f.demers@gmail.com>
# Contributor: GodronGR <ntheo1979@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: damir <damir@archlinux.org>
# Contributor: Paul Mattal <paul@archlinux.org>

_pkgbasename=x264
pkgname=lib32-x264
pkgver=0.159.r2999.296494a
pkgrel=3
epoch=3
pkgdesc='Open Source H264/AVC video encoder (32 bit)'
arch=('x86_64')
url='https://www.videolan.org/developers/x264.html'
license=('GPL')
depends=('x264' 'lib32-glibc')
makedepends=('git' 'l-smash' 'nasm' 'lib32-gcc-libs')
provides=('lib32-libx264' 'libx264.so')
conflicts=('lib32-libx264' 'lib32-libx264-10bit' 'lib32-libx264-all')
replaces=('lib32-libx264' 'lib32-libx264-10bit' 'lib32-libx264-all')
_commit='296494a4011f58f32adc54304a2654627558c59a'
source=("git+https://git.videolan.org/git/x264.git#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
    cd x264

    ./version.sh | grep X264_POINTVER | sed -r 's/^#define X264_POINTVER "([0-9]+\.[0-9]+)\.([0-9]+) (.*)"$/\1.r\2.\3/'
}

prepare() {
if [[ -d build ]]; then
    rm -rf build
fi
    mkdir build
}

build() {
    cd build
    export CC="gcc -m32"
    export CXX="g++ -m32"
    export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

    ../x264/configure \
        --prefix='/usr' \
        --libdir=/usr/lib32 \
        --host=i686-linux-gnu \
        --enable-shared \
        --enable-pic \
        --enable-lto \
        --disable-avs \
        --extra-cflags="-flto -ffat-lto-objects"
    make
}

package() {
    make -C build DESTDIR="${pkgdir}" install-cli install-lib-shared
    cd "$pkgdir/usr"
    rm -rf {bin,include}/
}
