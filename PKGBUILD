# Maintainer: Ali Furkan Yıldız <alifurkanyildiz@gmail.com>
# sway-git Maintainer: Drew DeVault <sir@cmpwn.com>
# sway-git Contributor: Antonin Décimo <antonin dot decimo at gmail dot com>
pkgname=sway-afy-git
_pkgname=sway
pkgver=r7134.48d6eda3_2.c8afbcc
pkgrel=1
license=("MIT")
pkgdesc="sway-git, with added patches, including an env command"
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
source=("${_pkgname}::git+https://github.com/swaywm/sway.git"
	"${_pkgname}-patches::git+https://gitlab.com/alifurkany/sway-patches"
	50-systemd-user.conf)
sha512sums=('SKIP'
            'SKIP'
            'c2b7d808f4231f318e03789015624fd4cf32b81434b15406570b4e144c0defc54e216d881447e6fd9fc18d7da608cccb61c32e0e1fab2f1fe2750acf812d3137')
provides=("sway")
conflicts=("sway")
options=(debug)
install=sway.install

pkgver() {
	cd "$_pkgname"
	rev_list_sway="$(git rev-list --count HEAD)"
	rev_parse_sway="$(git rev-parse --short HEAD)"
	cd ..
	cd "$_pkgname-patches"
	rev_list_patches="$(git rev-list --count HEAD)"
	rev_parse_patches="$(git rev-parse --short HEAD)"
	printf "r%s.%s_%s.%s" "$rev_list_sway" "$rev_parse_sway" "$rev_list_patches" "$rev_parse_patches"
}

prepare() {
	cd "$_pkgname"
	git reset --hard
	git clean -fd
	for patch in ../"$_pkgname"-patches/*.patch; do
		patch --forward --strip=1 --input="$patch"
	done
}

build() {
	arch-meson \
		-Dsd-bus-provider=libsystemd \
		-Dwerror=false \
		"$_pkgname" build
	meson compile -C build
}

package() {
	install -Dm644 50-systemd-user.conf -t "$pkgdir/etc/sway/config.d/"

	DESTDIR="$pkgdir" meson install -C build

        cd "$_pkgname"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	for util in autoname-workspaces.py inactive-windows-transparency.py grimshot; do
		install -Dm755 "contrib/$util" -t "$pkgdir/usr/share/$pkgname/scripts"
	done
}

post_upgrade() {
	echo "Make sure to upgrade wlroots-git and sway-afy-git together."
	echo "Upgrading one but not the other is unsupported."
}
