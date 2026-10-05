# Maintainer: Dheeraj Vittal Shenoy <dheerajshenoy22@gmail.com>
pkgname=lektra-git
pkgver=0.7.9
pkgrel=0
pkgdesc="High-performance document and image viewer that prioritizes screen space and control."
arch=('x86_64')
url="https://codeberg.org/lektra/lektra"
license=('AGPL-3.0')
depends=(
    'qt6-base'
    'qt6-svg'
    'qt6-imageformats'
    'libarchive'
)
optdepends=(
    'djvulibre: DjVu documents'
    'librsvg: more accurate rendering of SVG images'
    'libexif: EXIF metadata in the properties of images'
    'binutils: symbolized stack traces in crash reports'
    'xdg-utils: open links in the web browser'
    'qt6-wayland: native Wayland support'
    'kvantum: Kvantum theme engine'
    'lua-language-server: completion for init.lua, using the installed Lua stubs'
)
makedepends=('git' 'cmake' 'pkgconf')
provides=('lektra')
conflicts=('lektra' 'lektra-bin')
source=(
    "lektra::git+https://codeberg.org/lektra/lektra.git"
)
sha256sums=("SKIP")

pkgver() {
	cd "$srcdir/lektra"
	printf "%s" "$(git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")"
}

prepare() {
    cd "$srcdir/lektra"
    git submodule update --init --recursive
}

build() {
    cd "$srcdir/lektra"

    cmake -S . -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DWITH_LUA=on \
        -DWITH_LLM_SUPPORT=on

    cmake --build build --parallel
}

package() {
    cd "$srcdir/lektra"
	DESTDIR="$pkgdir" cmake --install build
}
