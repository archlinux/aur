# Maintainer: Gennadiy Mykhailiuta <gmykhailiuta@gmail.com>
# Contributor: Sourav Das <souravdas142@gmail.com>
# Contributor: fordprefect <fordprefect@dukun.de>

pkgname=libcamera-git
_pkgname=libcamera
pkgver=r3989.e0e54965
pkgrel=1
pkgdesc='A complex camera support library for Linux, Android, and ChromeOS'
arch=('x86_64' 'i686' 'aarch64' )
url='http://libcamera.org/'
makedepends=(
    "boost"
    "gcc"
    "git"
    "gnutls"
    "gst-plugins-base"
    "gtest"
    "lttng-ust"
    "meson"
    "openssl"
    "python-jinja"
    "python-ply"
    "python-yaml"
    "qt5-base"
    "qt5-tools"
    "sed"
)
checkdepends=(
)
optdepends=(
    "doxygen"
    "graphviz"
    "gstreamer"
    "libevent"
    "libtiff"
    "python-sphinx"
    "udev"
)
license=('LGPL2.1')
options=('!buildflags')
source=(
  'git+https://git.linuxtv.org/libcamera.git/'
  )
sha256sums=(
  'SKIP'
)
provides=("$_pkgname")
conflicts=("$_pkgname")

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"

    arch-meson build \
        -D          b_lto=false \
        -D          werror=false \
        -D          documentation=disabled \
        -D          tracing=disabled \
	-D          lc-compliance=auto \
	-D          qcam=auto \
	-D          pycamera=disabled

    meson compile -C build
}

# Disabled because it's impoossible to build libcamera-git without webcam
# plugged in: https://aur.archlinux.org/packages/libcamera-git#comment-839459
# Enable once https://github.com/mesonbuild/meson/issues/6999 is resolved
#check() {
#    cd "$srcdir/$_pkgname"
#    meson test --no-rebuild --print-errorlogs --skip single_stream_test
#    #ninja -C build test
#}

package() {
    cd "$srcdir/$_pkgname"
    DESTDIR="$pkgdir" ninja -C build install
    install -d -m 755 "$pkgdir"/usr/share/licenses/"$_pkgname"
    install -D -m 644 ./LICENSES/* "$pkgdir"/usr/share/licenses/"$_pkgname"/
    rm -rf "$pkgdir"/usr/share/doc/libcamera-0.0.0/html/.doctrees/
}
