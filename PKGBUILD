# Maintainer: Robin Candau <antiz@archlinux.org>
# Maintainer: Brett Cornwall <ainola@archlinux.org>
# Contributor: Maxim Baz <archlinux at maximbaz dot com>
# Contributor: Omar Pakker

pkgname=wlroots0.18
_pkgname=wlroots
pkgver=0.18.2
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
replaces=("${_pkgname}")
source=("${pkgname}::git+${url}.git#tag=${pkgver}?signed"
        'Revert-layer-shell-error-on-0-dimension-without-anch.patch')
sha256sums=('4c335ffb409d46b5d96987d431be6107a2619121ad3ad60a374e925319b89004'
            '570224bf7293f6d57e713f5acbf17a64ddf6daa41112f14ea028dd9ba7a82814')
validpgpkeys=('34FF9526CFEF0E97A340E2E40FDE7BE0E88F5E48'  # Simon Ser
              '9DDA3B9FA5D58DD5392C78E652CB6609B22DA89A'  # Drew DeVault
              '4100929B33EEB0FD1DB852797BC79407090047CA') # Sway signing key)

prepare() {
	cd "${pkgname}"
	# Allow a minor protocol violation until phosh is fixed
	# Without this patch, phosh crashes at startup
	# See https://gitlab.gnome.org/World/Phosh/phoc/-/merge_requests/294
	# Patch taken from https://sources.debian.org/src/wlroots/0.18.2-3/debian/patches/Revert-layer-shell-error-on-0-dimension-without-anchors.patch
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
