# Maintainer: Eduardo Sánchez Muñoz (eduardosm)
# Contributor: Sebastien Chassot (sinux) <seba.ptl@sinux.net>

pkgname=pothos
pkgver=0.6.1
pkgrel=1
pkgdesc="The Pothos data-flow framework"
arch=('i686' 'x86_64')
url="https://github.com/pothosware/PothosCore/wiki"
license=('boost')
depends=('python' 'poco' 'qwt' 'soapysdr-git' 'portaudio')
makedepends=('git' 'nlohmann-json')
source=(
    "git+https://github.com/pothosware/PothosCore.git#tag=pothos-$pkgver"
    "spuce-qt-workaround.diff"
    "PothosFlow.desktop"
)
sha256sums=(
    'SKIP'
    '3bc94fcdd8a944a58906294d35ec8e2bde2ae6d53806f3413c8c302172058f3f'
    '4ace40dfff405cf861845cc0f9cf772a39aabc7f3447f5fdf2d0cb74f9b166c4'
)

prepare() {
    cd "$srcdir/PothosCore"
    git submodule init
    git submodule deinit poco
    git submodule update --recursive --force
    
    cd spuce
    git apply "$srcdir/spuce-qt-workaround.diff"
}

build() {
    mkdir -p "$srcdir/pothos-build"
    cd "$srcdir/pothos-build"
    cmake \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DENABLE_INTERNAL_POCO=OFF \
        -DENABLE_INTERNAL_MUPARSERX=ON \
        -DENABLE_INTERNAL_SPUCE=ON \
        "$srcdir/PothosCore"
    make
}

package() {
    cd "$srcdir/pothos-build"
    make DESTDIR="$pkgdir" install
    
    install -Dm644 "$srcdir/PothosFlow.desktop" "$pkgdir/usr/share/applications/PothosFlow.desktop"
    install -Dm644 "$srcdir/PothosCore/flow/icons/PothosFlow.png" "$pkgdir/usr/share/pixmaps/PothosFlow.png"
}
