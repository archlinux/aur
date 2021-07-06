# Maintainer: Sam L. Yes <samlukeyes123@gmail.com>

pkgname=libcamera-clang-git
pkgver=r2742.143b2524
pkgrel=1
pkgdesc='A complex camera support library for Linux, Android, and ChromeOS (built with clang)'
arch=('x86_64' 'i686')
url='https://libcamera.org/'
provides=('libcamera' 'libcamera-clang' 'libcamera-git' 'qcam')
conflicts=('libcamera')
makedepends=(
  'python-yaml' 'python-ply' 'python-jinja' 'pkgconf' 'gnutls' 'openssl' 'git' 'gtest'
  'udev'        # for device hotplug enumeration
  'gstreamer'   # for gstreamer support
  'qt5-tools'   # for 'qcam'
  'libevent'    # for 'cam'
  'meson>=0.55'
  'clang>=5.0'
)
depends=(
  #'libc++'
  'gst-plugins-base-libs'   # for gstreamer support
  #'lttng-ust'              # for tracing with LTTng
)
optdepends=(
  'qt5-base: for qcam test application'
  'libevent: for test commands'
  'gtest: for lc-compliance test command'
)
license=('LGPL' 'GPL' 'Apache' 'BSD' 'MIT' 'custom')
options=('!docs')
source=('git://linuxtv.org/libcamera.git/')
md5sums=('SKIP')
_licensedir=/usr/share/licenses/${pkgname}

prepare() {
  sed -i 's|py_compile=True,||' ${srcdir}/libcamera/utils/ipc/mojo/public/tools/mojom/mojom/generate/template_expander.py
}

pkgver() {
  cd libcamera
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/libcamera"
    CC=clang CXX=clang++ arch-meson build \
        -Dwerror=false \
        -Dv4l2=true \
        -Dipas=ipu3,vimc \
        -Dpipelines=ipu3,uvcvideo,vimc \
        -Ddocumentation=disabled \
        -Dtracing=disabled  # comment this line to enable LTTng support
    ninja -C build
}

check() {
  cd ${srcdir}/libcamera
  meson test -C build
}

package() {
    cd "$srcdir/libcamera"
    DESTDIR="${pkgdir}" ninja -C build install

    # Install licenses
    install -d ${pkgdir}/${_licensedir}/LICENSES
    install -m644 COPYING.rst ${pkgdir}/${_licensedir}
    install -m644 LICENSES/{BSD-{2,3}-Clause,CC-BY-SA-4.0,CC0-1.0,MIT,Linux-syscall-note}.txt ${pkgdir}/${_licensedir}/LICENSES
}
