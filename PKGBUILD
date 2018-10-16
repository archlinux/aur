# Maintainer: Thomas Booker <tw.booker@outlook.com>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=phosh-next
pkgver=next.20220923.2142.r0.g804f3759
pkgrel=1
pkgdesc="Merge requests that are lining up to be merged into the phosh's development branch"
arch=(x86_64 aarch64 armv7h)
url='https://source.puri.sm/Librem5/phosh-next'
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
	'phoc-embedded-wlroots>=0.21.0'
	gnome-shell
	callaudiod
	polkit
)
makedepends=(
	meson
	git
	wayland-protocols
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
	cd phosh-next
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd phosh-next

	git submodule init
	git submodule update
}

build() {
	# If we don't set `libexecdir` then meson will try and place the phosh bin in /lib/phosh and collide with the dir so we put it in /lib/phosh/phosh
	arch-meson --libexecdir="/usr/lib/phosh" -D tests=false -D systemd=true phosh-next _build 
	meson compile -C _build
}

package() {
	DESTDIR="${pkgdir}" meson install -C _build

		install -Dm644 "$srcdir"/pam_phosh \
			"$pkgdir"/etc/pam.d/phosh
}
