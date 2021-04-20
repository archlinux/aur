pkgname=libcamera-git
_pkgname=libcamera
pkgver=r2509.d4043011
pkgrel=2
pkgdesc='A complex camera support library for Linux, Android, and ChromeOS'
arch=('x86_64' 'i686')
url='http://libcamera.org/'
makedepends=(
    "gcc"
    "git"
    "gnutls"
    "openssl"
    "meson"
    "python-yaml"
    "python-ply"
    "python-jinja"
    "lttng-ust"
)
optdepends=(
    "boost"
    "udev"
    "python-sphinx"
    "doxygen"
    "graphviz"
    "gstreamer"
    "libevent"
    "qt5-base"
    "qt5-tools"
    "libtiff"
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
