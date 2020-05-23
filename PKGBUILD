# Maintainer: Aaron Plattner <aplattner@nvidia.com>
# Maintainer: Miguel A. Vico <mvicomoya@nvidia.com>
# Contributor: Eric Toombs
# Contributor: Joel Teichroeb <joel@teichroeb.net>
# Contributor: Sébastien Luttringer
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=weston-eglstream-git
pkgver=8.0.0
pkgrel=1
pkgdesc='Reference implementation of a Wayland compositor with EGLStream support'
arch=('x86_64')
url='https://wayland.freedesktop.org/'
license=('MIT')
depends=('glibc' 'wayland' 'libxkbcommon' 'libinput' 'libunwind' 'pixman' 'libdrm' 'pam' 'systemd-libs' 'cairo' 'libpng'  'libjpeg-turbo' 'libwebp' 'mesa' 'glib2' 'lcms2' 'mtdev' 'dbus'
         'libegl' 'libgles' 'pango' 'libva' 'libxcursor' 'colord' 'libpipewire02' 'egl-wayland')
optdepends=('freerdp: support rdp backend'
	    'libx11: support Xwayland'
	    'libxcb: support Xwayland')	 
makedepends=('meson' 'wayland-protocols' 'ninja')
provides=('weston')
conflicts=('weston')
source=(#https://wayland.freedesktop.org/releases/$pkgname-$pkgver.tar.xz"{,.sig}
	"git://anongit.freedesktop.org/wayland/weston"
        '0001-gl-renderer-Add-EGLDevice-enumeration-support.patch'
        '0002-gl-renderer-Add-support-for-EGLDevice-composited-fra.patch'
        '0003-gl-renderer-Add-EGL-client-support-for-EGLStream-fra.patch'
        '0004-backend-drm-Gracefully-handle-vblank-and-flip-invali.patch'
        '0005-backend-drm-Add-support-for-EGLDevice-EGLOutput.patch'
        '0006-compositor-Process-stream-attach-requests-with-wl_eg.patch')
sha256sums=('SKIP'
            '8d644af0432944ec0c8710f3d31ffdccb8a0661683247743df08915cf9670915'
            'bbfc35859b4561ddaee39077c1b449c729ce6e691193a64090b44746bc46d587'
            '0e2616445c720fc23137feffc6148f891648e3ab8a52f6790cf484b0b39d7fe2'
            '557aa28b89b18c4fb28ea7ab56dd6f3580dbc44d6ae0a983b8b615eab5bf00b1'
            '36e9d9a317c32e61910465394977c8a35bf94afe97a11e56476ea7ff1e8d708a'
            'dc64ac1cacac8dea668644a2a64aeaf3123983dcc61bf5b993bbd48dbc4f69ef')

pkgver() {
 _basever="$(cat "$_basename/meson.build" | \
 sed -n 's/.*version:\s*'\''\([0-9.]\+\)'\''.*/\1/p')"
 cd "$_basename"echo "$_basever.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
    #cd $pkgname-$pkgver
    cd weston

    patch -Np1 -i "${srcdir}/0001-gl-renderer-Add-EGLDevice-enumeration-support.patch"
    patch -Np1 -i "${srcdir}/0002-gl-renderer-Add-support-for-EGLDevice-composited-fra.patch"
    patch -Np1 -i "${srcdir}/0003-gl-renderer-Add-EGL-client-support-for-EGLStream-fra.patch"
    patch -Np1 -i "${srcdir}/0004-backend-drm-Gracefully-handle-vblank-and-flip-invali.patch"
    patch -Np1 -i "${srcdir}/0005-backend-drm-Add-support-for-EGLDevice-EGLOutput.patch"
    patch -Np1 -i "${srcdir}/0006-compositor-Process-stream-attach-requests-with-wl_eg.patch"
}

build() {
    #arch-meson $pkgname-$pkgver build \
    arch-meson "build" "weston"
        -Dbackend-drm-screencast-vaapi=false \
        -Dscreenshare=false -Dbackend-rdp=false -Dshell-ivi=false \
        -Dsimple-dmabuf-drm= -Dremoting=false -Db_lto=false
    ninja -C "build"
}

package() {
    DESTDIR="$pkgdir" ninja -C "build" install
    install -Dm644 "weston/COPYING" "$pkgdir/usr/share/licenses/weston-eglstream/COPYING"
}
