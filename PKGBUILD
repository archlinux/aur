# Maintainer: Danct12 <WkdGdVkzUXhNa0JrYVhOeWIyOTBMbTl5WndvPQo=>
pkgname=isle-portable-git
pkgver=r2160.ba14b482
pkgrel=1
pkgdesc="Portable version of LEGO Island based on decompilation effort"
arch=(x86_64 armv7h aarch64)
url="https://github.com/isledecomp/isle-portable"
license=('LGPL-3.0-or-later')
install="$pkgname.install"
depends=('iniparser' 'mesa' 'qt6-base' 'sdl3')
makedepends=('cmake' 'git' 'python')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(
    'git+https://github.com/isledecomp/isle-portable.git'
    'git+https://github.com/ocornut/imgui'
    'git+https://github.com/mackron/miniaudio'
    'foxtacles-libsmacker::git+https://github.com/foxtacles/libsmacker'
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
    git submodule init

    git config submodule.imgui.url "$srcdir/imgui"
    git config submodule.3rdparty/miniaudio.url "$srcdir/miniaudio"
    git config submodule.3rdparty/libsmacker.url "$srcdir/foxtacles-libsmacker"

    git -c protocol.file.allow=always submodule update
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
}
