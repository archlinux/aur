pkgname=kurento-media-server
pkgver=6.13.0
pkgrel=2
pkgdesc="Kurento WebRTC media server"
arch=(any)
url="https://github.com/Kurento/kurento-media-server"
license=('apache')
depends=(kms-core boost)
optdepends=(kms-elements kms-filters)
makedepends=(kms-cmake-utils "websocketpp>=0.8.2")
source=(
    "git://github.com/Kurento/kurento-media-server.git#tag=$pkgver"
    cmake-boost.patch
)
sha256sums=(SKIP SKIP)
backup=(
    etc/kurento/kurento.conf.json
    etc/kurento/sdp_pattern.txt
)

prepare() {
    cd "$srcdir/$pkgname"
    patch -p0 <"$srcdir/cmake-boost.patch"
    sed -ri -e 's#gstreamer((-[-a-z]+)?)-1\.5#gstreamer\1-1.0#g' CMakeLists.txt
    rm -r server/transport/websocket/websocketpp
    ln -s /usr/include/websocketpp server/transport/websocket/websocketpp
}

build() {
    local builddir=$srcdir/$pkgname/build
    rm -rf "$builddir"
    mkdir "$builddir"
    cd "$builddir"
    cmake -DCMAKE_MODULE_PATH=/usr/share/cmake/Modules -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_SYSCONFDIR=/etc -DCMAKE_BUILD_TYPE=Release ..
    make
}

package() {
    local builddir=$srcdir/$pkgname/build
    cd "$builddir"
    make install DESTDIR="$pkgdir"
}
