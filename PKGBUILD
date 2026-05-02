# Maintainer: Marcel Röthke <marcel@roethke.info>
# Contributor: Pierre Neidhardt <ambrevar@gmail.com>
# Contributor: csllbr; Popsch <popsch@gmx.net>

pkgname=mu
pkgver=1.14.1
pkgrel=2
pkgdesc="Maildir indexer/searcher and Emacs client (mu4e)"
arch=("x86_64" "armv7h" "aarch64")
url="http://www.djcbsoftware.nl/code/mu"
license=("GPL-3.0-or-later")
depends=("fmt" "libfmt.so" "glib2" "gmime3" "guile" "readline" "libreadline.so" "xapian-core" "libxapian.so")
makedepends=("emacs" "meson" "cli11")
optdepends=(
	"emacs: mu4e support"
)
source=("https://github.com/djcb/mu/releases/download/v${pkgver}/mu-${pkgver}.tar.xz")
sha256sums=('e41aa8530d01ae4696f6efc88c5e051dd8540f3ff7956918bf0976f1d6b1c2bb')

prepare() {
	cd "$pkgname-$pkgver"
	arch-meson \
		-Dc_args="${CFLAGS}" \
		-Dcpp_args="${CFLAGS}" \
		-Dc_link_args="${LDFLAGS}" \
		-Dcpp_link_args="${LDFLAGS}" \
		-Dscm=enabled \
		-Dreadline=enabled \
		-Dcld2=disabled \
		build
}


build() {
	cd "$pkgname-$pkgver"
	ninja -C build
}

check() {
	cd "$pkgname-$pkgver"
	ninja -C build test
}

package() {
	cd "$pkgname-$pkgver"
	DESTDIR="${pkgdir}" meson install -C build
}
