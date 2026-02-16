# Maintainer: Your Name <your.email@example.com>
pkgname=moonlight-qt-mainline-git
pkgver=0
pkgrel=1
pkgdesc="GameStream client for PCs (Windows, Mac, Linux, and Steam Link) - Git version"
arch=('x86_64' 'aarch64')
url="https://github.com/moonlight-stream/moonlight-qt"
license=('GPL-3.0-only')
depends=('qt6-base' 'qt6-declarative' 'qt6-svg' 'qt6-wayland' 'sdl2' 'sdl2_ttf' 
         'ffmpeg' 'libva' 'libvdpau' 'opus' 'libopusenc' 'openssl' 'libxkbcommon' 
         'wayland-protocols' 'libdrm' 'mesa')
makedepends=('git' 'qt6-tools' 'pkgconf')
optdepends=('libplacebo: Vulkan renderer support (requires v7.349.0+)')
provides=('moonlight-qt')
conflicts=('moonlight-qt')
install=moonlight-qt-git.install
source=("${pkgname}::git+https://github.com/moonlight-stream/moonlight-qt.git"
        "moonlight-common-c::git+https://github.com/moonlight-stream/moonlight-common-c.git"
        "qmdnsengine::git+https://github.com/cgutman/qmdnsengine.git"
        "SDL_GameControllerDB::git+https://github.com/gabomdq/SDL_GameControllerDB.git"
        "h264bitstream::git+https://github.com/aizvorski/h264bitstream.git"
        "libs::git+https://github.com/cgutman/moonlight-qt-prebuilts.git")
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$pkgname"
    git submodule init
    git config submodule.app/SDL_GameControllerDB.url "$srcdir/SDL_GameControllerDB"
    git config submodule.h264bitstream/h264bitstream.url "$srcdir/h264bitstream"
    git config submodule.libs.url "$srcdir/libs"
    git config submodule.moonlight-common-c/moonlight-common-c.url "$srcdir/moonlight-common-c"
    git config submodule.qmdnsengine/qmdnsengine.url "$srcdir/qmdnsengine"
    git -c protocol.file.allow=always submodule update --init --recursive
}

build() {
    cd "$pkgname"
    qmake6 moonlight-qt.pro
    make release
}

package() {
    cd "$pkgname"
    make INSTALL_ROOT="$pkgdir" install
}
