# Maintainer: Daniel Playfair Cal <daniel.playfair.cal@gmail.com>

pkgname=gram-savitzky-golay-git
pkgver=r38.762e560
pkgrel=1
pkgdesc="C++ Implementation of Savitzky-Golay filtering based on Gram polynomials"
arch=(x86_64)
license=(BSD2)
url="https://github.com/arntanguy/gram_savitzky_golay/"
depends=("eigen" "boost")
makedepends=()
optdepends=()
source=(
    "gram-savitzky-golay::git+https://github.com/hedgepigdaniel/gram_savitzky_golay.git#branch=fix-meson"
    "git+https://github.com/jrl-umi3218/jrl-cmakemodules.git"
    build.patch
)
md5sums=('SKIP'
         'SKIP'
         '18b9cc3fc5f5b8f35d8e698ce70486a2')

pkgver() {
    cd gram-savitzky-golay
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd gram-savitzky-golay
    patch -Np1 -i ../build.patch
    git submodule init
    git config submodule.cmake.url $srcdir/jrl-cmakemodules
    git submodule update
}

build() {
	cmake -B build -S gram-savitzky-golay \
        -DBUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib
	cmake --build build
}

package() {
    cd build
	DESTDIR="$pkgdir" make install
}
