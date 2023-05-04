# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname=woof-doom
_pkgname=woof
pkgver=11.0.0
pkgrel=1
pkgdesc="Woof! is a continuation of Lee Killough's Doom source port MBF targeted at modern systems"
arch=(x86_64)
url="https://github.com/fabiangreffrath/woof"
license=('GPL2')
depends=(sdl2 sdl2_net openal libsndfile)
# FluidSynth is optional, but can not be an optdepends since it gets linked to the built executable
# Required for high-quality MIDI music, you probably want it.
depends+=(fluidsynth)
# Ditto for libxmp with respect to optdepends. Required for tracker music, you may not want it
depends+=(libxmp)
optdepends=("soundfont-fluid: soundfont for MIDI playback")
install=install.sh
makedepends=(cmake python3)
conflicts=(woof-git)
source=("https://github.com/fabiangreffrath/${_pkgname}/archive/refs/tags/${_pkgname}_${pkgver}.tar.gz")
sha256sums=(434f78fefb24a99a1dd693e67f8587d4b4c0ad0c2e3e97073ef8ef563a95bd05)

source+=(0001-Fall-back-to-OPL-on-MIDI-initialization-failure.patch)
sha256sums+=(7d5bd6a9de3acbfccbd88c1639902360fd4b79f53ae230af8b742d839b6ab4c0)
prepare() {
    patch -d "${_pkgname}-${_pkgname}_${pkgver}" -Np1 -i ../0001-Fall-back-to-OPL-on-MIDI-initialization-failure.patch
}

build() {
    # Use `-ffile-prefix-map` to avoid 'WARNING: Package contains reference to $srcdir' due to assert(...)
    cmake -B build -S "${_pkgname}-${_pkgname}_${pkgver}" \
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
