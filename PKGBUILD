# Maintainer: Marcel Röthke <marcel@roethke.info>
# Contributor: Pierre Neidhardt <ambrevar@gmail.com>
# Contributor: csllbr; Popsch <popsch@gmx.net>

pkgname=mu
pkgver=1.14.0
pkgrel=2
pkgdesc="Maildir indexer/searcher and Emacs client (mu4e)"
arch=("x86_64" "armv7h" "aarch64")
url="http://www.djcbsoftware.nl/code/mu"
license=("GPL-3.0-or-later")
depends=("fmt" "libfmt.so" "glib2" "gmime3" "guile" "readline" "xapian-core")
makedepends=("emacs" "meson" "cli11")
optdepends=(
	"emacs: mu4e support"
)
source=("https://github.com/djcb/mu/releases/download/v${pkgver}/mu-${pkgver}.tar.xz")
sha256sums=('c5d338ee81664c29d18de757017942b14d01fe313d6fea82f8b7c66c6fd4354a')

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
