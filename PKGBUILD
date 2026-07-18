# Maintainer: Harish Rajagopal <harish dot rajagopals at gmail dot com>

_pkgname=BB_Launcher
pkgname=${_pkgname,,}
pkgver=16.04
pkgrel=1
pkgdesc='Dedicated launcher/mod manager combo app for Bloodborne on shadPS4'
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
        "libarchive::git+https://github.com/libarchive/libarchive.git#commit=bede9a36921b3ee6ac01f60ce2715bdecf9f4b1f"
        "nlohmann-json::git+https://github.com/nlohmann/json.git#commit=11cc676142d9ca85cc40a60330ed1b081c3afc6d"
        "qmicroz::git+https://github.com/artemvlas/qmicroz.git#commit=14d6e8154628b7e9cdd37e78cf0e6f93785257a3"
        "volk::git+https://github.com/zeux/volk.git#commit=9767549a8bba5454555764ee0f3319bc5d205da9"
        "xz::git+https://github.com/tukaani-project/xz.git#commit=1aab7e9cab1293c2b8a481ed1beac94da21ef04f")
sha256sums=('272f1d9723b72797814e11188467c88ba7a72a05b2af540253d4c0ffa32e17e1'
            '352c11078664e70bc69cb215b3250508d8a99111198c41df296553f95d8d37d1'
            '716398fce8d8bd0d477c9ff0277e3c4f0f3e2b2d2a7f0e948c9407a85c97f63e'
            'a006b22a89af4b5b7981f3b1375fbcf96e4d027105dd4537959b032cc206399c'
            'e7284d206228f5f84e4e8a67b38a95f08b5db2a8d1b882d68b0f0782df55f078'
            '6de17e12ddcf49348900737fc33b4665ac5823032930d7e6096d7c182eb74440')

prepare() {
    cd "$_pkgname"
    git config submodule.externals/json.url ../nlohmann-json
    git config submodule.externals/libarchive.url ../libarchive
    git config submodule.externals/microz.url ../qmicroz
    git config submodule.externals/volk.url ../volk
    git config submodule.externals/xz.url ../xz
    git -c protocol.file.allow=always submodule update
}

build() {
    cmake -B build -DCMAKE_BUILD_TYPE=Release -S "$_pkgname"
    cmake --build build --config Release
}

package() {
    DESTDIR="$pkgdir" cmake --install build --prefix /usr
}
