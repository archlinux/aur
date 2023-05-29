# Maintainer: bretello <bretello@distruzione.org>
pkgname=asteroidsyncservice-git
pkgver=r108.ba7eecf
pkgrel=1
pkgdesc="A synchronization daemon for AsteroidOS watches"
arch=(any)
url="https://github.com/AsteroidOS/asteroidsyncservice"
license=('GPL3')
depends=(bluez)
makedepends=(cmake qt6-connectivity)
source=("git+https://github.com/AsteroidOS/asteroidsyncservice")
sha256sums=(SKIP)


pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


prepare() {
    cd "$srcdir/${pkgname%-git}"
    git submodule update --init
}

build() {
    cd "$srcdir/${pkgname%-git}"

    cmake \
        -DCMAKE_BUILD_TYPE=Release  \
        -DDESKTOP_PLATFORM=ON       \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -S. -B build
    cmake --build build -j
}

package() {
    cd "$srcdir/${pkgname%-git}"
    DESTDIR="$pkgdir" cmake --build build -j -t install

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}
