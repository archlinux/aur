# Maintainer: Glax <its@glax.dev>
_pkgname=beyond-cubed
pkgname="${_pkgname}-git"
pkgver=r37.9cb67a6
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
	"a44ffdeb6295bc8fe15091dcf1e766c606129be376ea2cc2e74cd81d18f1068b"
	"303fb21657ac89786771a132702a7b50c03c4bd9ed3e6dc503fba80897124ef7")

prepare() {
	cd "${srcdir}/${_pkgname}"
    patch -Np1 -i "../hidapi-linking.patch"
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
	install -D "${srcdir}/${_pkgname}/target/release/${_pkgname}" "${pkgdir}/opt/${_pkgname}/${_pkgname}"
	install -D "${srcdir}/${_pkgname}/target/release/${_pkgname}-cli" "${pkgdir}/opt/${_pkgname}/${_pkgname}-cli"
	# Add .desktop entry
	install -D "${srcdir}/beyond-cubed.desktop" "${pkgdir}/usr/share/applications/beyond-cubed.desktop"
}
