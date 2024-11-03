# Maintainer: Thomas Booker <tw.booker@outlook.com>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=phosh-git
pkgver=0.42.0.r106.g806a6ca1
pkgrel=1
pkgdesc='A pure Wayland shell prototype for GNOME on mobile devices'
arch=(x86_64 aarch64 armv7h)
url='https://gitlab.gnome.org/World/Phosh/phosh'
license=(GPL3)
depends=(
	gtk3
	libhandy
	gnome-desktop
	gnome-session
	upower
	libpulse
	gcr
	libnm
	evolution-data-server
	phoc
	gnome-shell
	callaudiod
	polkit
	libadwaita
	evince

	libical
	libedataserverui4
	squeekboard
	fribidi
	wayland
	libsecret
	gnome-bluetooth-3.0
)
makedepends=(
	meson
	git
	wayland-protocols
	python-docutils
	python-packaging
	feedbackd
	glib2-devel
)
checkdepends=(
	xorg-server-xvfb
	xorg-xauth
)
optdepends=(
	'iio-sensor-proxy: accelerometer and other sensors'
	'feedbackd: haptic/visual/audio feedback'
	'xdg-desktop-portal-gtk: for screenshot support'
	'xdg-desktop-portal-wlr: for screencasts support'
)

provides=(phosh)
conflicts=(phosh)
source=(
	"git+${url}.git"
	"pam_phosh"
)
sha256sums=(
	'SKIP'
	'b7793f80c533e84ad8adfe8bb46c69f107575e724aa9b53b41f370baa37e4fd5'
)

pkgver() {
	cd phosh
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd phosh
	git submodule update --init
}

build() {
	# If we don't set `libexecdir` then meson will try and place the phosh bin in /lib/phosh and collide with the dir so we put it in /lib/phosh/phosh
	# Disable creating man pages becuse rst2man throws locale.Error: unsupported locale setting
	arch-meson --libexecdir="/usr/lib/phosh" \
	--wrap-mode default \
	-D tests=true \
	-D phoc_tests=disabled \
	-D man=false \
	-D gtk_doc=false \
	-D callui-i18n=true \
	-D lockscreen-plugins=true \
	phosh _build 
	meson compile -C _build
}

check() {
	LANG=C.UTF8 xvfb-run meson test --no-suite screenshots -C _build
}

package() {
	DESTDIR="${pkgdir}" meson install -C _build

	# make squeekboard the default keyboard 
	mkdir -p "$pkgdir"/usr/share/applications
	ln -s sm.puri.Squeekboard.desktop "$pkgdir"/usr/share/applications/sm.puri.OSK0.desktop


	install -Dm644 "$srcdir"/pam_phosh \
		"$pkgdir"/etc/pam.d/phosh
}
