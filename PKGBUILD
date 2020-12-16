# Maintainer    : Vincent Grande <shoober420@gmail.com>
# Contributor   : Adrian Perez de Castro <aperez@igalia.com>
# Contributor   : Eric Vidal <eric@obarun.org>
# Contributor   : Jean-Michel T.Dydak <jean-michel@obarun.org>
# Contributor   : Brett Cornwall <ainola@archlinux.org>
# Contributor   : Omar Pakker

pkgname=wlroots-nosystemd-git
pkgver=0.10.1
pkgrel=1
pkgdesc='Modular Wayland compositor library'
url="https://github.com/swaywm/wlroots"
arch=('x86_64')
license=('MIT')
source=("git+https://github.com/swaywm/wlroots")
sha512sums=('SKIP')

depends=(
    'libinput'
    'libxkbcommon'
    'opengl-driver'
    'pixman'
#    'xcb-util-errors'
    'xcb-util-image'
    'xcb-util-wm'
)
makedepends=(
    'meson'
    'ninja'
    'wayland-protocols'
)
provides=('libwlroots.so' 'wlroots' 'wlroots-git')
conflicts=('wlroots' 'wlroots-git')

pkgver () {
	cd wlroots
	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

_path=(
    --prefix=/usr
)

_flags=(
    --buildtype=plain
    -Dlogind=disabled
    -Dlogind-provider=elogind
    -Dlibseat=disabled
    -Dxcb-errors=disabled
    -Dxcb-icccm=enabled
    -Dxcb-xkb=enabled
    -Dxwayland=enabled
    -Dx11-backend=enabled
    -Dexamples=false
)

build() {
    meson wlroots build "${_path[@]}" "${_flags[@]}"
    ninja $NINJAFLAGS -C build
}

package() {
    DESTDIR="$pkgdir" ninja $NINJAFLAGS -C build install
    install -Dm644 "wlroots/LICENSE" -t "$pkgdir/usr/share/licenses/wlroots/"
}
