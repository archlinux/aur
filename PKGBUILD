# Maintainer: Danct12 <WkdGdVkzUXhNa0JrYVhOeWIyOTBMbTl5WndvPQo=>
pkgname=isle-portable-git
pkgver=r2091.3678c97e
pkgrel=1
pkgdesc="Portable version of LEGO Island based on decompilation effort"
arch=(x86_64)
url="https://github.com/isledecomp/isle-portable"
license=('custom:Proprietary')
depends=('mesa' 'qt6-base' 'sdl3')
makedepends=('git' 'python')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('isle-portable::git+https://github.com/isledecomp/isle-portable.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# TODO: Use native libraries
# Currently, iniparser in Arch Linux repo is broken despite
# making it using shared libraries.
build() {
    local cmake_options=(
        -DCMAKE_BUILD_TYPE=None
        -DCMAKE_INSTALL_PREFIX=/usr
        -DCMAKE_INSTALL_LIBDIR=lib
    )
    cmake -B build -S "${pkgname%-git}" "${cmake_options[@]}"
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    find "$pkgdir" -name "libSDL3.so*" -delete
}
