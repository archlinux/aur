pkgname=kms-core
pkgver=6.17.0
pkgrel=4
pkgdesc="Kurento media server core library"
arch=(x86_64)
url="https://github.com/Kurento/kms-core"
license=(apache)
depends=(boost libsigc++ glibmm gstreamer gst-plugins-base kms-jsoncpp kms-jsonrpc)
makedepends=(kms-cmake-utils kurento-module-creator libvpx)
source=(
    "git+https://github.com/Kurento/$pkgname.git#tag=$pkgver"
    kmscore.c.patch
    register-parent-string.patch
)
sha256sums=(SKIP SKIP SKIP)
backup=(
    etc/kurento/modules/kurento/BaseRtpEndpoint.conf.ini
    etc/kurento/modules/kurento/MediaElement.conf.ini
    etc/kurento/modules/kurento/SdpEndpoint.conf.json
    etc/kurento/modules/kurento/UriEndpoint.conf.ini
)

prepare() {
    cd "$srcdir/$pkgname"
    patch -p1 <"$srcdir/kmscore.c.patch"
    patch -p0 <"$srcdir/register-parent-string.patch"
    sed -ri -e 's#gstreamer((-[-a-z]+)?)-1\.5#gstreamer\1-1.0#g' {,*/,*/*/,*/*/*/,*/*/*/*/}CMakeLists.txt
}

build() {
    local builddir=$srcdir/$pkgname/build
    rm -rf "$builddir"
    mkdir "$builddir"
    cd "$builddir"
    cmake -DCMAKE_MODULES_INSTALL_DIR=/usr/share/cmake/Modules -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_SYSCONFDIR=/etc -DCMAKE_BUILD_TYPE=Release ..
    make
}

package() {
    local builddir=$srcdir/$pkgname/build
    cd "$builddir"
    make install DESTDIR="$pkgdir"
}

