# Maintainer: Eduardo Sánchez Muñoz (eduardosm)
# Contributor: Sebastien Chassot (sinux) <seba.ptl@sinux.net>

pkgname=pothos-git
pkgver=r2979.9da168ef
pkgrel=1
pkgdesc="The Pothos data-flow framework"
arch=('i686' 'x86_64')
url="https://github.com/pothosware/PothosCore/wiki"
license=('boost')
depends=('python' 'poco' 'soapysdr-git' 'portaudio')
makedepends=('git' 'nlohmann-json')
provides=('pothos')
conflicts=('pothos')
source=("git+https://github.com/pothosware/PothosCore.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/PothosCore"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/PothosCore"
    git submodule update --init --recursive
}

build() {
    mkdir -p "$srcdir/pothos-build"
    cd "$srcdir/pothos-build"
    cmake \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        "$srcdir/PothosCore"
    make
}

package() {
    cd "$srcdir/pothos-build"
    make DESTDIR="$pkgdir" install
}
