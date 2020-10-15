# Maintainer: Jon Noble <jonnobleuk@gmail.com>
pkgname=halide-git
pkgver=r19445.6156f3259
pkgrel=1
pkgdesc="a language for fast, portable data-parallel computation"
arch=(x86_64)
url="https://halide-lang.org/"
license=('MIT')
groups=()
depends=('llvm>=8.0')
makedepends=('git' 'cmake>=3.8' 'binutils' 'fakeroot' 'make' 'clang') 
provides=("${pkgname%-VCS}")
conflicts=("halide-bin")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/halide/Halide.git')
noextract=()
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/Halide"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/Halide"
    rm -rf "build/*"
    mkdir -p build
}

build() {
    cd "$srcdir/Halide/build"
    cmake   -DCMAKE_BUILD_TYPE=Release -DWITH_TESTS=False -DWITH_DOCS=False -DWITH_TUTORIALS=False \
            -DWARNINGS_AS_ERRORS=False -DWITH_APPS=False -DBUILD_AOT_TUTORIAL=False -DWITH_UTILS=False \
            -DCMAKE_INSTALL_PREFIX=/usr ..
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
