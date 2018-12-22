# Maintainer: Eduardo Sánchez Muñoz (eduardosm)
# Contributor: Sebastien Chassot (sinux) <seba.ptl@sinux.net>

pkgname=pothos-git
pkgver=r3024.4f5f487f
pkgrel=1
pkgdesc="The Pothos data-flow framework"
arch=('i686' 'x86_64')
url="https://github.com/pothosware/PothosCore/wiki"
license=('boost')
depends=('python' 'poco' 'soapysdr-git' 'portaudio')
makedepends=('git' 'nlohmann-json')
provides=('pothos')
conflicts=('pothos')
source=(
    "git+https://github.com/pothosware/PothosCore.git"
    "PothosFlow.desktop"
)
sha256sums=(
    'SKIP'
    '4ace40dfff405cf861845cc0f9cf772a39aabc7f3447f5fdf2d0cb74f9b166c4'
)

pkgver() {
    cd "$srcdir/PothosCore"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/PothosCore"
    git submodule init
    git submodule deinit poco
    git submodule update --recursive
    # Init submodules in plotters
    git submodule update --init --recursive plotters
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
