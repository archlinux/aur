# Maintainer: Aaron Plattner <aplattner@nvidia.com>
# Contributor: Sébastien Luttringer
# Contributor: Joel Teichroeb <joel@teichroeb.net>

pkgname=weston-eglstream
pkgver=1.10.0
pkgrel=1
pkgdesc='Reference implementation of a Wayland compositor with EGLStream support'
arch=('i686' 'x86_64')
url='http://wayland.freedesktop.org'
license=('MIT')
depends=('wayland' 'libxkbcommon' 'libinput' 'libunwind' 'poppler-glib' 'mtdev' 'libxcursor' 'glu' 'pango' 'colord')
makedepends=('wayland-protocols')
provides=('weston')
conflicts=('weston')
source=("http://wayland.freedesktop.org/releases/weston-$pkgver.tar.xz"
          '0001-gl-renderer-Renaming-of-things-and-minor-improvement.patch'
          '0002-gl-renderer-Refactor-gl_renderer_output_window_creat.patch'
          '0003-gl-renderer-Implement-use-check_extension.patch'
          '0004-gl-renderer-Add-support-for-EGLDevice-EGLOutput.patch'
          '0005-compositor-drm-Gracefully-handle-vblank-and-flip-inv.patch'
          '0006-compositor-drm-Renaming-of-gbm-fields.patch'
          '0007-compositor-drm-Add-support-for-EGLDevice-EGLOutput.patch')
sha1sums=('c9c2c8e2e798b25e7bf6b31bf0c4ef08724a7ebb'
          'c623cdf628a20a4bde5a98cc40867c32a8300e79'
          '3441d0a7da0ae64835a5b29545caab4bc7977417'
          'f6742fadb973ec6c2b55e5500127309e70579312'
          '31e3a447a1209712d604d739d0ac7e5b1925e940'
          'b483f21b3f880d3978cc678bf5f97802f7ddddaf'
          '13d217d76a0811f5eb8d7180d31ec7a69fbbaabd'
          '6bab10ac02a7e69b1bb1bf1982b5804e87870e0e')

prepare() {
	cd weston-$pkgver

	patch -Np1 -i "${srcdir}/0001-gl-renderer-Renaming-of-things-and-minor-improvement.patch"
	patch -Np1 -i "${srcdir}/0002-gl-renderer-Refactor-gl_renderer_output_window_creat.patch"
	patch -Np1 -i "${srcdir}/0003-gl-renderer-Implement-use-check_extension.patch"
	patch -Np1 -i "${srcdir}/0004-gl-renderer-Add-support-for-EGLDevice-EGLOutput.patch"
	patch -Np1 -i "${srcdir}/0005-compositor-drm-Gracefully-handle-vblank-and-flip-inv.patch"
	patch -Np1 -i "${srcdir}/0006-compositor-drm-Renaming-of-gbm-fields.patch"
	patch -Np1 -i "${srcdir}/0007-compositor-drm-Add-support-for-EGLDevice-EGLOutput.patch"
}

build() {
	cd weston-$pkgver
	./configure \
		--prefix=/usr \
		--libexecdir=/usr/lib/weston \
		--enable-libinput-backend \
		--enable-demo-clients-install
	make
}

package() {
	cd weston-$pkgver
	make DESTDIR="$pkgdir" install
	# license
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
