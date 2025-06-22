# Maintainer: Danct12 <WkdGdVkzUXhNa0JrYVhOeWIyOTBMbTl5WndvPQo=>
pkgname=isle-portable-git
pkgver=r2091.3678c97e
pkgrel=2
pkgdesc="Portable version of LEGO Island based on decompilation effort"
arch=(x86_64)
url="https://github.com/isledecomp/isle-portable"
license=('custom:Proprietary')
install="$pkgname.install"
depends=('mesa' 'qt6-base' 'sdl3')
makedepends=('cmake' 'git' 'imagemagick' 'python')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(
    'isle-portable::git+https://github.com/isledecomp/isle-portable.git'
    'isleportable.desktop'
)
sha256sums=('SKIP'
            '9205cb2248c1ba5bcaf57e9a053f50e649afe8dea7d6d13b6a95bb7f1bc4d371')

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

    # Change the binary filename to something that makes more sense
    mv "$pkgdir"/usr/bin/{isle,lego-isle}
    mv "$pkgdir"/usr/bin/{config,lego-isle-config}

    # Create desktop entry
    magick "${pkgname%-git}"/ISLE/res/isle.bmp legoisle.png
    install -Dm644 legoisle.png \
        "$pkgdir"/usr/share/icons/hicolor/32x32/apps/legoisle.png
    install -Dm644 "$srcdir"/isleportable.desktop \
        "$pkgdir"/usr/share/applications/isleportable.desktop
}
