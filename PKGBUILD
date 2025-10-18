# Maintainer: Gary Wang <git@blumia.net>

pkgname=pineapple-midi-player
pkgver=1.4.0
pkgrel=2
pkgdesc='Simple SoundFont MIDI Player'
arch=('x86_64' 'aarch64')
url='https://github.com/BLumia/pineapple-midi-player/'
license=('MIT')
depends=(
    'qt6-svg'
    'portaudio'
)
makedepends=(
    'git'
    'qt6-tools'
    'cmake'
)
optdepends=(
    'soundfont-fluid: Decent SoundFont provided by FluidSynth'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/BLumia/pineapple-midi-player/archive/${pkgver}.tar.gz"
)
sha256sums=(
    "c354b8fcde1ca9bd7d6cd7dc16063840ae49ad90376eb06d34a1951bf3c1eb56"
)

prepare() {
    cd ${srcdir}/${pkgname}-${pkgver}
    sed -i '/96dedbd860631f83155141030a07efc3813cfbd5/a FIND_PACKAGE_ARGS' CMakeLists.txt
}

build () {
    cd ${srcdir}/${pkgname}-${pkgver}
    cmake -DFETCHCONTENT_FULLY_DISCONNECTED=ON -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr .
    cmake --build . -j`nproc`
}

package() {
    make -C ${srcdir}/${pkgname}-${pkgver} DESTDIR="$pkgdir" install
    cd ${srcdir}/${pkgname}-${pkgver}
    #make INSTALL_ROOT="$pkgdir" install
    #install -Dm755 ./ppic ${pkgdir}/usr/bin/ppic
    mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
    install ./LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
