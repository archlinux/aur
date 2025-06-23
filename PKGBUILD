# Maintainer: Danct12 <WkdGdVkzUXhNa0JrYVhOeWIyOTBMbTl5WndvPQo=>
pkgname=isle-portable-git
pkgver=r2105.19fee553
pkgrel=1
pkgdesc="Portable version of LEGO Island based on decompilation effort"
arch=(x86_64)
url="https://github.com/isledecomp/isle-portable"
license=('custom:Proprietary')
install="$pkgname.install"
depends=('iniparser' 'mesa' 'qt6-base' 'sdl3')
makedepends=('cmake' 'git' 'imagemagick' 'python')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(
    'isle-portable::git+https://github.com/isledecomp/isle-portable.git'
    'isleportable.desktop'
)
sha256sums=('SKIP'
            'b6f1c0f986c04b0da5dfbd42f8c999e6d0cc0709d9e79867ea8597845cc64f2f')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
    git submodule update --init
}

build() {
    local cmake_options=(
        -DCMAKE_BUILD_TYPE=None
        -DCMAKE_INSTALL_PREFIX=/usr
        -DCMAKE_INSTALL_LIBDIR=lib
        -DDOWNLOAD_DEPENDENCIES=OFF
    )
    cmake -B build -S "${pkgname%-git}" "${cmake_options[@]}"
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build

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
