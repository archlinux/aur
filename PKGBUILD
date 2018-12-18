# Maintainer: Aaron Plattner <aplattner@nvidia.com>
# Maintainer: Miguel A. Vico <mvicomoya@nvidia.com>
# Contributor: Sébastien Luttringer
# Contributor: Joel Teichroeb <joel@teichroeb.net>

pkgname=weston-eglstream
pkgver=5.0.0
pkgrel=2
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
          '0008-Add-nvidia-release-notes-file.patch')
sha256sums=('15a23423bcfa45e31e1dedc0cd524ba71e2930df174fde9c99b71a537c4e4caf'
            '467c25f7158e54736ed7e9d071c8524e0f83509defcea49a7b053b11be1e9f93'
            'b60522d00263f1e67e4d4ca823550c1c90f30be450facd9a95fca7a91376b160'
            '7ae690d0f75c8e341efea4a2b1f3557a0aec481fa38fe732b61805f9ee530b03'
            '4845734de15fa99dbfc7e58b364996a72f63cf3632793d57eca7f696d3d6186e'
            '037632c607638d98cf04cb5f1d5754842b77670671358ef34629c8c9dc2d9d19'
            'c83406c44c75e68f2efe0419d9500d1e4a3b5b6c212bec9df15bb40b6b2287dc'
            '7d756c6e091eb6933aa49d7bb822e3a10abfdab5466f7c3763e7bff3ce60090f'
            'aad2f5c1941abae1cf42db3c59377aa688a9c9fbb0f60b15defc67bd63f9c149')
prepare() {
	cd weston-$pkgver

	patch -Np1 -i "${srcdir}/0001-gl-renderer-Add-EGLDevice-enumeration-support.patch"
	patch -Np1 -i "${srcdir}/0002-gl-renderer-Add-support-for-EGLDevice-composited-fra.patch"
	patch -Np1 -i "${srcdir}/0003-gl-renderer-Add-EGL-client-support-for-EGLStream-fra.patch"
	patch -Np1 -i "${srcdir}/0004-compositor-drm-Gracefully-handle-vblank-and-flip-inv.patch"
	patch -Np1 -i "${srcdir}/0005-compositor-drm-Add-support-for-EGLDevice-EGLOutput.patch"
	patch -Np1 -i "${srcdir}/0006-compositor-Process-stream-attach-requests-with-wl_eg.patch"
	patch -Np1 -i "${srcdir}/0007-simple-egl-Do-not-set-EGL-up-until-XDG-setup-is-comp.patch"
	patch -Np1 -i "${srcdir}/0008-Add-nvidia-release-notes-file.patch"
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
