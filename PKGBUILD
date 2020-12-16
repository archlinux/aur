# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Aaron Plattner <aplattner@nvidia.com>
# Contributor: Miguel A. Vico <mvicomoya@nvidia.com>
# Contributor: Eric Toombs
# Contributor: Joel Teichroeb <joel@teichroeb.net>
# Contributor: Sébastien Luttringer
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=weston-eglstream-nosystemd-git
pkgver=9.0.0
pkgrel=1
pkgdesc='Reference implementation of a Wayland compositor with EGLStream support'
arch=('x86_64')
url='https://wayland.freedesktop.org/'
license=('MIT')
depends=('wayland' 'libxkbcommon' 'libinput' 'libjpeg-turbo' 'libwebp'
         'libegl' 'libgles' 'pango' 'libva' 'libxcursor' 'colord' 'libpipewire02'
         'egl-wayland')	 
makedepends=('meson' 'wayland-protocols' 'ninja')
provides=('weston' 'weston-eglstream' 'weston-eglstream-nosystemd')
conflicts=('weston' 'weston-eglstream' 'weston-eglstream-nosystemd')
source=("git+https://github.com/wayland-project/weston"
        '0001-gl-renderer-Add-EGLDevice-enumeration-support.patch'
        '0002-gl-renderer-Add-support-for-EGLDevice-composited-fra.patch'
        '0003-gl-renderer-Add-EGL-client-support-for-EGLStream-fra.patch'
        '0004-backend-drm-Gracefully-handle-vblank-and-flip-invali.patch'
        '0005-backend-drm-Add-support-for-EGLDevice-EGLOutput.patch'
        '0006-compositor-Process-stream-attach-requests-with-wl_eg.patch')
sha256sums=('SKIP'
	    'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
 _basever="$(cat "$_basename/meson.build" | \
 sed -n 's/.*version:\s*'\''\([0-9.]\+\)'\''.*/\1/p')"
 cd "$_basename"echo "$_basever.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
    #cd weston-$pkgver
    cd weston

    patch -Np1 -i "${srcdir}/0001-gl-renderer-Add-EGLDevice-enumeration-support.patch"
    patch -Np1 -i "${srcdir}/0002-gl-renderer-Add-support-for-EGLDevice-composited-fra.patch"
    patch -Np1 -i "${srcdir}/0003-gl-renderer-Add-EGL-client-support-for-EGLStream-fra.patch"
    patch -Np1 -i "${srcdir}/0004-backend-drm-Gracefully-handle-vblank-and-flip-invali.patch"
    patch -Np1 -i "${srcdir}/0005-backend-drm-Add-support-for-EGLDevice-EGLOutput.patch"
    patch -Np1 -i "${srcdir}/0006-compositor-Process-stream-attach-requests-with-wl_eg.patch"
}

build() {
    #arch-meson weston-$pkgver build
    arch-meson "build" "weston"
        -Dbackend-drm-screencast-vaapi=false \
        -Dscreenshare=false -Dbackend-rdp=false -Dshell-ivi=false \
        -Dsimple-dmabuf-drm= -Dremoting=false -Dlauncher-logind=false -Dsystemd=false
    ninja $NINJAFLAGS -C "build"
}

package() {
    DESTDIR="$pkgdir" ninja $NINJAFLAGS -C "build" install
    install -Dm644 "weston/COPYING" "$pkgdir/usr/share/licenses/weston-eglstream/COPYING"
}
