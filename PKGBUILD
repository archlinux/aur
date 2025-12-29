# Maintainer: jabra11 <jabra11.gpg@gmail.com>
pkgname=seer-gdb-git
pkgver=r1468.9b99897
pkgrel=1
pkgdesc="Seer - a gui frontend to gdb"
arch=('x86_64')
url="https://github.com/epasveer/seer.git"
license=('GPL3')
depends=('qt6-base' 'gdb' 'qt6-charts')
conflicts=("${pkgname%-git}")
makedepends=('git' 'gcc' 'cmake' 'qt6-base' 'qt6-charts')
provides=("${pkgname%-git}")
source=("${pkgname%-gdb-git}::git+https://github.com/epasveer/${pkgname%-gdb-git}.git")
md5sums=('SKIP')

pkgver() {
        cd "${pkgname%-gdb-git}"
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
        [ ! -d "build" ] && mkdir build
        cmake -S ${pkgname%-gdb-git}/src -B build -DCMAKE_BUILD_TYPE=Release
        cd build
        cmake --build . --target seergdb
}

package() {
    cmake --install build --prefix "$pkgdir/usr/"

    cd "$srcdir/${pkgname%-gdb-git}"

    install -Dm644 src/resources/seergdb.desktop "$pkgdir/usr/share/application/seergdb.desktop"

    local i
    for i in 32 64 128 256 512; do
        install -Dm644 "src/resources/icons/hicolor/${i}x${i}/seergdb.png" "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/seergdb.png"
    done
}
