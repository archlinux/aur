# Maintainer: dawsers <dawser at gmx dot com>
pkgname=sway-scroll
pkgver=1.12.3
pkgrel=1
pkgdesc='Fork of the sway Wayland compositor with a scrolling layout like PaperWM or niri (stable version)'
arch=('x86_64')
url="https://github.com/dawsers/scroll"
license=("MIT")
depends=(
	"cairo"
	"gdk-pixbuf2"
	"json-c"
	"libdrm"
	"libevdev"
	"libinput"
	"libxcb"
	"libxkbcommon"
	"pango"
	"pcre2"
	"pixman"
	"wayland"
	"xcb-util-wm"
	"lua"
	"glibc"
	"libliftoff"
	"libglvnd"
	"lcms2"
	"systemd-libs"
	"opengl-driver"
	"xcb-util-errors"
	"xcb-util-renderutil"
	"xcb-util-wm"
	"seatd"
	"glslang"
	"vulkan-icd-loader"
	"libdisplay-info"
)
makedepends=(
	"git"
	"libcap"
	"meson"
	"scdoc"
	"wayland-protocols"
	"vulkan-headers"
	"xorgproto"
	"xorg-xwayland"
)
optdepends=(
	'wmenu: Application launcher used in default configuration'
	'foot: Terminal emulator used in default configuration'
	'polkit: System privilege control. Required if not using seatd service'
	'swaybg: Wallpaper tool for sway'
	'swayidle: Idle management daemon'
	'swaylock: Screen locker'
	'xdg-desktop-portal-gtk: Portal used for default file picking'
	'xdg-desktop-portal-wlr: Portal used for screen sharing'
	'xorg-xwayland: Enable X11 support'
)
provides=("sway-scroll" "wayland-compositor")
conflicts=("sway-scroll-git")
install="${pkgname}.install"
source=("git+https://github.com/dawsers/scroll.git#tag=$pkgver"
        "50-systemd-user.conf"
        "scroll-portals.conf"
        "remove_git_version_format.patch")
b2sums=('SKIP'
        '9f913e2262718289e4d1e9e77420617e15c682d3c9006627ea119ba8df19e3ffe6db0fe2610d9fb32daa96c361544faed334321ea35685a11241bed45ffd7958'
        'cdba5fd2988b7ead8b264d5b41f1c7adb47a6487be1e3a4ce98c0af2094d9964f4bc364237c4437014be18061f067aa741b0382f21365be497e06b189c5c7728'
        '6e1bede784da682d3ceceb06f1c783c6d4aebd97b404813143b395d90e62fb3627991bfa55ae860c8232067554ec9c611d82b3e3814097982d4cfa70ed35c95c')

prepare() {
  cd scroll
  # Patch meson.build to not use git version format (despite `git` presence in the build env)
  patch -Np1 -i "$srcdir/remove_git_version_format.patch"
}

build() {
  mkdir -p build
  arch-meson build scroll -D sd-bus-provider=libsystemd -D werror=false -D b_ndebug=true
  ninja -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 "scroll/LICENSE" "$pkgdir/usr/share/licenses/scroll/LICENSE"
  install -Dm644 "scroll/README.md" "$pkgdir/usr/share/doc/scroll/README.md"
  install -Dm644 50-systemd-user.conf -t "$pkgdir/etc/scroll/config.d/"
  install -Dm644 scroll-portals.conf "$pkgdir/usr/share/xdg-desktop-portal/scroll-portals.conf"
}
