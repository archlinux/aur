# Maintainer: Thomas Booker <tw.booker@outlook.com>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=phosh
pkgver=0.24.0
pkgrel=1
pkgdesc='A pure Wayland shell prototype for GNOME on mobile devices'
arch=(x86_64 aarch64 armv7h)
url='https://gitlab.gnome.org/World/Phosh/phosh'
license=(GPL3)
depends=(
	gtk3
	'libhandy>=1.1.90'
	gnome-desktop
	gnome-session
	upower
	libpulse
	gcr
	feedbackd
	libnm
	evolution-data-server
	# Replace this with phoc once it works.
	#'phoc>=0.21.0'
	phoc-embedded-wlroots
	gnome-shell
	callaudiod
	polkit
	libadwaita
	evince
)
makedepends=(
	meson
	git
	wayland-protocols
)
_tag=81ec8c86 # git rev-parse v${pkgver}
source=(
	"git+${url}.git#tag=${_tag}"
	"pam_phosh"
)
sha256sums=(
	'SKIP'
	'b7793f80c533e84ad8adfe8bb46c69f107575e724aa9b53b41f370baa37e4fd5'
)

pkgver() {
	cd phosh
	git describe --tags | sed 's/^v//'
}

prepare() {
	cd phosh

	git submodule update --init
}

build() {
	# If we don't set `libexecdir` then meson will try and place the phosh bin in /lib/phosh and collide with the dir so we put it in /lib/phosh/phosh
	arch-meson --libexecdir="/usr/lib/phosh" -D tests=true -D phoc_tests=disabled -D man=true -D gtk_doc=false -D callui-i18n=true -D lockscreen-plugins=true -D systemd=true phosh _build 
	meson compile -C _build
}

check() {
	xvfb-run meson test --no-suite screenshots -C _build
}

package() {
	DESTDIR="${pkgdir}" meson install -C _build

		install -Dm644 "$srcdir"/pam_phosh \
			"$pkgdir"/etc/pam.d/phosh
}
