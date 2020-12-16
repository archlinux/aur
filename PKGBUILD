# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Aaron Plattner <aplattner@nvidia.com>
# Contributor: Miguel A. Vico <mvicomoya@nvidia.com>
# Contributor: Eric Toombs
# Contributor: Joel Teichroeb <joel@teichroeb.net>
# Contributor: S\u00e9bastien Luttringer
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=weston-eglstream-nosystemd
pkgver=9.0.0
pkgrel=1
pkgdesc='Reference implementation of a Wayland compositor with EGLStream support'
arch=('x86_64')
url='https://wayland.freedesktop.org/'
license=('MIT')
depends=('wayland' 'libxkbcommon' 'libinput' 'libjpeg-turbo' 'libwebp'
         'libegl' 'libgles' 'pango' 'libva' 'libxcursor' 'colord' 'libpipewire02'
         'egl-wayland')
makedepends=('meson' 'wayland-protocols')
provides=('weston' 'weston-eglstream')
conflicts=('weston' 'weston-eglstream')
source=("https://wayland.freedesktop.org/releases/weston-$pkgver.tar.xz"
        '0001-gl-renderer-Add-EGLDevice-enumeration-support.patch'
        '0002-gl-renderer-Add-support-for-EGLDevice-composited-fra.patch'
        '0003-gl-renderer-Add-EGL-client-support-for-EGLStream-fra.patch'
        '0004-backend-drm-Gracefully-handle-vblank-and-flip-invali.patch'
        '0005-backend-drm-Add-support-for-EGLDevice-EGLOutput.patch'
        '0006-compositor-Process-stream-attach-requests-with-wl_eg.patch')
sha256sums=('5cf5d6ce192e0eb15c1fc861a436bf21b5bb3b91dbdabbdebe83e1f83aa098fe'
            '39eb26160b63183f35e5c50bea8cc10248fe194ab96b2cb9417990e5ed45fa1a'
            '55ee7aaed84cdc75cc58919a3ec71c7b2cfdbcf936a5f6c8f07f54376b9cc3a5'
            'c971abb2b84d9b2519c08aacbd3a4afc44d31bf0970d3bc71e48cca850a9765f'
            'ac1c048f6944b1ddd24c17205a7bd8f55578af5489d2f9ca7121727b0cbacc68'
            '5898de8565d3c449fb276f9e3b1ae1bb9e908e8153e0802989a49baa8d1d134a'
            '5834b4b0068cc0debe5bc20cddafd17f9ca4cb472035716da3942401a130ccc8')
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
        -Dsimple-dmabuf-drm= -Dremoting=false -Dlauncher-logind=false -Dsystemd=false
    ninja $NINJAFLAGS -C "build"
}

package() {
    DESTDIR="$pkgdir" ninja $NINJAFLAGS -C "build" install
    install -Dm644 weston-$pkgver/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

