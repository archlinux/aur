# Maintainer: emersion <contact emersion fr>
pkgname=grim-git
_pkgname=grim
pkgver=1.4.0.r6.g1573b1020ce2
pkgrel=2
license=('MIT')
pkgdesc='Grab images from a Wayland compositor'
makedepends=("meson" "scdoc" "git")
depends=(
	"pango"
	"wayland"
	"wayland-protocols"
	"libjpeg-turbo"
)
arch=("i686" "x86_64")
url='https://sr.ht/~emersion/grim'
source=("${pkgname%-*}::git+https://git.sr.ht/~emersion/grim")
sha1sums=('SKIP')
provides=('grim')
conflicts=('grim')
options=(debug !strip)

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --abbrev=12 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_pkgname}"

	arch-meson build/
	meson compile -C build/
}

package() {
	cd "${srcdir}/${_pkgname}"

	if [ -f LICENSE ]; then
		install -D -m 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
	fi

	DESTDIR="$pkgdir/" ninja -C build install
}
