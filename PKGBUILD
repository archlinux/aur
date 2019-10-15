# Maintainer: Jon Noble <jonnobleuk@gmail.com>
pkgname=halide-git
pkgver=r19227.9bbcb6b4f
pkgrel=1
pkgdesc="Halide library from github"
arch=(x86_64)
url="https://halide-lang.org/"
license=('MIT')
groups=()
depends=('llvm>=8.0' 'cmake>=3.8')
makedepends=('git') 
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}" "halide-bin")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/halide/Halide.git') #https://github.com/halide/Halide.git
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
            -DWARNINGS_AS_ERRORS=False -DWITH_APPS=False -DBUILD_AOT_TUTORIAL=False -DWITH_UTILS=False ..
    CC="clang" CXX="clang++" make -j
}

check() {
    cd "$srcdir/Halide/build"
    #make -k check
}

package() {
    cd "$srcdir/Halide/build"
    make DESTDIR="$pkgdir/" install
    rm -rf "${pkgdir}/usr/local/tutorial/"
    rm -rf "${pkgdir}/usr/local/tools/"
    find ${pkgdir} -type f -name "*.md" -delete
    find ${pkgdir} -type f -name "*.*make" -delete
}
