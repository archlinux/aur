# Maintainer: Aaron Plattner <aplattner@nvidia.com>
# Maintainer: Miguel A. Vico <mvicomoya@nvidia.com>
# Contributor: Eric Toombs
# Contributor: Joel Teichroeb <joel@teichroeb.net>
# Contributor: Sébastien Luttringer
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=weston-eglstream
pkgver=7.0.0
pkgrel=2
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
        '0006-compositor-Process-stream-attach-requests-with-wl_eg.patch'
        '0007-desktop-shell-Avoid-NULL-output-dereference-when-get.patch'
        '0008-compositor-Do-not-trigger-invalid-destructors-when-h.patch')
sha256sums=('a00a6d207b6a45f95f4401c604772a307c3767e5e2beecf3d879110c43909a64'
            '052d1256d069b5ca23865cd12ba5122e79475780b6fb09bdaa1301a621b32c1f'
            'cf2fda06ab6f3a545f9302b4ced8435df2f03378f4b3f2e25f7c85222c54d38f'
            '5bd7f6a11341efcffc596ad6808d2dc3c5b5e10e6cdecd3bfdc27eb23fe7ba0f'
            '46d2975fa6c6397206c9b170639aa79a96b3bddde8957dbe234d2a8206f773aa'
            '085c23f406366b236b6aa7f1d1158b65fead3adbd907a7c44b8e9407b6f90b9d'
            'c4db17e98afca6b099f5bbc6486430b768a1f71929c433ae403e68626f3e78d8'
            '2b7025295ae077cf91d22dc32c255f15e36feb9a61bf686adaf4c6be87750469'
            '3c12268e4bae6dfa264411c2a72be4ca7aca4055fe3956136b5a31dbca3e4136')
prepare() {
    cd weston-$pkgver

    patch -Np1 -i "${srcdir}/0001-gl-renderer-Add-EGLDevice-enumeration-support.patch"
    patch -Np1 -i "${srcdir}/0002-gl-renderer-Add-support-for-EGLDevice-composited-fra.patch"
    patch -Np1 -i "${srcdir}/0003-gl-renderer-Add-EGL-client-support-for-EGLStream-fra.patch"
    patch -Np1 -i "${srcdir}/0004-backend-drm-Gracefully-handle-vblank-and-flip-invali.patch"
    patch -Np1 -i "${srcdir}/0005-backend-drm-Add-support-for-EGLDevice-EGLOutput.patch"
    patch -Np1 -i "${srcdir}/0006-compositor-Process-stream-attach-requests-with-wl_eg.patch"
    patch -Np1 -i "${srcdir}/0007-desktop-shell-Avoid-NULL-output-dereference-when-get.patch"
    patch -Np1 -i "${srcdir}/0008-compositor-Do-not-trigger-invalid-destructors-when-h.patch"
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
