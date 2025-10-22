# Maintainer: q234 rty <q23456yuiop at gmail dot com>
# Contributor: lilydjwg <lilydjwg@gmail.com>
# Contributor: Adrian Perez de Castro <aperez@igalia.com>
# Contributor: Antonin Décimo <antonin dot decimo at gmail dot com>
pkgname=wlroots-hidpi-xprop-git
pkgver=0.20.0.20251020.130229
pkgrel=1
license=(MIT)
pkgdesc='Modular Wayland compositor library (git version, with patches)'
url=https://gitlab.freedesktop.org/wlroots/wlroots
arch=(x86_64)
provides=("libwlroots-0.20.so" "wlroots=${pkgver%%.202*}" "wlroots-git" "wlroots-hidpi-xprop")
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
source=("${pkgname}::git+${url}.git"
        0001-Revert-compositor-send-WL_SURFACE_ERROR_INVALID_SIZE.patch
        0001-xwayland-support-HiDPI-scale.patch
        0002-Fix-configure_notify-event.patch
        0003-Fix-size-hints-under-Xwayland-scaling.patch)
sha512sums=('SKIP'
            'c8b21591d9cf0fb219a981f2358a1b1586a592c48e68de3eb3391d5b020d3ae50f10c184ebfb18537b506a6dd50b844c768798b24f7a8e40acef30f0bcd86fee'
            'f9f3fc2b8b62e28609d52d31ec4e7a343adfe05dec454aa52e0465f3d3751be37c04b2e643e05178de36d8b3b536ae230f1435c3b664f4a011e5803fd3402dc0'
            'c93dcccd748ab06a5069381e79dee76125b4852525a4f61587c6685be951ec3d6a6b05b022110a6757dd05fa0c21762d13676eab19e52d886a0a58badde494ff'
            '443547d93705483dd028eb225e89a36e84bd9554d3920ae549a29757d48066dcdaf17f411922ca4be9a336b71d0ce87ae2e9a35a7b3287dc11a37df73dabde19')
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
  patch -Np1 < ../0001-Revert-compositor-send-WL_SURFACE_ERROR_INVALID_SIZE.patch
  patch -Np1 < ../0001-xwayland-support-HiDPI-scale.patch
  patch -Np1 < ../0002-Fix-configure_notify-event.patch
  patch -Np1 < ../0003-Fix-size-hints-under-Xwayland-scaling.patch
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

