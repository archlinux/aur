pkgname=libcamera-git
_pkgname=libcamera
pkgver=r3070.e00149fc
pkgrel=1
pkgdesc='A complex camera support library for Linux, Android, and ChromeOS'
arch=('x86_64' 'i686' 'aarch64' )
url='http://libcamera.org/'
makedepends=(
    "boost"
    "gcc"
    "git"
    "gnutls"
    "gtest"
    "lttng-ust"
    "meson"
    "openssl"
    "python-jinja"
    "python-ply"
    "python-yaml"
)
optdepends=(
    "doxygen"
    "graphviz"
    "gstreamer"
    "libevent"
    "libtiff"
    "python-sphinx"
    "qt5-base"
    "qt5-tools"
    "udev"
)
license=('LGPL2.1')
options=('!buildflags')
source=('git://linuxtv.org/libcamera.git/')
md5sums=('SKIP')
provides=("$_pkgname")
conflicts=("$_pkgname")

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"
    arch-meson build \
        -D werror=false \
        -D documentation=disabled \
        -D tracing=disabled
    ninja -C build
}

package() {
    cd "$srcdir/$_pkgname"
    DESTDIR="$pkgdir" ninja -C build install
    install -d -m 755 "$pkgdir"/usr/share/licenses/"$_pkgname"
    install -D -m 644 ./LICENSES/* "$pkgdir"/usr/share/licenses/"$_pkgname"/
    rm -rf "$pkgdir"/usr/share/doc/libcamera-0.0.0/html/.doctrees/
}
