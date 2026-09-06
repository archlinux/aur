# Maintainer: Stefan Zipproth <s.zipproth@acrion.ch>

pkgname=zelph
pkgver=1.0.1
pkgrel=1
pkgdesc="A sophisticated semantic network system capable of encoding inference rules within the network itself. Built for powerful logical reasoning, it can process the entire Wikidata knowledge graph (1.7TB) to detect contradictions and make logical deductions."
arch=('x86_64')
url="https://github.com/acrion/zelph"
license=('AGPL-3.0-or-later')
depends=('gcc-libs')
makedepends=('cmake' 'git' 'gcc' 'meson')
optdepends=('lbzip2: Speedup import of Wikidata *.json.bz2 files')
source=("git+https://github.com/acrion/zelph.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
    cd "${pkgname}"
    git submodule update --init --recursive
}

build() {
    cd "${pkgname}"
    cmake -B build -S . \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DCMAKE_BUILD_TYPE=Release

    cmake --build build
}

check() {
    cd "${pkgname}"
    ./build/bin/zelph_tests --test-suite-exclude=slow
}

package() {
    cd "${pkgname}"
    DESTDIR="$pkgdir/" cmake --install build
}
