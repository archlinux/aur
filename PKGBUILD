# Maintainer: Aaron Plattner <aplattner@nvidia.com>
# Maintainer: Miguel A. Vico <mvicomoya@nvidia.com>
# Contributor: Sébastien Luttringer
# Contributor: Joel Teichroeb <joel@teichroeb.net>

pkgname=weston-eglstream
pkgver=5.0.0
pkgrel=5
pkgdesc='Reference implementation of a Wayland compositor with EGLStream support'
arch=('i686' 'x86_64')
url='https://wayland.freedesktop.org/'
license=('MIT')
depends=('glibc' 'wayland' 'libxkbcommon' 'libinput' 'libunwind' 'pixman'
         'libdrm' 'pam' 'libsystemd' 'cairo' 'libpng' 'libjpeg-turbo' 'libwebp'
         'libegl' 'libgles' 'glib2' 'pango' 'lcms2' 'mtdev' 'libx11'
         'libxcb' 'dbus' 'libva' 'libxcursor' 'colord' 'egl-wayland' 'autoconf')
makedepends=('wayland-protocols')
provides=('weston')
conflicts=('weston')
source=("https://wayland.freedesktop.org/releases/weston-$pkgver.tar.xz"
          '0001-gl-renderer-Add-EGLDevice-enumeration-support.patch'
          '0002-gl-renderer-Add-support-for-EGLDevice-composited-fra.patch'
          '0003-gl-renderer-Add-EGL-client-support-for-EGLStream-fra.patch'
          '0004-compositor-drm-Gracefully-handle-vblank-and-flip-inv.patch'
          '0005-compositor-drm-Add-support-for-EGLDevice-EGLOutput.patch'
          '0006-compositor-Process-stream-attach-requests-with-wl_eg.patch'
          '0007-simple-egl-Do-not-set-EGL-up-until-XDG-setup-is-comp.patch'
          '0008-gl-renderer-Use-mailbox-streams-for-scanout.patch'
          '0009-configure-Temporary-fix-for-gobject-2.0-libs-missing.patch')
sha256sums=('15a23423bcfa45e31e1dedc0cd524ba71e2930df174fde9c99b71a537c4e4caf'
            '270c2f68bb84a0f1f670eddb44b3f77729cf29ceecddbe4e62a5ced80fb1d1df'
            'f4f79611d00847c722e476469f74dc8fce812afdf2fed58ca91235b04bfe0107'
            '17c8d59665ad33d3dbfea39d8c32634dac660cf528313b51c7064ce27b93ddec'
            'f5c7ae1142b2cb0dcf28c4b217c7cac42ab98fb1bb5ee14a2978fa8cc9bc6ea7'
            '59287416cf0a57b76f7e77b7eadf0cf9c91afe480b0c400998abafe2deeb3126'
            '5917fe7b0b49a1d66c3262958c004ffe22de7bb5026856f92cf5be46e81f9b1e'
            '9b910c9b7176a4caea796a11ffd5086a54fe7b3c02336d494b8ea050933cfcbe'
            '840166cc83641e6502c119ea1ff060be3afc1c99c0da792e7e43364ad29e799d'
            'd84cea4d89f79215adb148e5ed2afe7e94f3ef66df10e2bbecfddf9f04bd13e4')
prepare() {
	cd weston-$pkgver

	patch -Np1 -i "${srcdir}/0001-gl-renderer-Add-EGLDevice-enumeration-support.patch"
	patch -Np1 -i "${srcdir}/0002-gl-renderer-Add-support-for-EGLDevice-composited-fra.patch"
	patch -Np1 -i "${srcdir}/0003-gl-renderer-Add-EGL-client-support-for-EGLStream-fra.patch"
	patch -Np1 -i "${srcdir}/0004-compositor-drm-Gracefully-handle-vblank-and-flip-inv.patch"
	patch -Np1 -i "${srcdir}/0005-compositor-drm-Add-support-for-EGLDevice-EGLOutput.patch"
	patch -Np1 -i "${srcdir}/0006-compositor-Process-stream-attach-requests-with-wl_eg.patch"
	patch -Np1 -i "${srcdir}/0007-simple-egl-Do-not-set-EGL-up-until-XDG-setup-is-comp.patch"
	patch -Np1 -i "${srcdir}/0008-gl-renderer-Use-mailbox-streams-for-scanout.patch"
	patch -Np1 -i "${srcdir}/0009-configure-Temporary-fix-for-gobject-2.0-libs-missing.patch"
}

build() {
	cd weston-$pkgver
	autoreconf --force -v --install
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
