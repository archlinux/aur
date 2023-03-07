# Maintainer: q234 rty <q23456yuiop at gmail dot com>
# Contributor: lilydjwg <lilydjwg@gmail.com>
# Contributor: Adrian Perez de Castro <aperez@igalia.com>
# Contributor: Antonin Décimo <antonin dot decimo at gmail dot com>
pkgname=wlroots-hidpi-xprop-git
pkgver=0.17.0.20230306.122351
pkgrel=2
license=(MIT)
pkgdesc='Modular Wayland compositor library (git version, with patches)'
url=https://gitlab.freedesktop.org/wlroots/wlroots
arch=(x86_64)
provides=("libwlroots.so" "wlroots=${pkgver%%.202*}" "wlroots-git")
conflicts=(wlroots wlroots-git)
options=(debug)
depends=(
	glslang
	libinput
	libdisplay-info
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
source=("${pkgname}::git+${url}.git"
        0001-xwayland-support-HiDPI-scale.patch
        0002-Fix-configure_notify-event.patch)
sha512sums=('SKIP'
            'e03a3c9ac99645b46d583e6c00b7001bdc05738c1ac906e3e3f60e5893490f8c6da23a45e66a000a208e6ea8987294edd6cb13037b32a48d4e921492dcf0bb36'
            '65d50ed5a1cb5b976e02da69280944bdcc924827ac16106750170b28d96aea42ce723366a44dd0b9c27fe6b2b862b9e7c7502570c05690bbcc46f78ac1c22324')
install=wlroots-hidpi-xprop-git.install
pkgver () {
  cd "${pkgname}"
  (
     set -o pipefail
     version=$(grep -zoP "project\([^)]*\)" meson.build | xargs --null echo | grep -oP "^\sversion:\s'\K[^-']*")
     printf "${version}.%s" "$(TZ=UTC git log -1 --pretty='%cd' --date=format-local:%Y%m%d.%H%M%S)"
  )
}

prepare () {
  cd "${pkgname}"
  git revert -n 18595000f3a21502fd60bf213122859cc348f9af 
  patch -Np1 < ../0001-xwayland-support-HiDPI-scale.patch
  patch -Np1 < ../0002-Fix-configure_notify-event.patch
}

build () {
  arch-meson \
    --buildtype=debug \
    -Dwerror=false \
    -Dexamples=false \
    "${pkgname}" build
  meson compile -C build
}

package () {
  DESTDIR="${pkgdir}" meson install -C build
  install -Dm644 "${pkgname}/"LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

