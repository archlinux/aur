# Maintainer: tomKPZ <tomKPZ@gmail.com>
# sway-git maintainer: Drew DeVault <sir@cmpwn.com>
# sway-git contributor: Antonin Décimo <antonin dot decimo at gmail dot com>
# wlroots-git maintainer: Adrian Perez de Castro <aperez@igalia.com>
# wlroots-git maintainer: Antonin Décimo <antonin dot decimo at gmail dot com>

pkgname=sway-git-wlroots-git
pkgver=r7160.91079079.r6503.b18c7664.1684079450.661740254
pkgrel=4
license=("MIT" "custom:MIT")
pkgdesc="sway with wlroots statically linked"
makedepends=(
	git
	meson
	scdoc
	vulkan-headers
	wayland-protocols
	xorgproto
)
depends=(
	cairo
	gdk-pixbuf2
	glslang
	json-c
	libdisplay-info
	libinput
	libxcb
	libxkbcommon
	opengl-driver
	pango
	pcre
	pixman
	polkit
	seatd
	swaybg
	ttf-font
	vulkan-icd-loader
	vulkan-validation-layers
	wayland
	xcb-util-errors
	xcb-util-renderutil
	xcb-util-wm
	xorg-server-xwayland
	xorg-xwayland
)
optdepends=(
	"alacritty: Terminal emulator used by the default config"
	"dmenu: Application launcher"
	"grim: Screenshot utility"
	"i3status: Status line"
	"mako: Lightweight notification daemon"
	"slurp: Select a region"
	"swaybg: Wallpaper tool for sway"
	"swayidle: Idle management daemon"
	"swaylock: Screen locker"
	"wallutils: Timed wallpapers"
	"waybar: Highly customizable bar"
)
backup=(etc/sway/config)
arch=("x86_64")
url="https://swaywm.org"
source=("git+https://github.com/swaywm/sway.git"
	"git+https://gitlab.freedesktop.org/wlroots/wlroots.git")
sha512sums=('SKIP'
	'SKIP')
provides=("sway")
conflicts=("sway")
options=()

pkgver() {
	printf "r%s.%s.r%s.%s" \
		"$(git -C sway rev-list --count HEAD)" \
		"$(git -C sway rev-parse --short HEAD)" \
		"$(git -C wlroots rev-list --count HEAD)" \
		"$(git -C wlroots rev-parse --short HEAD)"
}

build() {
	mkdir -p sway/subprojects
	ln -sf ../../wlroots sway/subprojects/wlroots
	arch-meson \
		-Dsd-bus-provider=libsystemd \
		-Dwerror=false \
		-Ddefault_library=static \
		sway build
	meson compile -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
	# Remove wlroots headers, static library, and pkgconfig file.
	rm -rf "$pkgdir/usr/include" "$pkgdir/usr/lib"

	install -Dm644 "sway/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.sway"
	install -Dm644 "wlroots/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.wlroots"
}

patchdir=${XDG_CONFIG_HOME:-$HOME/.config}/makepkg-patches/$pkgname

_pkgver_suffix=$(
	shopt -s globstar
	shopt -s nullglob
	stat -c '%.Y' $patchdir $patchdir/**/*.patch |
		sort -n | tail -n 1 | tr -d '\n'
)

dup_fn() {
	test -n "$(declare -f "$1")" || return
	eval "${_/$1/$1.orig}"
}

dup_fn pkgver || pkgver.orig() { printf $pkgver; }
pkgver() {
	printf "$(pkgver.orig).$_pkgver_suffix"
}

dup_fn prepare || prepare.orig() { return 0; }
prepare() {
	(
		shopt -s nullglob
		for patch in $patchdir/*.patch; do
			git apply -3 $patch
		done
		for repo in $patchdir/*/; do
			for patch in $repo/*.patch; do
				git -C $(basename $repo) apply -3 $patch
			done
		done
	)
	prepare.orig
}
