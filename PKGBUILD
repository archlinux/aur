# Maintainer: Christopher Snowhill <kode54 at gmail dot com>
# Contributor: q234 rty <q23456yuiop at gmail dot com>
# Contributor: lilydjwg <lilydjwg@gmail.com>
# Contributor: Adrian Perez de Castro <aperez@igalia.com>
# Contributor: Antonin Décimo <antonin dot decimo at gmail dot com>
pkgname=wlroots-hidpi-xprop
pkgver=0.17.3
pkgrel=4
license=(MIT)
pkgdesc='Modular Wayland compositor library (stable, with patches)'
url=https://gitlab.freedesktop.org/wlroots/wlroots
arch=(x86_64)
provides=("libwlroots.so" "wlroots=${pkgver}")
conflicts=('wlroots<0.18')
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

	xorg-xwayland)
optdepends=('xorg-xwayland-hidpi-xprop: HiDPI support, see https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/733')
makedepends=(
	git
	meson
	vulkan-headers
	wayland-protocols
	xorgproto)
source=("${pkgname}::git+${url}#tag=${pkgver}"
        0001-xwayland-support-HiDPI-scale.patch
        0002-Fix-configure_notify-event.patch
        0003-Fix-size-hints-under-Xwayland-scaling.patch
        4668.patch
        4697.patch)
sha512sums=('fedb687840b1b0bd29049b3d7fae1f1b08c74d603b1e26b410d40a1fbcac05fef1a8b8d53f700a8c789f7280e8871776f02523635bf0d0aa7187511ef61af060'
            'ca05b46c8222e6982c848944ff2afe7765a2e76bb90e29c9d5b5dde9b51a0038bce8b0d52d01c390c970319ef10614ab1454a66940bf3a5b6193fc7f189afe6b'
            '484c8a6848b1409a16403bf0c3e366bf5203716824c24e16efcdcdb71ff34c42b5da6e3da338fafea70ad80fcdd3d6e9f070fb809093d8b0b08ee0b2c95a4de4'
            '8e3e77f6df204b6e5aa770be61fc8a6525e295cc8acdb0084ce66463e78f11702cf066640b20d7ff9560bdcdf7fa626db2e90651dcd42670250f45ac0f636854'
            '72e48d6e98a702425055f4eda980e8997635b717eefcf4f2e35e7e6a0b9115bde9d000b8ec1d6c4a22d2050efc39e0035e9c590a643cc011a78d8b8ba2bc7198'
            'e62d83b350deeea56b1f37c31a8fa03c6e609cde1b919390a0550e8a88147468e57a7aa29df7b880c33ea32f9822d7265cde820e840d33057ecf5f9ca8641d08')

prepare () {
  cd "${pkgname}"
  git revert -n 18595000f3a21502fd60bf213122859cc348f9af 
  patch -Np1 < ../0001-xwayland-support-HiDPI-scale.patch
  patch -Np1 < ../0002-Fix-configure_notify-event.patch
  patch -Np1 < ../0003-Fix-size-hints-under-Xwayland-scaling.patch
  patch -Np1 < ../4668.patch
  patch -Np1 < ../4697.patch
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
