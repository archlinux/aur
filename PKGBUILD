# Maintainer: Luke Taylor <luket@pm.me>

pkgname=fooyin-plugin-libvgm-git
pkgver=1.0.4.r0.g2b514d4
pkgrel=1
pkgdesc="A libvgm plugin for fooyin"
url="https://github.com/fooyin/fooyin-plugin-libvgm"
arch=(x86_64)
license=(GPL-3.0-only)
depends=(
    fooyin
)
makedepends=(
    cmake
    git
)
source=(
    "$pkgname"::"git+https://github.com/fooyin/fooyin-plugin-libvgm.git"
    "libvgm"::"git+https://github.com/ValleyBell/libvgm.git"
)
sha256sums=(
    'SKIP'
    'SKIP'
)

pkgver() {
    cd "$pkgname"
    git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
    cd "$pkgname"
    git submodule init
    git config submodule.3rdparty/libvgm.url "${srcdir}/libvgm"
    git -c protocol.file.allow=always submodule update
}

build() {
    local cmake_options=(
        -B build
        -S "$pkgname"
        -W no-author
        -G Ninja
        -D CMAKE_BUILD_TYPE=None
        -D CMAKE_INSTALL_PREFIX=/usr
    )

    cmake "${cmake_options[@]}"
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}


