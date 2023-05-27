# Maintainer: Alexandre Demers <alexandre.f.demers@gmail.com>
# Contributor: GodronGR <ntheo1979@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: damir <damir@archlinux.org>
# Contributor: Paul Mattal <paul@archlinux.org>

_pkgbasename=x264
pkgname=lib32-x264
pkgver=0.164.r3095.baee400
pkgrel=1
epoch=3
pkgdesc='Open Source H264/AVC video encoder (32 bit)'
arch=('x86_64')
url='https://www.videolan.org/developers/x264.html'
license=('GPL')
depends=(
#    "x264"
    "x264>=${epoch}:${pkgver}" 
    "lib32-glibc" 
    'lib32-gcc-libs'
    "lib32-l-smash"
    )
makedepends=(
    'git' 
    'nasm' 
    )
provides=(
    'lib32-libx264' 
    'libx264.so'
    )
conflicts=(
    'lib32-libx264' 
    'lib32-libx264-10bit' 
    'lib32-libx264-all'
    )
replaces=(
    'lib32-libx264' 
    'lib32-libx264-10bit' 
    'lib32-libx264-all'
    )
_commit=baee400fa9ced6f5481a728138fed6e867b0ff7f  # master
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
        --disable-swscale \
        --disable-lavf
    make
}

package() {
    make -C build DESTDIR="${pkgdir}" BASHCOMPLETIONSDIR="/usr/share/bash-completion/completions" install-cli install-lib-shared install-bashcompletion

    # Keep files in bin since this is not a library only package. 
    # Use the same naming scheme as proposed in Arch's wiki:  https://wiki.archlinux.org/index.php/32-bit_package_guidelines
    # which is "--program-suffix="-32" with Autoconf
    for i in "${pkgdir}/usr/bin/"*; do
        mv "$i" "$i"-32
    done

    rm -rf "${pkgdir}"/usr/include
    rm -rf "${pkgdir}"/usr/share/bash-completion/
}
