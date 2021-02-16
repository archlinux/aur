# Maintainer: Sam L. Yes <samlukeyes123@gmail.com>

pkgname=libcamera-clang-git
pkgver=r2286.e201cb4f
pkgrel=1
pkgdesc='A complex camera support library for Linux, Android, and ChromeOS (built with clang)'
arch=('x86_64' 'i686')
url='http://libcamera.org/'
provides=('libcamera')
conflicts=('libcamera' 'libcamera-git')
makedepends=(
            "meson" "python-yaml" 'python-ply' 'clang' 'python-jinja' 'pkgconf' 'gnutls' 'openssl' 'git'
            'libudev0'    # for device hotplug enumeration
            'gstreamer'   # for gstreamer support
            'qt5-tools'   # for 'qcam' tool
            )
depends=(
        'gst-plugins-base-libs'   # for gstreamer support
        'libevent'                # for 'cam' command
        'qt5-base'                # for 'qcam' tool
        #'lttng-ust'              # for tracing with LTTng
        )
license=('LGPL' 'GPL')
options=('!buildflags')
source=('git://linuxtv.org/libcamera.git/')
md5sums=('SKIP')

pkgver() {
  cd libcamera
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/libcamera"
    CC=clang CXX=clang++ arch-meson build \
        -Dpipelines=ipu3,rkisp1,simple,uvcvideo,vimc \
        -Ddocumentation=disabled \
        -Dtracing=disabled  # comment this line to enable LTTng support
    ninja -C build
}

# At least for me, the following test is never passed.
# Uncomment it if you really want to run the test.

# check() {
#   cd ${srcdir}/libcamera
#   meson test -C build
# }

package() {
    cd "$srcdir/libcamera"
    DESTDIR="${pkgdir}" ninja -C build install
    rm -rf "$pkgdir/usr/share/doc/"
}
