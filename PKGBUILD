# Maintainer: Glax <its@glax.dev>
_pkgname=beyond-cubed
pkgname="${_pkgname}-git"
pkgver=r40.e3ee9a7
pkgrel=2
pkgdesc="An attempt at reverse engineering and reimplementing all the functions of the official Bigscreen Beyond utility."
arch=('x86_64')
url="https://gitlab.com/coolGi/beyond-cubed"
license=('LGPL 3.0')
depends=('hidapi')
makedepends=('git' 'cargo')
provides=("${pkgname%}")
conflicts=("${pkgname%}")
replaces=("${_pkgname}")
source=("git+${url}"
	"hidapi-linking.patch"
	"beyond-cubed.desktop")
sha256sums=('SKIP'
	"7366d8a07b1fb097ea15db9d1bc2b21a1f13fa36b06c7060a460fa289b84f15b"
	"92f82b9223d7447fb018be4f09a7c0a9f67b2fdc1c8c9b2f5703a36219a2ea7c")

prepare() {
	cd "${srcdir}/${_pkgname}"
        patch -Np1 --fuzz=3 -i "../hidapi-linking.patch"
}

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}"
	cargo build --release --bins --locked
}

package() {
	install -D "${srcdir}/${_pkgname}/target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -D "${srcdir}/${_pkgname}/target/release/${_pkgname}-cli" "${pkgdir}/usr/bin/${_pkgname}-cli"
	# Add .desktop entry
	install -D "${srcdir}/beyond-cubed.desktop" "${pkgdir}/usr/share/applications/beyond-cubed.desktop"
}
