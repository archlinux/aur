# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname=woof-doom
_pkgname=woof
pkgver=16.0.0
pkgrel=1
pkgdesc="Woof! is a continuation of Lee Killough's Doom source port MBF targeted at modern systems"
arch=(x86_64)
url="https://github.com/fabiangreffrath/woof"
license=('GPL-2.0-or-later')
depends=(sdl3 openal alsa-lib libebur128 libsndfile libspng miniz)
# Required for some ID24 lumps (https://doomwiki.org/wiki/ID24), you probably want it.
depends+=(yyjson)
# FluidSynth is optional, but can not be an optdepends since it gets linked to the built executable
# Required for high-quality MIDI music, you probably want it.
depends+=(fluidsynth)
# Ditto for libxmp with respect to optdepends. Required for tracker music, you may not want it
depends+=(libxmp)
optdepends=("soundfont-fluid: soundfont for MIDI playback")
install=install.sh
makedepends=(cmake python3)
conflicts=(woof-doom-git)
source=("https://github.com/fabiangreffrath/${_pkgname}/archive/refs/tags/${_pkgname}_${pkgver}.tar.gz")
sha256sums=(293bc5ad61eaac191ee1cb652c797819459a7f7819d4aec78a847c8e13695342)

build() {
    # Use `-ffile-prefix-map` to avoid 'WARNING: Package contains reference to $srcdir' due to assert(...)
    cmake -B build -S "${_pkgname}-${_pkgname}_${pkgver}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_C_FLAGS="$CFLAGS -ffile-prefix-map=$PWD=" \
        -Wno-author
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
