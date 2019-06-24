# Maintainer: Aaron Plattner <aplattner@nvidia.com>
# Maintainer: Miguel A. Vico <mvicomoya@nvidia.com>
# Contributor: Eric Toombs
# Contributor: Joel Teichroeb <joel@teichroeb.net>
# Contributor: Sébastien Luttringer
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=weston-eglstream
pkgver=6.0.1
pkgrel=1
pkgdesc='Reference implementation of a Wayland compositor with EGLStream support'
arch=('x86_64')
url='https://wayland.freedesktop.org/'
license=('MIT')
depends=('wayland' 'libxkbcommon' 'libinput' 'libjpeg-turbo' 'libwebp'
         'libegl' 'libgles' 'pango' 'libva' 'libxcursor' 'colord' 'egl-wayland')
makedepends=('meson' 'wayland-protocols')
provides=('weston')
conflicts=('weston')
source=("https://wayland.freedesktop.org/releases/weston-$pkgver.tar.xz"
        '0001-gl-renderer-Add-EGLDevice-enumeration-support.patch'
        '0002-gl-renderer-Add-support-for-EGLDevice-composited-fra.patch'
        '0003-gl-renderer-Add-EGL-client-support-for-EGLStream-fra.patch'
        '0004-compositor-drm-Gracefully-handle-vblank-and-flip-inv.patch'
        '0005-compositor-drm-Add-support-for-EGLDevice-EGLOutput.patch'
        '0006-compositor-Process-stream-attach-requests-with-wl_eg.patch')
sha256sums=('bf2f6d5aae2e11cabb6bd69a76bcf9edb084f8c3e14ca769bea7234a513155b4'
            '77f798bbed2dfadfdfc3d47631dc9e315570445b247a905466e5b4970e920ced'
            'c351c903a09ad2608e853e9b052bef6ad9f99478d1940a217cb9854f275ccf08'
            '11b744a32b299bab5ac71e86e087f51f0db0aa3e9093c9ca4c88ab79f2e4ea64'
            'c2781950d5afeeee7ac35027093291242d7dd81295a34d258f80627f86927da9'
            '8bc0b1ce255de1c4901c949d6ecac2101820da678d4de43678c8e04b001814af'
            'e5ddf3567225470a0a8c358374404f1abdf6f5af05be304afd0376b408027c8d')
prepare() {
    cd weston-$pkgver

    patch -Np1 -i "${srcdir}/0001-gl-renderer-Add-EGLDevice-enumeration-support.patch"
    patch -Np1 -i "${srcdir}/0002-gl-renderer-Add-support-for-EGLDevice-composited-fra.patch"
    patch -Np1 -i "${srcdir}/0003-gl-renderer-Add-EGL-client-support-for-EGLStream-fra.patch"
    patch -Np1 -i "${srcdir}/0004-compositor-drm-Gracefully-handle-vblank-and-flip-inv.patch"
    patch -Np1 -i "${srcdir}/0005-compositor-drm-Add-support-for-EGLDevice-EGLOutput.patch"
    patch -Np1 -i "${srcdir}/0006-compositor-Process-stream-attach-requests-with-wl_eg.patch"
}

build() {
    arch-meson "build" "weston-$pkgver" -Dbackend-drm-screencast-vaapi=false \
        -Dscreenshare=false -Dbackend-rdp=false -Dshell-ivi=false \
        -Dsimple-dmabuf-drm= -Dremoting=false
    ninja -C "build"
}

package() {
    DESTDIR="$pkgdir" ninja -C "build" install
    install -Dm644 weston-$pkgver/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
