# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgbase=monado
pkgname=('monado' 'monado-doc')
pkgver=21.0.0
pkgrel=1
pkgdesc='An open source OpenXR runtime'
arch=('x86_64')
url='https://monado.dev/'
license=('Boost')
makedepends=('git' 'meson' 'doxygen' 'eigen' 'glslang' 'qt5-base' 'v4l-utils'
             'vulkan-headers'
             'dbus' 'glib2' 'gstreamer' 'gst-plugins-base-libs' 'hidapi' 'libgl'
             'libjpeg-turbo' 'librealsense' 'libsurvive' 'libusb' 'libuvc' 'libx11'
             'libxcb' 'opencv' 'openhmd' 'sdl2' 'systemd-libs' 'vulkan-icd-loader'
             'wayland' 'zlib')
source=("https://gitlab.freedesktop.org/monado/monado/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2")
sha256sums=('7849ef4123afef14ca401aa5f9b8923144bb6bc707fe35817a288285d4990458')

build() {
    arch-meson -Dinstall-active-runtime='false' build "${pkgname}-v${pkgver}"
    ninja -C build
}

check() {
    ninja -C build test
}

package_monado() {
    depends=('dbus' 'glib2' 'gstreamer' 'gst-plugins-base-libs' 'hidapi' 'libgl'
             'libjpeg-turbo' 'librealsense' 'libsurvive' 'libusb' 'libuvc' 'libx11'
             'libxcb' 'opencv' 'openhmd' 'sdl2' 'systemd-libs' 'vulkan-icd-loader'
             'wayland' 'zlib')
    install=monado.install
    provides=('openxr-runtime')
    
    DESTDIR="$pkgdir" ninja install -C build
}

package_monado-doc() {
    pkgdesc+=' (documentation)'
    arch=('any')
    
    install -d -m755 "${pkgdir}/usr/share/doc/monado"
    cp -dr --no-preserve='ownership' build/doc/html "${pkgdir}/usr/share/doc/monado"
}
