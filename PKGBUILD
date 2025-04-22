# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=blahaj-git
_pkgname="${pkgname%-git}"
pkgver=2.2.0.r33.2f08a51
pkgrel=1
pkgdesc="Gay sharks at your local terminal - lolcat-like CLI tool (git version)"
url="https://blahaj.geopjr.dev"
arch=('x86_64')
license=('BSD-2-Clause')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('crystal' 'libyaml')
makedepends=('git' 'shards')
source=("${_pkgname}::git+https://codeberg.org/GeopJr/BLAHAJ.git")
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	printf "%s.r%s.%s" "$(git describe --tags --abbrev=0 | sed 's/^v//')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
	cd "${_pkgname}"
	CRYSTAL_CACHE_DIR=crystal make build_mt
}

check () {
	cd "${_pkgname}"
	CRYSTAL_CACHE_DIR=crystal make test_mt
}

package() {
	cd "${_pkgname}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install

	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm 644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
