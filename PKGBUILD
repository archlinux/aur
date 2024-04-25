# Maintainer: Giorgi Taba K'obakhidze <t@gtk.ge>

pkgname=wownero-seed-git
_pkgname="${pkgname%-git}"
pkgver=0.3.0.r1.gd3f68be
pkgrel=11
pkgdesc='14-word mnemonic seed for Wownero'
arch=('x86_64')
url="https://git.wownero.com/wowlet/${_pkgname}"
license=('MIT')
options=('!strip')
makedepends=('git' 'cmake')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${pkgname}"::"git+${url}")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	( set -o pipefail
		git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	)
}

build() {
	cd "$pkgname"
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -B build
	make -C build
}

package() {
	cd "$pkgname"
	make -C build DESTDIR="$pkgdir" install
}
