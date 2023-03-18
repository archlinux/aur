# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgbase=monado
pkgname=('monado' 'monado-doc')
pkgver=21.0.0
pkgrel=3
pkgdesc='An open source OpenXR runtime'
arch=('x86_64')
url='https://monado.dev/'
license=('Boost')
makedepends=('git' 'meson' 'doxygen' 'eigen' 'glslang' 'qt5-base' 'v4l-utils'
             'vulkan-headers'
             'dbus' 'glib2' 'gstreamer' 'gst-plugins-base-libs' 'hidapi' 'libgl'
             'libjpeg-turbo' 'librealsense' 'libsurvive' 'libusb' 'libuvc' 'libx11'
             'libxcb' 'opencv' 'openhmd' 'sdl2' 'systemd-libs' 'vulkan-icd-loader'
             'wayland' 'wayland-protocols' 'zlib')
source=("https://gitlab.freedesktop.org/monado/monado/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2"
        '010-monado-meson-0.61.0-fix.patch'::'https://gitlab.freedesktop.org/monado/monado/-/commit/cce20942901211a6820654c31ce86d4bd06ab597.patch'
        '020-monado-gcc-10-fix-part001.patch'::'https://gitlab.freedesktop.org/monado/monado/-/commit/1a556740d5ba79af8f5e72d7145ab62b8867db0b.patch'
        '030-monado-gcc-10-fix-part002.patch'::'https://gitlab.freedesktop.org/monado/monado/-/commit/a0c8cc14f52f1b922c9c4fd1272652e01e130282.patch')
sha256sums=('7849ef4123afef14ca401aa5f9b8923144bb6bc707fe35817a288285d4990458'
            'f89f2c41911a71915eff3f8bd49d9f46dd5f945385695a41a4fef44788d169e0'
            'c8d38b9ab966c56c76c8057b67766ddf31c127ef5c999c4aad6950b33c2d7955'
            '36e8841786f373f96f6420581cac585699cd211e494cb2b0be8aba4dd0b23c31')

prepare() {
    patch -d "${pkgname}-v${pkgver}" -Np1 -i "${srcdir}/010-monado-meson-0.61.0-fix.patch"
    patch -d "${pkgname}-v${pkgver}" -Np1 -i "${srcdir}/020-monado-gcc-10-fix-part001.patch"
    patch -d "${pkgname}-v${pkgver}" -Np1 -i "${srcdir}/030-monado-gcc-10-fix-part002.patch"
}

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
