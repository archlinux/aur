# Maintainer: Aaron Plattner <aplattner@nvidia.com>
# Maintainer: Miguel A. Vico <mvicomoya@nvidia.com>
# Contributor: Sébastien Luttringer
# Contributor: Joel Teichroeb <joel@teichroeb.net>

pkgname=weston-eglstream
pkgver=3.0.0
pkgrel=1
pkgdesc='Reference implementation of a Wayland compositor with EGLStream support'
arch=('i686' 'x86_64')
url='https://wayland.freedesktop.org/'
license=('MIT')
depends=('glibc' 'wayland' 'libxkbcommon' 'libinput' 'libunwind' 'pixman'
         'libdrm' 'pam' 'libsystemd' 'cairo' 'libpng' 'libjpeg-turbo' 'libwebp'
         'libegl' 'libgles' 'glib2' 'pango' 'lcms2' 'mtdev' 'libx11'
         'libxcb' 'dbus' 'libva' 'libxcursor' 'colord')
makedepends=('wayland-protocols')
provides=('weston')
conflicts=('weston')
source=("https://wayland.freedesktop.org/releases/weston-$pkgver.tar.xz"
          '0001-compositor-drm-Release-current-next-fb-when-deactiva.patch'
          '0002-gl-renderer-Add-EGLDevice-enumeration-support.patch'
          '0003-gl-renderer-Add-support-for-EGLDevice-composited-fra.patch'
          '0004-gl-renderer-Add-EGL-client-support-for-EGLStream-fra.patch'
          '0005-compositor-drm-Gracefully-handle-vblank-and-flip-inv.patch'
          '0006-compositor-drm-Add-support-for-EGLDevice-EGLOutput.patch'
          '0007-simple-egl-Do-not-set-EGL-up-until-XDG-setup-is-comp.patch'
          '0008-compositor-Process-stream-attach-requests-with-wl_eg.patch'
          '0009-Add-nvidia-release-notes-file.patch')
sha256sums=('cde1d55e8dd70c3cbb3d1ec72f60e60000041579caa1d6a262bd9c35e93723a5'
            'c643d5b305ce91150eb0615836dcee494cc28cd12d7cb60e835b69ee5f8c452a'
            '689f619cb8691416f67fd052b217658dfe3dd2bdf3cb4ede532c8240546f998d'
            '058ab62996f7d000c144963148fa2e39a9c99bc4e0cac3e56926426fc100dac0'
            '9f96e3a94a02cc7fb91d0c8660a8bf6497c8375ce88c0115a2ee8b6c558bcab4'
            '04cab2302462d3680152743289e39766b5e38be7acc5b91a1b5cadec6f98d714'
            '93e77066b08e213af1173ef5438b5bdc62cc7e638a43d813fe5b73b437c71250'
            '6786b4c9e77dfc60db04f05a0b613a71b968d1d12d38c534a240f63a34059757'
            'ac8c20a932d7e70f4a93a0121cd476be84bf0498a91e927ffe79de66c03382b6'
            'c37571d1bea9114a31f360a75a449f10bec067f32aaddd0337e1b95076295f1e')

prepare() {
	cd weston-$pkgver

	patch -Np1 -i "${srcdir}/0001-compositor-drm-Release-current-next-fb-when-deactiva.patch"
	patch -Np1 -i "${srcdir}/0002-gl-renderer-Add-EGLDevice-enumeration-support.patch"
	patch -Np1 -i "${srcdir}/0003-gl-renderer-Add-support-for-EGLDevice-composited-fra.patch"
	patch -Np1 -i "${srcdir}/0004-gl-renderer-Add-EGL-client-support-for-EGLStream-fra.patch"
	patch -Np1 -i "${srcdir}/0005-compositor-drm-Gracefully-handle-vblank-and-flip-inv.patch"
	patch -Np1 -i "${srcdir}/0006-compositor-drm-Add-support-for-EGLDevice-EGLOutput.patch"
	patch -Np1 -i "${srcdir}/0007-simple-egl-Do-not-set-EGL-up-until-XDG-setup-is-comp.patch"
	patch -Np1 -i "${srcdir}/0008-compositor-Process-stream-attach-requests-with-wl_eg.patch"
	patch -Np1 -i "${srcdir}/0009-Add-nvidia-release-notes-file.patch"
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
