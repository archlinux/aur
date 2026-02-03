# Maintainer: Harish Rajagopal <harish dot rajagopals at gmail dot com>

_pkgname=BB_Launcher
pkgname=${_pkgname,,}
pkgver=13.04
pkgrel=1
pkgdesc='Simple launcher for Bloodborne shadPS4'
url="https://github.com/rainmakerv3/$_pkgname"
license=(GPL-3.0-or-later)
arch=(x86_64)
depends=(crypto++
         gcc-libs
         glibc
         hicolor-icon-theme
         pugixml
         qt6-base
         qt6-webengine
         qt6-websockets
         sdl3
         zlib)
makedepends=(git
             cmake
             fmt
             qt6-webview
             toml11
             vulkan-headers
             zlib-ng)
source=("$_pkgname::git+$url.git#tag=Release$pkgver"
        "nlohmann-json::git+https://github.com/nlohmann/json.git"
        "qmicroz::git+https://github.com/artemvlas/qmicroz.git"
        "volk::git+https://github.com/zeux/volk.git")
sha256sums=('e3311feaf5b1ff9087704ecdff47b4274f8ef8154748223717ffd041598da321'
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
    DESTDIR="$pkgdir" cmake --install build --prefix /usr
}
