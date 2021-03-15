# Maintainer: Sam L. Yes <samlukeyes123@gmail.com>

pkgname=libcamera-clang-git
pkgver=r2405.287e4f82
pkgrel=1
pkgdesc='A complex camera support library for Linux, Android, and ChromeOS (built with clang)'
arch=('x86_64' 'i686')
url='https://libcamera.org/'
provides=('libcamera' 'libcamera-git')
conflicts=('libcamera' 'libcamera-git')
makedepends=(
            "meson" "python-yaml" 'python-ply' 'python-jinja' 'pkgconf' 'gnutls' 'openssl' 'git'
            'libudev0'    # for device hotplug enumeration
            'gstreamer'   # for gstreamer support
            'qt5-tools'   # for 'qcam' tool
            'clang'
            )
depends=(
        'libc++'
        'gst-plugins-base-libs'   # for gstreamer support
        'libevent'                # for 'cam' command
        'qt5-base'                # for 'qcam' tool
        #'lttng-ust'              # for tracing with LTTng
        )
license=('LGPL' 'GPL' 'Apache' 'BSD' 'MIT' 'custom')
#options=('!buildflags')
source=('git://linuxtv.org/libcamera.git/')
md5sums=('SKIP')
_licensedir=/usr/share/licenses/${pkgname}

pkgver() {
  cd libcamera
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/libcamera"
    CC=clang CXX=clang++ meson build \
        --prefix /usr --libexecdir lib \
        -Dpipelines=ipu3,rkisp1,simple,uvcvideo,vimc \
        -Ddocumentation=disabled \
        -Dtracing=disabled  # comment this line to enable LTTng support
    ninja -C build
}

# If this check fails, use --nocheck to skip it

check() {
  cd ${srcdir}/libcamera
  meson test -C build
}

package() {
    cd "$srcdir/libcamera"
    DESTDIR="${pkgdir}" ninja -C build install
    rm -rf "$pkgdir/usr/share/doc/"

    # Install licenses
    install -d ${pkgdir}/${_licensedir}/LICENSES
    install -m644 COPYING.rst ${pkgdir}/${_licensedir}
    install -m644 LICENSES/{BSD-{2,3}-Clause,CC-BY-SA-4.0,CC0-1.0,MIT,Linux-syscall-note}.txt ${pkgdir}/${_licensedir}/LICENSES
}
