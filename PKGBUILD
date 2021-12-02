pkgname=libcamera-git
_pkgname=libcamera
pkgver=r3303.b7b72027
_gtestver=1.11.0
pkgrel=1
pkgdesc='A complex camera support library for Linux, Android, and ChromeOS'
arch=('x86_64' 'i686' 'aarch64' )
url='http://libcamera.org/'
makedepends=(
    "boost"
    "gcc"
    "git"
    "gnutls"
    "lttng-ust"
    "meson"
    "openssl"
    "python-jinja"
    "python-ply"
    "python-yaml"
    "sed"
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
source=(
  'git://linuxtv.org/libcamera.git/'
  "gtest-${_gtestver}.zip::https://github.com/google/googletest/archive/release-${_gtestver}.zip"
  "gtest_${_gtestver}-1_patch.zip::https://wrapdb.mesonbuild.com/v2/gtest_${_gtestver}-1/get_patch"
  )
noextract=(
  "gtest-${_gtestver}.zip"
  "gtest_${_gtestver}-1_patch.zip"
  )
sha256sums=(
  'SKIP'
  '353571c2440176ded91c2de6d6cd88ddd41401d14692ec1f99e35d013feda55a'
  'd38c39184384608b08419be52aed1d0f9d9d1b5ed71c0c35e51cccbdddab7084'
)
provides=("$_pkgname")
conflicts=("$_pkgname")

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$_pkgname"
    sed -i 's/^\(source_url\|patch_url\).*/#&/g' ./subprojects/gtest.wrap
    mkdir -p subprojects/packagefiles
    ln -sf "${srcdir}/gtest_${_gtestver}-1_patch.zip" "${srcdir}/gtest-${_gtestver}.zip" subprojects/packagefiles/ 
}

build() {
    cd "$srcdir/$_pkgname"

    arch-meson build \
        -D          b_lto=false \
        -D          werror=false \
        -D          documentation=disabled \
        -D          tracing=disabled

    meson compile -C build
}

check() {
    cd "$srcdir/$_pkgname"
    ninja -C build test
}

package() {
    cd "$srcdir/$_pkgname"
    DESTDIR="$pkgdir" ninja -C build install
    install -d -m 755 "$pkgdir"/usr/share/licenses/"$_pkgname"
    install -D -m 644 ./LICENSES/* "$pkgdir"/usr/share/licenses/"$_pkgname"/
    rm -rf "$pkgdir"/usr/share/doc/libcamera-0.0.0/html/.doctrees/
}
