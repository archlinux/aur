pkgname=kurento-media-server
pkgver=6.17.0
pkgrel=3
pkgdesc="Kurento WebRTC media server"
arch=(x86_64)
url="https://github.com/Kurento/kurento-media-server"
license=('apache')
depends=(kms-core boost)
optdepends=(kms-elements kms-filters)
makedepends=(kms-cmake-utils libevent websocketpp)
source=(
    "git+https://github.com/Kurento/kurento-media-server.git#tag=$pkgver"
    'https://raw.githubusercontent.com/vmarkovtsev/DeathHandler/911e4df429a89309b10111d76d232d4a7c2b5485/death_handler.cc'
    'https://raw.githubusercontent.com/vmarkovtsev/DeathHandler/911e4df429a89309b10111d76d232d4a7c2b5485/death_handler.h'
)
sha256sums=(SKIP SKIP SKIP)
backup=(
    etc/kurento/kurento.conf.json
    etc/kurento/sdp_pattern.txt
)

prepare() {
    cd "$srcdir/$pkgname"
    sed -ri -e 's#gstreamer((-[-a-z]+)?)-1\.5#gstreamer\1-1.0#g' CMakeLists.txt
    sed -i 's/ 0.7.0//' server/transport/websocket/CMakeLists.txt
    cp ../death_handler.cc server/death_handler.cpp
    cp ../death_handler.h server/death_handler.hpp
    ln -s death_handler.hpp server/death_handler.h
}

build() {
    local builddir=$srcdir/$pkgname/build
    rm -rf "$builddir"
    mkdir "$builddir"
    cd "$builddir"
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_SYSCONFDIR=/etc -DCMAKE_BUILD_TYPE=Release ..
    make
}

package() {
    local builddir=$srcdir/$pkgname/build
    cd "$builddir"
    make install DESTDIR="$pkgdir"
}

