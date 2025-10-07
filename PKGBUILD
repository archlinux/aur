# Maintainer: Marcel Röthke <marcel@roethke.info>
# Contributor: Pierre Neidhardt <ambrevar@gmail.com>
# Contributor: csllbr; Popsch <popsch@gmx.net>

pkgname=mu
pkgver=1.12.13
pkgrel=3
pkgdesc="Maildir indexer/searcher and Emacs client (mu4e)"
arch=("x86_64" "armv7h" "aarch64")
url="http://www.djcbsoftware.nl/code/mu"
license=("GPL-3.0-or-later")
depends=("gmime3" "xapian-core" "readline" "glib2" "fmt" "libfmt.so")
makedepends=("emacs" "meson" "guile" "cli11")
optdepends=(
	"emacs: mu4e support"
	"guile: guile bindings"
)
source=(
	"https://github.com/djcb/mu/releases/download/v${pkgver}/mu-${pkgver}.tar.xz"
	"https://github.com/djcb/mu/commit/0a4fabbf446d15b538600dfe7d879cad70ce941e.patch"
)
sha256sums=(
	'7908078c5cc90afc7c038d4372b33b404f7fddfe466a27994413dc06f993a445'
	'24b385afcc508550e6edb745c03d320c2de37905128b15da348455814b2a7327'
)

prepare() {
	cd "$pkgname-$pkgver"
	arch-meson \
		-Dc_args="${CFLAGS}" \
		-Dcpp_args="${CFLAGS}" \
		-Dc_link_args="${LDFLAGS}" \
		-Dcpp_link_args="${LDFLAGS}" \
		-Dguile=enabled \
		-Dreadline=enabled \
		-Dcld2=disabled \
		build

	patch -p1 < "${srcdir}/0a4fabbf446d15b538600dfe7d879cad70ce941e.patch"

}


build() {
	cd "$pkgname-$pkgver"
	ninja -C build
}

package() {
	cd "$pkgname-$pkgver"
	DESTDIR="${pkgdir}" meson install -C build
}
