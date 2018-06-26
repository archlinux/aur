# Maintainer: Luke Street <luke.street@encounterpc.com>
# Contributor: David Manouchehri
# Contributor: anatolik
# Contributor: fill <mailbox@fillo.ru>

_gitname=flashrom
pkgname="${_gitname}-git"
_gitbranch=master
_gitauthor=flashrom
pkgdesc="Flashrom is a utility which can be used to detect, read, erase, or write BIOS chips (DIP, PLCC, SPI)."
url="https://github.com/${_gitauthor}/${_gitname}"
license=('GPL')
source=("git://github.com/${_gitauthor}/${_gitname}#branch=${_gitbranch}"
        '0001-digilent_spi-Avoid-deprecated-libusb-function.patch')
depends=('libftdi-compat' 'libusb' 'pciutils')
makedepends=('git')
optdepends=("dmidecode: for SMBIOS/DMI table decoder support")
conflicts=("${_gitname}")
provides=("${_gitname}")
replaces=("${_gitname}-svn")
sha512sums=('SKIP'
            '6930c34dcd5bc0079d4530bce5543d49492af834a794ca8569c1cccc40b6771c86936cdec05e06dd6fca60c27599af33afcf5eb6d8b5c4894736aa183ffbadb9')
arch=('aarch64' 'armv6h' 'armv7h' 'i686' 'x86_64')
pkgver=p1.0.r85.gb2154e8
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
	patch -Np1 -i "../0001-digilent_spi-Avoid-deprecated-libusb-function.patch"
	make
}

package() {
	cd "${srcdir}/${_gitname}"
	make PREFIX="${pkgdir}/usr" install
	mv "${pkgdir}/usr/sbin" "${pkgdir}/usr/bin"
}

# vim:set et sw=2 sts=2 tw=80:
