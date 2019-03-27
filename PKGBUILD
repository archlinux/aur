# Maintainer: Aaron Plattner <aplattner@nvidia.com>
# Maintainer: Miguel A. Vico <mvicomoya@nvidia.com>
# Contributor: Eric Toombs
# Contributor: Joel Teichroeb <joel@teichroeb.net>
# Contributor: Sébastien Luttringer
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=weston-eglstream
pkgver=6.0.0
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
        '0001-configure-meson-Tmp-fix-for-gobject-2.0-libs-missing.patch'
        '0002-gl-renderer-Add-EGLDevice-enumeration-support.patch'
        '0003-gl-renderer-Add-support-for-EGLDevice-composited-fra.patch'
        '0004-gl-renderer-Add-EGL-client-support-for-EGLStream-fra.patch'
        '0005-compositor-drm-Gracefully-handle-vblank-and-flip-inv.patch'
        '0006-compositor-drm-Add-support-for-EGLDevice-EGLOutput.patch'
        '0007-compositor-Process-stream-attach-requests-with-wl_eg.patch'
        '0008-simple-egl-Do-not-set-EGL-up-until-XDG-setup-is-comp.patch')
sha256sums=('546323a90607b3bd7f48809ea9d76e64cd09718102f2deca6d95aa59a882e612'
            'd6e78c5bfc2118f1955f8c3eb30aedf7dc01cab9e21271b135dc32be1b895607'
            'f4b5222e0a8ee1c895f0e60e34d9d7c0a371012c5aab4d7e896e4c6f0df514b7'
            '8e778e55a2268cf932d57e4a6bbedcc7e24b1e223583cb238091dd426217198b'
            '01ecdb0363d36e11365ffe77056e9ec282d1928b007023ac7450aa2812a5018f'
            'f14e27d58b7b0ec72b5aa722db95bd62e9b316e91907070cfeed236e65fe5c17'
            '77b1633c0162ac0b6f8126a1e614b8fa54a672927c04c1cacc5486b534ebd4ec'
            '36f05125a0be58d2ce840c8de2b8d42cfeeae8362e5b95861669b85d0f876816'
            'a2acbc92962d2ae2c1690398af67eac35c5bbe06f0ff03a94f1aa1f12385ea12')
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
