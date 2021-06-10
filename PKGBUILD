# Maintainer: Alex Xu (Hello71) <alex_y_xu@yahoo.ca>
_pkgname=sdl12-compat
pkgname=$_pkgname-git
pkgver=r360.f7e60cd
pkgrel=1
pkgdesc="An SDL-1.2 compatibility layer that uses SDL 2.0 behind the scenes."
arch=(x86_64)
url="https://github.com/libsdl-org/sdl12-compat"
license=(ZLIB MIT)
depends=(sdl2)
makedepends=(cmake git ninja)
provides=(sdl=1.2)
conflicts=(sdl)
source=(git+https://github.com/libsdl-org/sdl12-compat.git)
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cmake -B "$_pkgname-build" -S "$_pkgname" -G Ninja \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DSDL12TESTS=OFF \
        -Wno-dev
    ninja -C "$_pkgname-build"
}

package() {
    DESTDIR="$pkgdir" ninja -C "$_pkgname-build" install
    install -Dm644 "$_pkgname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
