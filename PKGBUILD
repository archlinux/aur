# Maintainer: Drew DeVault <sir@cmpwn.com>
# Contributor: Antonin Décimo <antonin dot decimo at gmail dot com>
pkgname=sway-force-ssd-git
_pkgname=sway
pkgver=r7186.b3519c2d
pkgrel=2
license=("MIT")
pkgdesc="Tiling Wayland compositor and replacement for the i3 window manager, with force-enabled server side decorations"
makedepends=(
	"git"
	"meson"
	"scdoc"
	"wayland-protocols"
)
depends=(
	"cairo"
	"gdk-pixbuf2"
	"json-c"
	"pango"
	"polkit"
	"pcre2"
	"swaybg-git"
	"ttf-font"
	"wlroots-git"
	"xorg-server-xwayland"
)
optdepends=(
	"alacritty: Terminal emulator used by the default config"
	"dmenu: Application launcher"
	"grim: Screenshot utility"
	"i3status: Status line"
	"mako: Lightweight notification daemon"
	"slurp: Select a region"
	"swayidle: Idle management daemon"
	"swaylock: Screen locker"
	"wallutils: Timed wallpapers"
	"waybar: Highly customizable bar"
)
backup=(etc/sway/config)
arch=("i686" "x86_64")
url="https://swaywm.org"
source=("sway::git+https://github.com/swaywm/sway.git"
	50-systemd-user.conf
        0001-comment-out-csd-check-code.patch)
sha512sums=('SKIP'
            '57590bc0d14c87289a4a9cd67991c6a841e54244d2a6186b5da5a08e633de2e8631959fa8c77ede211b0a5f315d920f2c1350951a53d6f2e9e81859056cb3c9e'
            'c92020c064740b2605c9de7e36c93e429374429acf551900f8532059ee9c29b2ac4c728d17fec80d4c4c5a38147ae6550eff3bbef11bb01b9cada7ff56c6d705')
provides=("sway")
conflicts=("sway")
options=(debug)
install=sway.install

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
        cd "$_pkgname"
        patch --strip=1 --input="${srcdir}/0001-comment-out-csd-check-code.patch"
}

build() {
	arch-meson \
		-Dsd-bus-provider=libsystemd \
		-Dwerror=false \
		"$_pkgname" build
	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"

	install -Dm644 50-systemd-user.conf -t "$pkgdir/etc/sway/config.d/"
	# install -Dm644 "${pkgname}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

post_upgrade() {
	echo "Make sure to upgrade wlroots-git and sway-force-ssd-git together."
	echo "Upgrading one but not the other is unsupported."
}
