# Maintainer: Dylan Donnell <dy-tea@proton.me>
pkgname='doors-git'
_pkgname='doors'
pkgver=0
pkgrel=1
pkgdesc='Wayland compositor inspired by bspwm'
arch=(x86_64)
url='https://dawn.wine/CreeperFace/doors'
license=(GPL-3.0-or-later)
depends=(
	'cairo'
	'glib2'
	'glibc'
	'libevdev'
	'libglvnd'
	'libinput'
	'libpixman-1.so'
	'libsystemd.so'
	'libwayland-server.so'
	'libxcb'
	'libxkbcommon.so'
	'pango'
	'bash'
	'shaderc'
	'systemd-libs'
	'vulkan-icd-loader'
	'wlroots-git'
	'xcb-util-wm'
	'xorg-xwayland'
)
makedepends=(git perl meson ninja wayland-protocols vulkan-headers linux-api-headers)
provides=('wayland-compositor')
source=("git+https://dawn.wine/CreeperFace/doors.git#branch=master" "doors-portals.conf" "doors-session.target")
sha512sums=("SKIP" "ac8d23f5ace35b77c55e00e26976e8981f53e31b10ff1df717bc26acba3567e79d4b477bc8b60d0f83e0ca8d18ab4f42840a8e7734f447cdf525460510bc1063" "9bbd5bea647f983884ff92871b17a5cab68e6d46c0d465d859e49be61f6e31c171bb2916665c1b1dcd61988edc76f7b41a051ec35ac3d13aa45c393a0fe746ac")

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	mkdir -p build
	arch-meson build "$_pkgname" -D b_ndebug=true
	ninja -C build
}

package() {
	DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 "$_pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm644 "$_pkgname/examples/arch/doorsrc" "$pkgdir/etc/doors/doorsrc"
  install -Dm644 "$_pkgname/examples/arch/doorshkrc" "$pkgdir/etc/doors/doorshkrc"
  install -Dm644 doors-portals.conf "$pkgdir/usr/share/xdg-desktop-portal/doors-portals.conf"
  install -Dm644 doors-session.target "$pkgdir/usr/lib/systemd/user/doors-session.target"
}

post_install() {
	setcap cap_sys_nice+ep usr/bin/doors
}

post_upgrade() {
	setcap cap_sys_nice+ep usr/bin/doors
}
