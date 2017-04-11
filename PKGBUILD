# Maintainer: Aaron Plattner <aplattner@nvidia.com>
# Maintainer: Miguel A. Vico <mvicomoya@nvidia.com>
# Contributor: Sébastien Luttringer
# Contributor: Joel Teichroeb <joel@teichroeb.net>

pkgname=weston-eglstream
pkgver=2.0.0
pkgrel=2
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
          '0001-gl-renderer-Add-EGLDevice-enumeration-support.patch'
          '0002-gl-renderer-Add-support-for-EGLDevice-composited-fra.patch'
          '0003-gl-renderer-Add-EGL-client-support-for-EGLStream-fra.patch'
          '0004-compositor-drm-Gracefully-handle-vblank-and-flip-inv.patch'
          '0005-compositor-drm-Add-support-for-EGLDevice-EGLOutput.patch'
          '0006-simple-egl-Do-not-set-EGL-up-until-XDG-setup-is-comp.patch'
          '0007-Add-nvidia-release-notes-file.patch'
          '0008-compositor-drm-Release-current-next-fb-when-deactiva.patch')
sha256sums=('b4e446ac27f118196f1609dab89bb3cb3e81652d981414ad860e733b355365d8'
            'c81d07f0a2b26e772faa02e4b088ff979206216652a4c30beb9aa24631d9d648'
            'c32048c7b1e57c24ca7fa665c9e70bc3c12dec338aea3643b637bf8d30188335'
            'fabb4ca507b0a5978ebc7f635989637ccfbdeee9b84119bc6588028342913856'
            'db56a9f0d09441af58d530130e5f04f7066d11a32cdd99522e39a19ee4ee9f46'
            '8087849a01853e5c69fad7c9821e2202fd78ffe904626fe2f9ff51e83816ed02'
            '3bb9b0a354aa07fb3eb89ad9b7e425b1ce980b1bd0b90166a41795a80acc78ca'
            '47fc9f44083096299e1502cf15c93d9f8670e1a4e4784870d7a843d4de09d502'
            'ca6c3a6fef381c6c7dd05e6d1bfda97b221fd90fc78ebf7b7ade9cfad2b38b63')

prepare() {
	cd weston-$pkgver

	patch -Np1 -i "${srcdir}/0001-gl-renderer-Add-EGLDevice-enumeration-support.patch"
	patch -Np1 -i "${srcdir}/0002-gl-renderer-Add-support-for-EGLDevice-composited-fra.patch"
	patch -Np1 -i "${srcdir}/0003-gl-renderer-Add-EGL-client-support-for-EGLStream-fra.patch"
	patch -Np1 -i "${srcdir}/0004-compositor-drm-Gracefully-handle-vblank-and-flip-inv.patch"
	patch -Np1 -i "${srcdir}/0005-compositor-drm-Add-support-for-EGLDevice-EGLOutput.patch"
	patch -Np1 -i "${srcdir}/0006-simple-egl-Do-not-set-EGL-up-until-XDG-setup-is-comp.patch"
	patch -Np1 -i "${srcdir}/0007-Add-nvidia-release-notes-file.patch"
	patch -Np1 -i "${srcdir}/0008-compositor-drm-Release-current-next-fb-when-deactiva.patch"
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
