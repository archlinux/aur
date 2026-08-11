# Maintainer: Marcel Röthke <marcel@roethke.info>
# Contributor: Pierre Neidhardt <ambrevar@gmail.com>
# Contributor: csllbr; Popsch <popsch@gmx.net>

pkgname=mu
pkgver=1.14.3
pkgrel=1
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
sha256sums=('edea1a4e6be390a2bf5260e0156813f9b473c2d91da934b219dbb38229b0930a')

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
