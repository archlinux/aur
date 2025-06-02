# Maintainer: Christopher Snowhill <kode54 at gmail dot com>
# Contributor: q234 rty <q23456yuiop at gmail dot com>
# Contributor: lilydjwg <lilydjwg@gmail.com>
# Contributor: Adrian Perez de Castro <aperez@igalia.com>
# Contributor: Antonin Décimo <antonin dot decimo at gmail dot com>
pkgname=wlroots0.18-hidpi-xprop
pkgver=0.18.2
pkgrel=1
license=(MIT)
pkgdesc='Modular Wayland compositor library (Legacy version, with patches)'
url=https://gitlab.freedesktop.org/wlroots/wlroots
arch=(x86_64)
provides=('libwlroots-0.18.so' "wlroots0.18=${pkgver}" "wlroots=${pkgver}")
conflicts=('libwlroots-0.18.so' 'wlroots0.18')
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
sha512sums=('a368715ed4ff36074d7e690336a38272b7fadd51fb29a2a1ec02f28a5f07fa773c1bb273016c11e813e5b012dc91d6d9f284d436fbbc58a9662b6e6523a4f377'
            '494a40f24d6ca0e0d06a9d13d6fbb7eacfc269bd4716d22fda39528d2d750adf7630c8dc15c26b0f526c77762c774a7cd0a219c7fbbf1fd1327523f34b86fd67'
            'ca05b46c8222e6982c848944ff2afe7765a2e76bb90e29c9d5b5dde9b51a0038bce8b0d52d01c390c970319ef10614ab1454a66940bf3a5b6193fc7f189afe6b'
            '484c8a6848b1409a16403bf0c3e366bf5203716824c24e16efcdcdb71ff34c42b5da6e3da338fafea70ad80fcdd3d6e9f070fb809093d8b0b08ee0b2c95a4de4'
            '8e3e77f6df204b6e5aa770be61fc8a6525e295cc8acdb0084ce66463e78f11702cf066640b20d7ff9560bdcdf7fa626db2e90651dcd42670250f45ac0f636854')

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
