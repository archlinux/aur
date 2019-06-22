# Maintainer: Aaron Plattner <aplattner@nvidia.com>
# Maintainer: Miguel A. Vico <mvicomoya@nvidia.com>
# Contributor: Eric Toombs
# Contributor: Joel Teichroeb <joel@teichroeb.net>
# Contributor: Sébastien Luttringer
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=weston-eglstream
pkgver=6.0.0
pkgrel=2
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
        '0001-configure-meson-Tmp-fix-for-gobject-2.0-libs-missing.patch'
        '0002-gl-renderer-Add-EGLDevice-enumeration-support.patch'
        '0003-gl-renderer-Add-support-for-EGLDevice-composited-fra.patch'
        '0004-gl-renderer-Add-EGL-client-support-for-EGLStream-fra.patch'
        '0005-compositor-drm-Gracefully-handle-vblank-and-flip-inv.patch'
        '0006-compositor-drm-Add-support-for-EGLDevice-EGLOutput.patch'
        '0007-compositor-Process-stream-attach-requests-with-wl_eg.patch'
        '0008-simple-egl-Do-not-set-EGL-up-until-XDG-setup-is-comp.patch'
        '0009-gl-renderer-Try-realizing-EGLStream-before-EGLImage-.patch'
        '0010-compositor-drm-Cleanup-scanout-plane-state-upon-head.patch')
sha256sums=('546323a90607b3bd7f48809ea9d76e64cd09718102f2deca6d95aa59a882e612'
            'b7492f80795e4039b234c20ea67dc14956336af8370531358013fb50d00b42e1'
            '4ef5e24aec18efe9296b73c70897ec1af679bb6b68c8d7961692c2a6eb45542d'
            'c732aa688948fe1fa0b55ffce137f4aa480866b339664c44be6c3b2597b2cc9e'
            '2e2ba999c8c86bd31ef177a73a3bbbcaaddab1a7fe0e712b571a3564dcb7aff1'
            '491a825ad126be82848726ba03b97a972b8281e7dbe9262689023c59c59d0d87'
            '6db13c8252e37e6374231b5b9105c2344e6cd73af254fbf35ee303b36495210e'
            'bf36c7348a7c43d76f0043452578d93242594c157c0349b6b866ef93c7363fdd'
            'dff1c611b59889fd3d149e4837c25da0252b15ec064d61533b7e21fbc49a6d4d'
            '7a6140a2b82d4e654fcc4fbf72d4469797f1b36723936ce8ab177b9066528faf'
            '164631eba83d2069f71760c44bb687640757189c9e8e7276bc7cc741f6afa9f5')
prepare() {
    cd weston-$pkgver

    patch -Np1 -i "${srcdir}/0001-configure-meson-Tmp-fix-for-gobject-2.0-libs-missing.patch"
    patch -Np1 -i "${srcdir}/0002-gl-renderer-Add-EGLDevice-enumeration-support.patch"
    patch -Np1 -i "${srcdir}/0003-gl-renderer-Add-support-for-EGLDevice-composited-fra.patch"
    patch -Np1 -i "${srcdir}/0004-gl-renderer-Add-EGL-client-support-for-EGLStream-fra.patch"
    patch -Np1 -i "${srcdir}/0005-compositor-drm-Gracefully-handle-vblank-and-flip-inv.patch"
    patch -Np1 -i "${srcdir}/0006-compositor-drm-Add-support-for-EGLDevice-EGLOutput.patch"
    patch -Np1 -i "${srcdir}/0007-compositor-Process-stream-attach-requests-with-wl_eg.patch"
    patch -Np1 -i "${srcdir}/0008-simple-egl-Do-not-set-EGL-up-until-XDG-setup-is-comp.patch"
    patch -Np1 -i "${srcdir}/0009-gl-renderer-Try-realizing-EGLStream-before-EGLImage-.patch"
    patch -Np1 -i "${srcdir}/0010-compositor-drm-Cleanup-scanout-plane-state-upon-head.patch"
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
