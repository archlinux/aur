# Maintainer: Jon Noble <jonnobleuk@gmail.com>
pkgname=halide-git
pkgver=r19251.c0128b389
pkgrel=1
pkgdesc="a language for fast, portable data-parallel computation"
arch=(x86_64)
url="https://halide-lang.org/"
license=('MIT')
groups=()
depends=('llvm>=8.0' 'cmake>=3.8' 'clang' 'fakeroot')
makedepends=('git') 
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
            -DWARNINGS_AS_ERRORS=False -DWITH_APPS=False -DBUILD_AOT_TUTORIAL=False -DWITH_UTILS=False ..
    CORES=$(cat /proc/cpuinfo | grep -c "vendor_id")                
    make clean
    make -j${CORES} -l${CORES}
}

check() {
    cd "$srcdir/Halide/build"
}

package() {
    cd "$srcdir/Halide/build"
    make DESTDIR="$pkgdir/" install    
    rm -rf "${pkgdir}/usr/local/tutorial/"
    rm -rf "${pkgdir}/usr/local/tools/"
    
    mkdir "${pkgdir}/usr/local/lib"
    mkdir "${pkgdir}/usr/local/include/Halide"
    mv "${pkgdir}/usr/local/bin/libHalide.so" "${pkgdir}/usr/local/lib/"
    find "${pkgdir}/usr/local/include/" -maxdepth 1 -type f -exec mv {} "${pkgdir}/usr/local/include/Halide" \;
    rmdir "${pkgdir}/usr/local/bin/"
    find ${pkgdir} -type f -name "*.md" -delete
    find ${pkgdir} -type f -name "*.*make" -delete
}
