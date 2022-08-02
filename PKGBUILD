# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgbase=monado
pkgname=('monado' 'monado-doc')
pkgver=21.0.0
pkgrel=2
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
            '902de0126f2279800acb9bff8a6db9e59932d4eaf8a5a7dcf3e6631a6aa00347'
            '690fbd3f1d8e2f8b71924fc22dbfefe663dfa931741562033a9bcec5d2bb83b7'
            'b1b430610995654ecfd8ea23d27543ba1e716076699fbc2eaf1fb622f111cf3e')

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
