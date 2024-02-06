# Maintainer: Piroro-hs

pkgname=hyprland-nox
pkgver=0.35.0
pkgrel=1
pkgdesc="A dynamic tiling Wayland compositor based on wlroots that doesn't sacrifice on its looks. (w/o XWayland support)"
arch=('x86_64')
url="https://github.com/hyprwm/Hyprland"
license=('BSD-3-Clause')
groups=()
depends=('cairo'
         'gcc-libs'
         'glib2'
         'glibc'
         'libdisplay-info'
         'libdrm'
         'libglvnd'
         'libinput'
         'libliftoff'
         'libxkbcommon'
         'opengl-driver'
         'pango'
         'pixman'
         'seatd'
         'systemd-libs' # libudev
         'tomlplusplus'
         'wayland')
makedepends=('cmake'
             'git'
             'hwdata'
             'meson'
             'ninja'
             'wayland-protocols')
provides=("${pkgname%-nox}")
conflicts=("${pkgname%-nox}")
replaces=()
backup=()
source=("$pkgname::git+$url#tag=v$pkgver"
        "${pkgname}_wlroots::git+https://gitlab.freedesktop.org/wlroots/wlroots.git"
        "${pkgname}_hyprland-protocols::git+https://github.com/hyprwm/hyprland-protocols.git"
        "${pkgname}_udis86::git+https://github.com/canihavesomecoffee/udis86.git"
        "${pkgname}_tracy::git+https://github.com/wolfpld/tracy.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
	cd "$srcdir/$pkgname"
	git submodule init
	git config submodule.wlroots.url "$srcdir/${pkgname}_wlroots"
	git config submodule.subprojects/hyprland-protocols.url "$srcdir/${pkgname}_hyprland-protocols"
	git config submodule.subprojects/udis86.url "$srcdir/${pkgname}_udis86"
	git config submodule.subprojects/tracy.url "$srcdir/${pkgname}_tracy"
	git -c protocol.file.allow=always submodule update
}

build() {
	cd "$srcdir/$pkgname"
	cmake --no-warn-unused-cli -B build -G Ninja -D CMAKE_SKIP_RPATH=YES -D CMAKE_BUILD_TYPE=Release -D NO_XWAYLAND=true
	cmake --build build
}

package() {
	cd "$srcdir/$pkgname"
	make PREFIX="$pkgdir/usr" MAKEFLAGS="-o installheaders" install
	rm -rf "$pkgdir/usr/share/xdg-desktop-portal"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
