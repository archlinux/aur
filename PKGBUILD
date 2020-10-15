# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: Jon Noble <jonnobleuk@gmail.com>
pkgname=halide-git
pkgver=2019_08_27.r2898.g2531d11d2
pkgrel=1
pkgdesc="a language for fast, portable data-parallel computation"
arch=(x86_64)
url="https://halide-lang.org/"
license=('MIT')
depends=('llvm>=8.0')
makedepends=('git' 'cmake>=3.8' 'binutils' 'fakeroot' 'make' 'clang') 
provides=("${pkgname%-*}")
conflicts=("halide-bin")
source=('git+https://github.com/halide/Halide.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/Halide"
    git describe --long --tags | sed 's/^release_//; s/\([^-]*-g\)/r\1/; y/-/./'
}

prepare() {
    cd "$srcdir/Halide"
    rm -rf "build/*"
    mkdir -p build
}

build() {
    cd "$srcdir/Halide/build"
    cmake   -DWITH_TESTS=False -DWITH_DOCS=False -DWITH_TUTORIALS=False -DWARNINGS_AS_ERRORS=False \
            -DWITH_APPS=False -DBUILD_AOT_TUTORIAL=False -DWITH_UTILS=False -DCMAKE_INSTALL_PREFIX=/usr \
            ..
    make
}

check() {
    cd "$srcdir/Halide/build"
}

package() {
    cd "$srcdir/Halide/build"
    make DESTDIR="$pkgdir/" install
    rm -rf "${pkgdir}/usr/share/tutorial/"
    rm -rf "${pkgdir}/usr/share/tools/"

    install --directory "${pkgdir}/usr/include/Halide"
    find "${pkgdir}/usr/include/" -maxdepth 1 -type f -exec mv '{}' "${pkgdir}/usr/include/Halide/" ';'
    find ${pkgdir} -type f -name "*.md" -delete
    install -Dm644 "$srcdir/Halide/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
