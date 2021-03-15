# Maintainer: Daniel Playfair Cal <daniel.playfair.cal@gmail.com>

pkgname=gram-savitzky-golay-git
pkgver=r40.6c4a34a
pkgrel=1
pkgdesc="C++ Implementation of Savitzky-Golay filtering based on Gram polynomials"
arch=(x86_64)
license=(BSD2)
url="https://github.com/arntanguy/gram_savitzky_golay/"
provides=("gram-savitzky-golay")
conflicts=("gram-savitzky-golay")
depends=("eigen" "boost")
makedepends=()
optdepends=()
source=(
    "gram-savitzky-golay::git+https://github.com/hedgepigdaniel/gram_savitzky_golay.git#branch=fix-meson"
    "git+https://github.com/jrl-umi3218/jrl-cmakemodules.git"
)
md5sums=('SKIP'
         'SKIP')

pkgver() {
    cd gram-savitzky-golay
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd gram-savitzky-golay
    git submodule init
    git config submodule.cmake.url $srcdir/jrl-cmakemodules
    git submodule update
}

build() {
	cmake -B build -S gram-savitzky-golay \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib
	cmake --build build
}

package() {
    cd build
	DESTDIR="$pkgdir" make install
}
