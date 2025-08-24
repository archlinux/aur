# Maintainer: Matthew Kavanagh (https://github.com/mkavanagh-23)

pkgname=mattkavs-git
pkgver=r46.659fe42  # Will be overwritten by pkgver()
pkgrel=2
options=('!debug')
pkgdesc="A personal collection of useful functions and utilities (latest git)"
arch=('x86_64')
url="https://github.com/mkavanagh-23/MattKavs"
license=('MIT')
depends=()
provides=('mattkavs')
conflicts=('mattkavs')
makedepends=('cmake' 'git' 'catch2')
source=("git+${url}.git#branch=main")
sha256sums=('SKIP')

# Dynamic version based on git commit
pkgver() {
    cd "$srcdir/MattKavs"
    printf "r%s.%s" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/MattKavs"
    cmake -S . -B build -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

check() {
    cd "$srcdir/MattKavs/build"
    ctest --output-on-failure
}

package() {
    cd "$srcdir/MattKavs"
    DESTDIR="$pkgdir" cmake --install build
    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
