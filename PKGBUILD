# Maintainer: initMayday <initMayday@protonmail.com>

pkgname=yoga
pkgver=v3.2.1
pkgrel=1
pkgdesc="Yoga is an embeddable layout engine targeting web standards."
arch=('any')
url="https://github.com/facebook/yoga"
license=('MIT')
#depends=()
makedepends=(git cmake)
source=("git+https://github.com/facebook/yoga.git")
sha256sums=(SKIP)

#> Override LTO injection - This breaks it for cuarzo, and other software, not expecting LTO
LTOFLAGS=""
options=(!lto)

pkgver() {
    cd "$pkgname"
    echo "$(git tag | grep -E 'v[0-9]+\.[0-9]+\.[0-9]+' | tail -1)"
}
prepare() {
    cd "$pkgname"
    git checkout $(git tag | grep -E 'v[0-9]+\.[0-9]+\.[0-9]+' | tail -1)
    #> Don't parse the test suite
    sed -i '/add_subdirectory(tests)/d' CMakeLists.txt
}

build() {
    cd "$pkgname"
    #> Override LTO
    cmake -B build -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=OFF
    cmake --build build
}

package() {
    cd $pkgname
    DESTDIR="$pkgdir" cmake --install build
}
