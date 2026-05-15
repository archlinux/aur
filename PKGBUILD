# Maintainer: Christopher Snowhill <kode54@gmail.com>
# Contributor: q234 rty <q23456yuiop at gmail dot com>
# Contributor: lilydjwg <lilydjwg@gmail.com>
# Contributor: Adrian Perez de Castro <aperez@igalia.com>
# Contributor: Antonin Décimo <antonin dot decimo at gmail dot com>
pkgname=wlroots-hidpi-xprop-hdr-metadata-git
pkgver=0.21.0.20260514.223357
pkgrel=1
license=(MIT)
pkgdesc='Modular Wayland compositor library (HDR metadata branch git version, with patches)'
url=https://gitlab.freedesktop.org/kode54/wlroots
arch=(x86_64)
provides=("libwlroots-${pkgver%.*.202*.*}.so" "wlroots=${pkgver%%.202*}" "wlroots-git" "wlroots-hidpi-xprop")
conflicts=(wlroots-git)
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
source=("${pkgname}::git+${url}.git#branch=hdr-metadata"
        0001-xwayland-support-HiDPI-scale.patch
        0002-Fix-configure_notify-event.patch
        0003-Fix-size-hints-under-Xwayland-scaling.patch
        0004-Revert-compositor-send-WL_SURFACE_ERROR_INVALID_SIZE.patch)
sha512sums=('SKIP'
            '423784601afa4266faf3bce669a9cd98aec6ef726595a71611408b8f698942b1738e40639b7ade9bc918485ee53152c2665e7b3928984e454b3130aadd7f6623'
            '4c98b79ee474464cfa6fd03020d6b41464945ebb65e55ac06485876b6cbff19496af9acd7ac399578699c55052728fbad89f6491b6af58b4b7d05966adee6099'
            '5d7d0f4df7f01e4a867286f37374346e1cdad01744b9c9b788af73503fbe1772e3b5bb3e141677b865eb450597b1ad9df0d61a3b0a3bab1b3782333da86306af'
            'b055e51be19d3921811871dd6cbeb75d697a3b806c92c422017d96c6de4a23c477caa3d82e500ff1f6f75dfa6f28a4a3b522eff10c956742c2a8e59d686bc0c9')
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
  patch -Np1 < ../0001-xwayland-support-HiDPI-scale.patch
  patch -Np1 < ../0002-Fix-configure_notify-event.patch
  patch -Np1 < ../0003-Fix-size-hints-under-Xwayland-scaling.patch
  patch -Np1 < ../0004-Revert-compositor-send-WL_SURFACE_ERROR_INVALID_SIZE.patch
}

build () {
  arch-meson \
    -Dwerror=false \
    -Dexamples=false \
    "${pkgname}" build
  meson compile -C build
}

package () {
  DESTDIR="${pkgdir}" meson install -C build
  install -Dm644 "${pkgname}/"LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

