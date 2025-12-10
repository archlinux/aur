# Maintainer: hype-vhs <4498312-hypevhs@users.noreply.gitlab.com>
# Contributor: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname=nugget-doom
_pkgname=nugget-doom
_tardir="Nugget-Doom-$_pkgname"
pkgver=4.5.0
pkgrel=1
pkgdesc="Fork of Woof! with additional features"
arch=('x86_64')
url="https://github.com/fabiangreffrath/woof"
license=('GPL-2.0-or-later')
depends=(sdl2 sdl2_net alsa-lib openal libsndfile libebur128 hicolor-icon-theme glibc)
# FluidSynth is optional, but can not be an optdepends since it gets linked to the built executable
# Required for high-quality MIDI music, you probably want it.
depends+=(fluidsynth)
# Ditto for libxmp with respect to optdepends. Required for tracker music, you may not want it
depends+=(libxmp)
optdepends=("soundfont-fluid: soundfont for MIDI playback")
install=install.sh
makedepends=(cmake python3)
url="https://github.com/MrAlaux/Nugget-Doom"
source=("$_pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/$pkgname-$pkgver.tar.gz")
sha256sums=('f45d2dab4dd37134d33698b2fd172bf23d9ae00a55829fcbc04acd4b6793c60a')

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
