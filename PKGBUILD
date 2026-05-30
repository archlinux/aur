# Maintainer: Zack Bartel <zack@bartel.com>

pkgname=hyprwat-git
pkgver=0.11.5
pkgrel=1
pkgdesc="Hyprwat - A Wayland menu tool (Git version)"
arch=('x86_64')
url="https://github.com/zackb/hyprwat"
license=('MIT')
depends=('wayland' 'mesa' 'fontconfig' 'libxkbcommon' 'sdbus-cpp' 'pipewire' 'libdrm')
makedepends=('cmake' 'ninja' 'git')
provides=('hyprwat')
conflicts=('hyprwat' 'hyprwat-bin')
source=("git+${url}.git"
        "imgui-submodule::git+https://github.com/ocornut/imgui.git")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
    cd "${pkgname%-git}"
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//' ||
    printf "0.11.2.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${pkgname%-git}"
    git submodule init ext/imgui
    git config submodule.ext/imgui.url "$srcdir/imgui-submodule"
    git -c protocol.file.allow=always submodule update ext/imgui
}

build() {
    cmake -B build -S "${pkgname%-git}" -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
