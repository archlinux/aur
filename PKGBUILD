# Maintainer: q234 rty <q23456yuiop at gmail dot com>
# Contributor: lilydjwg <lilydjwg@gmail.com>
# Contributor: Adrian Perez de Castro <aperez@igalia.com>
# Contributor: Antonin Décimo <antonin dot decimo at gmail dot com>
pkgname=wlroots-hidpi-xprop-git
pkgver=0.17.0.20230309.185147
pkgrel=1
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
            '0595261b7beaa382f351b74d207956a7d36e05db4e96093d68773975cd2a6d6022a03e2aee927b1286bfd382d7c9d5ec22c747b501c2b0cd9e33f1e031a00022'
            '00c0c841f6c78d941d5128f9e0337dfd36245b74f82b53a73cc453b8cd4b09d3788f5d2d397db5cacd7445f17ff07dd8875954b5d570fcb6468e3b15060cb69a')
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

