# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname=woof-doom
_pkgname=woof
pkgver=10.5.1
pkgrel=1
pkgdesc="Woof! is a continuation of Lee Killough's Doom source port MBF targeted at modern systems"
arch=(x86_64)
url="https://github.com/fabiangreffrath/woof"
license=('GPL2')
# NOTE: FluidSynth can be added as a dependency, but it is not a proper optional dependency (optdepends),
# as it needs to be available at build time, then it is linked into the executable and can't be uninstalled anymore
# Additionally, since sdl2_mixer can also FluidSynth, we don't miss much by not including it
depends=(sdl2 sdl2_net sdl2_mixer)
makedepends=(cmake python3)
conflicts=(woof-git)
source=("https://github.com/fabiangreffrath/${_pkgname}/archive/refs/tags/${_pkgname}_${pkgver}.tar.gz")
sha256sums=(a6eb83db3dde985525181f16ada9a89d96358310c1d3b3e97c3302e1afe8cc36)

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
