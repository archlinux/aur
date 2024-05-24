# Maintainer: Nakidai <plaza521 at inbox dot ru>
pkgname=vectozavr-shooter-git
pkgdesc="Multiplayer shooter written in C++"
url="https://github.com/vectozavr/shooter"
license=("MIT")

pkgver=0.1.1.r9.g0db3301
pkgrel=4

arch=("x86_64")
depends=("sfml" "openal")
makedepends=("gcc" "cmake" "git")

source=(
    "$pkgname::git+https://github.com/vectozavr/shooter.git#branch=master"
    "3dzavr::git+https://github.com/vectozavr/3dzavr.git#branch=sfml_version"
    "vectozavr-shooter.sh"
)
sha256sums=('SKIP'
            'SKIP'
            'e9bf38e4957c8a8c9407fd3cf1bfeeca5e85c21b2fde2859c0e30a9635182330')

pkgver() {
    cd "$pkgname"
    git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$pkgname"
    git submodule init
    git config submodule.3dzavr.url "$srcdir/3dzavr"
    git -c protocol.file.allow=always submodule update
}

build() {
    cd "$pkgname"
    cmake -B build .
    cmake --build build
}

package() {
    mkdir -p "$pkgdir/opt/"
    mkdir -p "$pkgdir/usr/bin/"
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"

    install -Dm755 "vectozavr-shooter.sh" "$pkgdir/usr/bin/vectozavr-shooter"
    install -Dm644 "$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    cp -r "$pkgname" "$pkgdir/opt/"
    chmod 755 "$pkgdir/opt"
    rm -rf "$pkgdir/opt/$pkgname/build" $(find "$pkgdir/opt/$pkgname" -regex '.*\.\(h\|cpp\)$')
}
