# Maintainer: Harish Rajagopal <harish dot rajagopals at gmail dot com>

_pkgname=BB_Launcher
pkgname=${_pkgname,,}
pkgver=13.06
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
        "nlohmann-json::git+https://github.com/nlohmann/json.git#commit=11cc676142d9ca85cc40a60330ed1b081c3afc6d"
        "qmicroz::git+https://github.com/artemvlas/qmicroz.git#commit=14d6e8154628b7e9cdd37e78cf0e6f93785257a3"
        "volk::git+https://github.com/zeux/volk.git#commit=9767549a8bba5454555764ee0f3319bc5d205da9")
sha256sums=('d366a207b80367795c9a19a74833be838d5a9daddd0a65b067dcfb1832b5887d'
            '716398fce8d8bd0d477c9ff0277e3c4f0f3e2b2d2a7f0e948c9407a85c97f63e'
            'a006b22a89af4b5b7981f3b1375fbcf96e4d027105dd4537959b032cc206399c'
            'e7284d206228f5f84e4e8a67b38a95f08b5db2a8d1b882d68b0f0782df55f078')

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
