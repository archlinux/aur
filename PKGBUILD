# Maintainer: Christopher Snowhill <kode54 at gmail dot com>
# Contributor: q234 rty <q23456yuiop at gmail dot com>
# Contributor: lilydjwg <lilydjwg@gmail.com>
# Contributor: Adrian Perez de Castro <aperez@igalia.com>
# Contributor: Antonin Décimo <antonin dot decimo at gmail dot com>
pkgname=wlroots0.19-hidpi-xprop
pkgver=0.19.2
pkgrel=1
license=(MIT)
pkgdesc='Modular Wayland compositor library (stable, with patches)'
url=https://gitlab.freedesktop.org/wlroots/wlroots
arch=(x86_64)
provides=('libwlroots-0.19.so' "wlroots0.19=${pkgver}" "wlroots=${pkgver}")
conflicts=('libwlroots-0.19.so' 'wlroots0.19')
options=(debug)
depends=(
	glslang
	libinput
	libdisplay-info
	libliftoff
	libxcb
	opengl-driver
	xcb-util-errors
	xcb-util-renderutil
	xcb-util-wm

        'libpixman-1.so'
        'libseat.so'
        'libudev.so'
        'libvulkan.so'
        'libwayland-client.so'
        'libwayland-server.so'
        'libxkbcommon.so'

	xorg-xwayland
	lcms2)
optdepends=('xorg-xwayland-hidpi-xprop: HiDPI support, see https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/733')
makedepends=(
	git
	meson
	vulkan-headers
	wayland-protocols
	xorgproto)
source=("${pkgname}::git+${url}#tag=${pkgver}"
        0001-Revert-compositor-send-WL_SURFACE_ERROR_INVALID_SIZE.patch
        0001-xwayland-support-HiDPI-scale.patch
        0002-Fix-configure_notify-event.patch
        0003-Fix-size-hints-under-Xwayland-scaling.patch)
sha512sums=('e4c0e20b266a82b09385e5279a374d553588bce2de093bed2008107249ac300ab3fbd33397bee6f83d45a04cdf36d93f7c09445f575c9d103b3615e0bb42ff6e'
            '97148066b80c66cdfa7e0d695bbf3cc1fd690b8a9d21e93015fe1d6467fc4eaf90bb63822e71a2dcfc864e02a390b6bdbe7fdb996ecdd221768ca9990f79bb1f'
            'ce596d344979350f4f46e4b0ed5988480992f43f255879281bfa9a5e0c014bb72bb57793a5fc50c41423da4a3df245935169088fdc051dba0b2126ae9240fd2d'
            'c819648e9b398cb3c4046e1326324fe98b8638ab7859f3cd960e19184df34cccb411bce17e7e68d2c28cd45782af8766f343ce0e5608b786263b653e4f1c82c2'
            '4365cfb0b59f1dc0f569ce6aba1047951367222098f2afd41a35749bc5deee321988373b76da8477477949586e9bdf4644ba747322887643ade33bd298d5de7a')

prepare () {
  cd "${pkgname}"
  patch -Np1 < ../0001-Revert-compositor-send-WL_SURFACE_ERROR_INVALID_SIZE.patch
  patch -Np1 < ../0001-xwayland-support-HiDPI-scale.patch
  patch -Np1 < ../0002-Fix-configure_notify-event.patch
  patch -Np1 < ../0003-Fix-size-hints-under-Xwayland-scaling.patch
}

build () {
  arch-meson \
    --buildtype=debugoptimized \
    -Dwerror=false \
    -Dexamples=false \
    "${pkgname}" build
  meson compile -C build
}

package () {
  DESTDIR="${pkgdir}" meson install -C build
  install -Dm644 "${pkgname}/"LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
