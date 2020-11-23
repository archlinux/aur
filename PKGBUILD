# Maintainer: 404DeadLink <>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Keshav Amburay <(the ddoott ridikulus ddoott rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>

pkgname=efivar-static
pkgdesc="static libraries and executable to work with EFI variables"
pkgver=37
pkgrel=4
arch=('x86_64')
url="https://github.com/rhboot/efivar"
license=('LGPL2.1')
makedepends=('git')
depends=('glibc')
provides=('libefiboot.a' 'libefivar.a')
source=("git+https://github.com/rhinstaller/efivar.git#tag=${pkgver}")
sha512sums=('SKIP')

prepare() {
	mv -v "${pkgname%-static}" "${pkgname}-${pkgver}"
	cd "${pkgname}-${pkgver}"
	# -Werror, not even once
	sed -e 's/-Werror//g' -i gcc.specs
	# remove insecure rpath in efivar-tester
	sed 's|-rpath,$(TOPDIR)/src|-rpath,$(libdir)|g' -i src/test/Makefile
}

build() {
	cd "${pkgname}-${pkgver}"
	make libdir="/usr/lib/" \
	     bindir="/usr/bin/" \
	     mandir="/usr/share/man/" \
	     includedir="/usr/include/"\
	     static
}

package() {
	cd "${pkgname}-${pkgver}/src"
	install -dm 755 "${pkgdir}/usr/lib"
	install -dm 755 "${pkgdir}/usr/bin"
	install -m 755 "${provides[@]}" "${pkgdir}/usr/lib"
	install -m 755 "efivar-static" "${pkgdir}/usr/bin"
}
