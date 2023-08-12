# Maintainer: q234 rty <q23456yuiop at gmail dot com>
# Contributor: lilydjwg <lilydjwg@gmail.com>
# Contributor: Adrian Perez de Castro <aperez@igalia.com>
# Contributor: Antonin Décimo <antonin dot decimo at gmail dot com>
pkgname=wlroots-hidpi-xprop-git
pkgver=0.17.0.20230803.144028
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
        0002-Fix-configure_notify-event.patch
        0003-Fix-size-hints-under-Xwayland-scaling.patch)
sha512sums=('SKIP'
            'e94c5aafa13d7b78a9e0245a78c6b937f64ac78472f22afc2ca712c330212d6f69579139b103b0fc1515e901725a91ed8132d5be58be300fd45ca57c8ca80761'
            'c89c9aaa26457e64dff3530c9042afbbfd45a41dcffb01020c512eaaa359811bc16e929003ef56eb6b77f380ac0381b8382cc09da6e78ca0e6d0b2642b2a68bf'
            'd54d1faf46a390492ae2bc44238185aead9231b41dbf76567dd0dc4b85579edd5bef29a5ee22062993d06bbf24954216ebfe9a3da4ee67cd5c8b5121925e3483')
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
  patch -Np1 < ../0003-Fix-size-hints-under-Xwayland-scaling.patch
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

