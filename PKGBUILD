# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgbase=monado
pkgname=(
    'monado'
    'monado-doc')
pkgver=25.0.0
pkgrel=3
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
source=("https://gitlab.freedesktop.org/monado/monado/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2"
        '010-monado-eigen5-fix.patch'::'https://gitlab.freedesktop.org/monado/monado/-/commit/c0c10fd34df85706e5897fd79eea3fb40461f1c0.patch')
sha256sums=('75596aaa207f2ad03d4de4911e00995f084f407333b789d25fc8a88e946715e7'
            '643400ade23ff221439d3f1a27583dae832384ea36ccd787283033aa7bf17aad')

prepare() {
    patch -d "${pkgname}-v${pkgver}" -Np1 -i "${srcdir}/010-monado-eigen5-fix.patch"
}

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
