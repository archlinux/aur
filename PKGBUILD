# Maintainer: Aaron Plattner <aplattner@nvidia.com>
# Maintainer: Miguel A. Vico <mvicomoya@nvidia.com>
# Contributor: Sébastien Luttringer
# Contributor: Joel Teichroeb <joel@teichroeb.net>

pkgname=weston-eglstream
pkgver=4.0.0
pkgrel=2
pkgdesc='Reference implementation of a Wayland compositor with EGLStream support'
arch=('i686' 'x86_64')
url='https://wayland.freedesktop.org/'
license=('MIT')
depends=('glibc' 'wayland' 'libxkbcommon' 'libinput' 'libunwind' 'pixman'
         'libdrm' 'pam' 'libsystemd' 'cairo' 'libpng' 'libjpeg-turbo' 'libwebp'
         'libegl' 'libgles' 'glib2' 'pango' 'lcms2' 'mtdev' 'libx11'
         'libxcb' 'dbus' 'libva' 'libxcursor' 'colord' 'egl-wayland')
makedepends=('wayland-protocols')
provides=('weston')
conflicts=('weston')
source=("https://wayland.freedesktop.org/releases/weston-$pkgver.tar.xz"
          '0001-gl-renderer-Add-EGLDevice-enumeration-support.patch'
          '0002-gl-renderer-Add-support-for-EGLDevice-composited-fra.patch'
          '0003-gl-renderer-Add-EGL-client-support-for-EGLStream-fra.patch'
          '0004-compositor-drm-Gracefully-handle-vblank-and-flip-inv.patch'
          '0005-compositor-drm-Add-support-for-EGLDevice-EGLOutput.patch'
          '0006-simple-egl-Do-not-set-EGL-up-until-XDG-setup-is-comp.patch'
          '0007-compositor-Process-stream-attach-requests-with-wl_eg.patch'
          '0008-Add-nvidia-release-notes-file.patch')
sha256sums=('a0fc0ae7ef83dfbed12abfe9b8096a24a7dd00705e86fa0db1e619ded18b4b58'
            '41cb791c07e377ce16ccb7ba6a6a84a49e5351c3ed815a98076069fb1386ecec'
            '0bd297017262bf278e20c05e5d0a46208c77f5462d80db1906286764de867720'
            'a6a05d101701ff97bee1d5d3974fbbc12abb34c4b483568cc3c3552e328c3b55'
            'd8f04aef2b38628b38dae92c73f16aab36b74ca83a44d144123439cb68c273a6'
            'dda90181e2f91c03da8d180d7fbae42d61e2a31122301a2fc08f020b1da19a84'
            'f893280becdb18583d234d1a26814aa092356402fc8731a1b2da8ef8d6963a6e'
            '5e56cf8d136a241cb05abcad39537287a97777c1697746697631c10f9ab551f1'
            '919923d3a545d1e8420d128cd63d7e60095887ec603d417e23df6d7138ba42da')
prepare() {
	cd weston-$pkgver

	patch -Np1 -i "${srcdir}/0001-gl-renderer-Add-EGLDevice-enumeration-support.patch"
	patch -Np1 -i "${srcdir}/0002-gl-renderer-Add-support-for-EGLDevice-composited-fra.patch"
	patch -Np1 -i "${srcdir}/0003-gl-renderer-Add-EGL-client-support-for-EGLStream-fra.patch"
	patch -Np1 -i "${srcdir}/0004-compositor-drm-Gracefully-handle-vblank-and-flip-inv.patch"
	patch -Np1 -i "${srcdir}/0005-compositor-drm-Add-support-for-EGLDevice-EGLOutput.patch"
	patch -Np1 -i "${srcdir}/0006-simple-egl-Do-not-set-EGL-up-until-XDG-setup-is-comp.patch"
	patch -Np1 -i "${srcdir}/0007-compositor-Process-stream-attach-requests-with-wl_eg.patch"
	patch -Np1 -i "${srcdir}/0008-Add-nvidia-release-notes-file.patch"
}

build() {
	cd weston-$pkgver
	./configure \
		--prefix=/usr \
		--libexecdir=/usr/lib/weston \
		--enable-systemd-login \
		--enable-systemd-notify \
		--enable-xwayland \
		--enable-demo-clients-install
	make
}

package() {
	cd weston-$pkgver
	make DESTDIR="$pkgdir" install
	# license
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
