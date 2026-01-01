# Maintainer: Harish Rajagopal <harish dot rajagopals at gmail dot com>

_pkgname=BB_Launcher
pkgname=${_pkgname,,}
pkgver=13.01
pkgrel=1
pkgdesc='Simple launcher for Bloodborne shadPS4'
url="https://github.com/rainmakerv3/$_pkgname"
license=(GPL-3.0-or-later)
arch=(x86_64)
depends=(crypto++
         libx11
         libxkbcommon
         qt6-base
         qt6-declarative
         qt6-webengine
         qt6-websockets
         qt6-webview
         sdl3)
makedepends=(git
             cmake
             fmt
             pugixml
             toml11
             vulkan-headers
             zlib-ng)
source=("$_pkgname::git+$url.git#tag=Release$pkgver"
        "nlohmann-json::git+https://github.com/nlohmann/json.git"
        "qmicroz::git+https://github.com/artemvlas/qmicroz.git"
        "volk::git+https://github.com/zeux/volk.git")
sha256sums=('3e4e86f8a7b83acd6fe6fd8edfd7255dc3c9d8143168ba18605e82af88c5fefe'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
    cd "$_pkgname"
    git config submodule.externals/json.url ../nlohmann-json
    git config submodule.externals/microz.url ../qmicroz
    git config submodule.externals/volk.url ../volk
    git -c protocol.file.allow=always submodule update
}

build() {
    cmake -B build -DCMAKE_BUILD_TYPE=Release -S "$_pkgname"
    cmake --build build --config Release
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
