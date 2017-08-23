# Maintainer: David Manouchehri
# Contributor: anatolik
# Contributor: fill <mailbox@fillo.ru>

_gitname=flashrom
pkgname="${_gitname}-git"
_gitbranch=staging
_gitauthor=flashrom
pkgdesc="Flashrom is a utility which can be used to detect, read, erase, or write BIOS chips (DIP, PLCC, SPI)."
url="https://github.com/${_gitauthor}/${_gitname}"
license=('GPL')
source=("git://github.com/${_gitauthor}/${_gitname}#branch=${_gitbranch}")
depends=('libftdi-compat' 'libusb' 'pciutils')
makedepends=('git')
optdepends=("dmidecode: for SMBIOS/DMI table decoder support")
conflicts=("${_gitname}")
provides=("${_gitname}")
replaces=("${_gitname}-svn")
sha512sums=('SKIP')
arch=('aarch64' 'armv6h' 'armv7h' 'i686' 'x86_64')
pkgver=0.9.9.r47.gaa91d5c
pkgrel=1

pkgver() {
	cd "${srcdir}/${_gitname}"
	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "${srcdir}/${_gitname}"
	make
}

package() {
	cd "${srcdir}/${_gitname}"
	make PREFIX="${pkgdir}/usr" install
	mv "${pkgdir}/usr/sbin" "${pkgdir}/usr/bin"
}

# vim:set et sw=2 sts=2 tw=80:
