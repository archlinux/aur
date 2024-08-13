# Maintainer: Maddie Mewmews <maddie at mewmews dot gay>
# Contributor: hype-vhs <4498312-hypevhs@users.noreply.gitlab.com>
# Contributor: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname=cherry-doom
_pkgname=cherry-doom
_tardir="Cherry-Doom-$_pkgname"
pkgver=2.0.0
pkgrel=1
pkgdesc="Fork of Nugget Doom with more additional features"
arch=('x86_64')
url="https://github.com/fabiangreffrath/woof"
license=('GPL2')
depends=(sdl2 sdl2_net openal libsndfile hicolor-icon-theme glibc)
# FluidSynth is optional, but can not be an optdepends since it gets linked to the built executable
# Required for high-quality MIDI music, you probably want it.
depends+=(fluidsynth)
# Ditto for libxmp with respect to optdepends. Required for tracker music, you may not want it
depends+=(libxmp)
optdepends=("soundfont-fluid: soundfont for MIDI playback")
install=install.sh
makedepends=(cmake python3)
url="https://github.com/xemonix0/Cherry-Doom/"
source=("$_pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/$pkgname-$pkgver.tar.gz")
b2sums=('b3ba2e6b558ca3cdd9f5cf73c22bbbc438be984c580c542a7b4202969ecae321bf3be07b0393a3cc9c0a44225b8c80d3d8b80717f6831c0d774b284212764e42')

build() {
    # Use `-ffile-prefix-map` to avoid 'WARNING: Package contains reference to $srcdir' due to assert(...)
    cmake -B build -S "$_tardir-$pkgver" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_C_FLAGS="$CFLAGS -ffile-prefix-map=$PWD=" \
        -Wno-dev
    cmake --build build
}

check() {
    cd build
    ctest --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
