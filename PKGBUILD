# Maintainer: Artiom Moiseev <moiseevartem-7 at ya dot ru>

pkgname=hyprland-presenter
_pkgname=hyprland
pkgver=0.56.0
pkgrel=1
pkgdesc='Hyprland with selective layer-shell overlay exclusion from screen capture'
arch=(x86_64 aarch64)
url='https://github.com/m01seeev/Hyprland/tree/presenter/omit-capture-poc'
license=(BSD-3-Clause)
depends=(cairo
         aquamarine libaquamarine.so
         libgcc
         'libstdc++'
         glibc
         glib2 libgio-2.0.so libgobject-2.0.so
         glslang
         hyprcursor libhyprcursor.so
         hyprgraphics libhyprgraphics.so
         hyprland-guiutils
         hyprlang libhyprlang.so
         hyprutils libhyprutils.so
         hyprwayland-scanner
         hyprwire libhyprwire.so
         lcms2 liblcms2.so
         libdrm
         libglvnd libEGL.so libGLESv2.so
         libinput
         libx11
         libxcb
         libxcomposite
         libxcursor
         libxfixes
         libxkbcommon libxkbcommon.so
         libxrender
         lua
         mesa
         muparser
         opengl-driver
         pango libpango-1.0.so libpangocairo-1.0.so
         pixman libpixman-1.so
         re2 libre2.so
         tomlplusplus libtomlplusplus.so
         util-linux-libs libuuid.so
         wayland libwayland-server.so
         wayland-protocols
         xcb-proto
         xcb-util
         xcb-util-errors
         xcb-util-image
         xcb-util-keysyms
         xcb-util-renderutil
         xcb-util-wm
         xorg-xwayland)
makedepends=(cmake
             glaze
             hyprland-protocols
             meson
             ninja
             xorgproto)
optdepends=('cmake: to build and install plugins using hyprpm'
            'cpio: to build and install plugins using hyprpm'
            'glaze: to build and install plugins using hyprpm'
            'hyprland-protocols: to build and install plugins using hyprpm'
            'hyprshutdown: clean logout and shutdown helper'
            'meson: to build and install plugins using hyprpm'
            'uwsm: an advanced way to start desktop compositors as systemd units'
            'xdg-desktop-portal-hyprland: xdg-desktop-portal backend for hyprland')
provides=("hyprland=$pkgver" wayland-compositor)
conflicts=(hyprland)
_archive="Hyprland-$pkgver"
source=("$_archive.tar.gz::https://github.com/hyprwm/Hyprland/releases/download/v$pkgver/source-v$pkgver.tar.gz"
        '0001-presenter-omit-capture.patch'
        'README.md')
sha256sums=('3e24a3b3a989cbb49621cdcd8a50b5ee442384d0f4602834ca55c8f993d0898c'
            '4e8f9d849a5c4f48ebe21b311d9633dff70e12a41dc075665c4d8187f2912ca2'
            '3cc90fff963f8c43e7440104ac48057a4be9e6bef8fed8d73d444557e8f30b3e')

prepare() {
	ln -sf hyprland-source "$_archive"
	cd "$_archive"
	patch -Np1 -i "$srcdir/0001-presenter-omit-capture.patch"
	sed -i -e '/^release:/{n;s/-D/-DCMAKE_SKIP_RPATH=ON -D/}' Makefile
}

build() {
	cd "$_archive"
	make release PREFIX=/usr
}

package() {
	cd "$_archive"
	make DESTDIR="$pkgdir" install
	rm -fv "$pkgdir/usr/include/hyprland/src/version.h.in"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
	install -Dm0644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
