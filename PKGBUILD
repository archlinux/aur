# Maintainer: Robin Candau <antiz@archlinux.org>
# Maintainer: Brett Cornwall <ainola@archlinux.org>
# Contributor: Maxim Baz <archlinux at maximbaz dot com>
# Contributor: Omar Pakker

pkgname=wlroots0.19
_pkgname=wlroots
pkgver=0.19.1
pkgrel=1
pkgdesc="Modular Wayland compositor library"
url="https://gitlab.freedesktop.org/wlroots/wlroots"
license=('MIT')
arch=('x86_64')
depends=('libdisplay-info.so' 'libglvnd' 'libinput' 'liblcms2.so' 'libliftoff.so' 'libpixman-1.so'
         'libseat.so' 'libudev.so' 'libvulkan.so' 'libwayland-client.so' 'libwayland-server.so'
         'libxcb' 'libxkbcommon.so' 'opengl-driver' 'xcb-util-errors' 'xcb-util-renderutil' 'xcb-util-wm')
makedepends=('git' 'glslang' 'meson' 'ninja' 'systemd' 'vulkan-headers' 'wayland-protocols' 'xorg-xwayland')
optdepends=('xorg-xwayland: Xwayland support')
provides=("libwlroots-${pkgver%.*}.so")
source=("${pkgname}::git+${url}.git#tag=${pkgver}?signed"
        'Revert-layer-shell-error-on-0-dimension-without-anch.patch')
sha256sums=('678039c968edf45266b2742b3612de41d59defedab19282e930603d24f94850c'
            '75fef991c636b1f285c1020bd653dd7239c9c276aea56b4937db5d412a3a13dd')
validpgpkeys=('34FF9526CFEF0E97A340E2E40FDE7BE0E88F5E48'  # Simon Ser
              '9DDA3B9FA5D58DD5392C78E652CB6609B22DA89A'  # Drew DeVault
              '4100929B33EEB0FD1DB852797BC79407090047CA') # Sway signing key)

prepare() {
	cd "${pkgname}"
	# Allow a minor protocol violation until phosh is fixed
	# Without this patch, phosh crashes at startup
	# See https://gitlab.gnome.org/World/Phosh/phoc/-/merge_requests/294
	# Patch taken from https://sources.debian.org/patches/wlroots/0.19.0-1/Revert-layer-shell-error-on-0-dimension-without-anchors.patch/
	patch -Np1 -i "${srcdir}/Revert-layer-shell-error-on-0-dimension-without-anch.patch"
}

build() {
	arch-meson "${pkgname}" build
	ninja -C build
}

package() {
	DESTDIR="${pkgdir}" ninja -C build install
	install -Dm 644 "${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
