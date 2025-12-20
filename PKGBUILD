# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgbase=monado
pkgname=(
    'monado'
    'monado-doc')
pkgver=25.1.0
pkgrel=1
pkgdesc='An open source OpenXR runtime'
arch=('x86_64')
url='https://monado.dev/'
license=('BSL-1.0')
makedepends=(
    'bluez-libs'
    'cjson'
    'cmake'
    'doxygen'
    'cnmatrix'
    'dbus'
    'eigen'
    'git'
    'glib2'
    'glslang'
    'graphviz'
    'gst-plugins-base-libs'
    'gstreamer'
    'hidapi'
    'libbsd'
    'libdrm'
    'libgl'
    'libjpeg'
    'librealsense'
    'libsurvive'
    'libusb'
    'libuvc'
    'libx11'
    'libxcb'
    'libxrandr'
    'opencv'
    'openhmd'
    'openvr'
    'python'
    'python-setuptools'
    'qt6-base'
    'sdl2'
    'systemd-libs'
    'v4l-utils'
    'vulkan-headers'
    'vulkan-icd-loader'
    'wayland'
    'wayland-protocols'
    'zlib')
source=("https://gitlab.freedesktop.org/monado/monado/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2")
sha256sums=('40291e8fa779f083658e7d813ef61c0c845d4f419cea73593d62b359cd781faa')

build() {
    cmake -B build -S "${pkgname}-v${pkgver}" \
        -G 'Unix Makefiles' \
        -DBUILD_DOC:BOOL='ON' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DXRT_HAVE_SYSTEM_CJSON:BOOL='ON' \
        -Wno-dev
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package_monado() {
    depends=(
        'bluez-libs'
        'cjson'
        'dbus'
        'gcc-libs'
        'glib2'
        'glibc'
        'gst-plugins-base-libs'
        'gstreamer'
        'hidapi'
        'libbsd'
        'libdrm'
        'libgl'
        'libjpeg'
        'librealsense'
        'libsurvive'
        'libusb'
        'libuvc'
        'libx11'
        'libxcb'
        'opencv'
        'openhmd'
        'openvr'
        'qt6-base' # needed by libopencv_highgui.so in monado-gui (optional in opencv)
        'sdl2'
        'systemd-libs'
        'vulkan-icd-loader'
        'wayland'
        'zlib')
    install=monado.install
    provides=('openxr-runtime')
    
    DESTDIR="$pkgdir" cmake --install build
}

package_monado-doc() {
    pkgdesc+=' (documentation)'
    arch=('any')
    
    install -d -m755 "${pkgdir}/usr/share/doc"
    cp -dr --no-preserve='ownership' build/doc/html "${pkgdir}/usr/share/doc/monado"
}
