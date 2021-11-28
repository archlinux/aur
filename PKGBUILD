# Maintainer: Vojtech Lacina <anubhait at centrum dot cz>
pkgname=wayfire-aur-git
pkgver=0.7.2
pkgrel=1
pkgdesc="OpenGL wayland compositor - build with wayfire specific wlroots"
arch=('x86_64')
url="https://wayfire.org"
license=('MIT')
conflicts=("$pkgname" wlroots wlroots-git wf-config wf-config-git)
depends=('cairo' 'pango' 'freetype2' 'glm' \
'libdrm' 'libevdev' 'libglvnd' 'libinput' 'libjpeg' 'libpng' 'libxkbcommon' 'libxml2' \
'pixman' 'pkgconf' 'seatd' 'wayland' 'wayland-protocols')
makedepends=('git' 'meson' 'ninja' 'cmake')
optdepends=('xcb-util' 'xcb-util-renderutil' 'xcb-util-errors' 'xcb-util-wm' 'xorg-xwayland')
provides=("$pkgname" wlroots-custom-git wf-config-custom-git)
source=('git+https://github.com/WayfireWM/wayfire')
sha512sums=('SKIP')

pkgver() {
	cd "$srcdir/wayfire"
	git tag -l|awk '/^[0-9.]+$/ {print $0} /^v{1}[0-9.]+$/ {print substr($0,2)}'|sort -n|tail -n1

}

build()	{
	cd "$srcdir/wayfire/"

	meson setup --prefix /usr \
		--libexecdir lib \
		--sbindir bin \
		--buildtype=release \
		-Dxwayland=auto \
		-Duse_system_wlroots=disabled \
		-Duse_system_wfconfig=disabled \
		-Db_lto=true \
		-Db_pie=true \
		build
	ninja -C build
	sed "/WF_SRC_DIR/d" -i build/config.h
}


package() {
	cd "$srcdir/wayfire"
	DESTDIR="$pkgdir/" ninja -C build install
	install -Dm644 wayfire.desktop $pkgdir/usr/share/wayland-sessions/wayfire.desktop 
	cp wayfire.ini $pkgdir/usr/share
}
