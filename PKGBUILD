# Maintainer: yhtez <yhtez@protonmail.com>
pkgname=obs-websocket
pkgver=5.0.0
_commit=a25427c7cc4b4f0f6ac96ebe2723fc3db8906f22
_obsver=27.2.0
pkgrel=2
pkgdesc='WebSockets API for obs-studio'
arch=('x86_64')
url="https://github.com/obsproject/$pkgname"
license=('GPL2')
depends=("obs-studio>=$_obsver")
makedepends=('asio' 'cmake' 'git' 'nlohmann-json' 'websocketpp')
source=("git+https://github.com/obsproject/obs-websocket.git#commit=$_commit"
        "git+https://github.com/nayuki/QR-Code-generator.git")
sha256sums=('SKIP'
            'SKIP')

prepare() {
    cd "$pkgname"

    # Patch CMakeLists to use system nlohmann-json headers instead of a submodule
    sed -i "s|add_subdirectory(deps/json)|find_package(nlohmann_json 3.10.0 REQUIRED)|" CMakeLists.txt

    git submodule init deps/qr
    git config submodule.deps/qr.url "$srcdir/QR-Code-generator"
    git submodule update deps/qr
}

build() {
    cmake \
        -B "$pkgname/build" \
        -S "$pkgname" \
        -DLIBOBS_INCLUDE_DIR=/usr/include/obs \
        -DCMAKE_INSTALL_PREFIX=/usr
    make -C "$pkgname/build"
}

package() {
    make -C "$pkgname/build" DESTDIR="$pkgdir" install
}
