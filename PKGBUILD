# Maintainer: Aaron Plattner <aplattner@nvidia.com>
# Maintainer: Miguel A. Vico <mvicomoya@nvidia.com>
# Contributor: Eric Toombs
# Contributor: Joel Teichroeb <joel@teichroeb.net>
# Contributor: Sébastien Luttringer
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=weston-eglstream
pkgver=7.0.0
pkgrel=1
pkgdesc='Reference implementation of a Wayland compositor with EGLStream support'
arch=('x86_64')
url='https://wayland.freedesktop.org/'
license=('MIT')
depends=('wayland' 'libxkbcommon' 'libinput' 'libjpeg-turbo' 'libwebp'
         'libegl' 'libgles' 'pango' 'libva' 'libxcursor' 'colord' 'pipewire'
         'egl-wayland')
makedepends=('meson' 'wayland-protocols')
provides=('weston')
conflicts=('weston')
source=("https://wayland.freedesktop.org/releases/weston-$pkgver.tar.xz"
        '0001-gl-renderer-Add-EGLDevice-enumeration-support.patch'
        '0002-gl-renderer-Add-support-for-EGLDevice-composited-fra.patch'
        '0003-gl-renderer-Add-EGL-client-support-for-EGLStream-fra.patch'
        '0004-backend-drm-Gracefully-handle-vblank-and-flip-invali.patch'
        '0005-backend-drm-Add-support-for-EGLDevice-EGLOutput.patch'
        '0006-compositor-Process-stream-attach-requests-with-wl_eg.patch')
sha256sums=('a00a6d207b6a45f95f4401c604772a307c3767e5e2beecf3d879110c43909a64'
            '6e22c17327701c1252d57219718bc7dc818161e9d5a3835af30b28ac1dd36a54'
            '1ae44092510c16149bc2717a7847925e73a838ebcee321413bfed9fc5bf1573d'
            '6caacbd301301ae7f4bff61d406531ba094199ecb865edeffe610f7d8e32d6bd'
            'f1fd377069025fc7ee904a917bfb5c280c125f2507cf96f755004eb0311176a8'
            '3f310a2a6d0529761ed75b269f3f312b8d16679f3ddac41ba06283d37b3199aa'
            '2d06853eca2d5533213ee46cda60cd3bfebdddbee61ef922af873764b11566a9')
prepare() {
    cd weston-$pkgver

    patch -Np1 -i "${srcdir}/0001-gl-renderer-Add-EGLDevice-enumeration-support.patch"
    patch -Np1 -i "${srcdir}/0002-gl-renderer-Add-support-for-EGLDevice-composited-fra.patch"
    patch -Np1 -i "${srcdir}/0003-gl-renderer-Add-EGL-client-support-for-EGLStream-fra.patch"
    patch -Np1 -i "${srcdir}/0004-backend-drm-Gracefully-handle-vblank-and-flip-invali.patch"
    patch -Np1 -i "${srcdir}/0005-backend-drm-Add-support-for-EGLDevice-EGLOutput.patch"
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
