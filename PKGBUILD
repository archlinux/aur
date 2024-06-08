# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgbase=monado
pkgname=('monado' 'monado-doc')
pkgver=24.0.0
pkgrel=1
pkgdesc='An open source OpenXR runtime'
arch=('x86_64')
url='https://monado.dev/'
license=('BSL-1.0')
makedepends=('git' 'cmake' 'doxygen' 'graphviz' 'cnmatrix' 'eigen' 'glslang' 'qt6-base'
             'python-setuptools' 'v4l-utils' 'vulkan-headers'
             'dbus' 'bluez-libs' 'cjson' 'glib2' 'gstreamer' 'gst-plugins-base-libs' 'hidapi'
             'libdrm' 'libgl' 'libjpeg-turbo' 'librealsense' 'libsurvive' 'libusb' 'libuvc'
             'libx11' 'libxcb' 'opencv' 'openhmd' 'sdl2' 'systemd-libs' 'vulkan-icd-loader'
             'wayland' 'wayland-protocols' 'zlib')
source=("https://gitlab.freedesktop.org/monado/monado/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2")
sha256sums=('a1097c2168bb546f9da8983d7326828c08b0bf57116ef6211e3ab3561187d86e')

build() {
    cmake -B build -S "${pkgname}-v${pkgver}" \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DBUILD_DOC:BOOL='ON' \
        -Wno-dev
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package_monado() {
    depends=('dbus' 'bluez-libs' 'cjson' 'glib2' 'gstreamer' 'gst-plugins-base-libs' 'hidapi'
             'libdrm' 'libgl' 'libjpeg-turbo' 'librealsense' 'libsurvive' 'libusb' 'libuvc'
             'libx11' 'libxcb' 'opencv' 'openhmd' 'sdl2' 'systemd-libs' 'vulkan-icd-loader'
             'wayland' 'zlib')
    install=monado.install
    provides=('openxr-runtime')
    
    DESTDIR="$pkgdir" cmake --install build
}

package_monado-doc() {
    pkgdesc+=' (documentation)'
    arch=('any')
    
    install -d -m755 "${pkgdir}/usr/share/doc/monado"
    cp -dr --no-preserve='ownership' build/doc/html "${pkgdir}/usr/share/doc/monado"
}
