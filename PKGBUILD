# Maintainer : Keshav Padram <(the.ridikulus.rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>

_pkgname="elilo"
pkgname="${_pkgname}-efi"

pkgver="3.16"
pkgrel="2"
pkgdesc="UEFI version of LILO Boot Loader"
arch=('any')
url="http://sourceforge.net/projects/elilo/"
license=('GPL')

makedepends=('gnu-efi-libs')
depends=('dosfstools' 'efibootmgr')
options=('!strip' '!purge' '!libtool' '!emptydirs' '!makeflags')

install="${pkgname}.install"

source=("http://downloads.sourceforge.net/project/elilo/elilo/elilo-${pkgver}/elilo-${pkgver}-all.tar.gz"
        "elilo.conf")

sha1sums=('bd0bd4f1b3dc2d23a304f957ffbf907ae104f323'
          '2366629b137572f91774a0bdf907864dd7fe3172')

_build_elilo-efi-x86_64() {
	
	cp -r "${srcdir}/elilo-${pkgver}-source" "${srcdir}/elilo-${pkgver}-x86_64"
	cd "${srcdir}/elilo-${pkgver}-x86_64/"
	
	## Unset all compiler FLAGS
	unset CFLAGS
	unset CPPFLAGS
	unset CXXFLAGS
	unset LDFLAGS
	unset MAKEFLAGS
	
	echo
	make ARCH="x86_64"
	echo
	
}

_build_elilo-efi-ia32() {
	
	cp -r "${srcdir}/elilo-${pkgver}-source" "${srcdir}/elilo-${pkgver}-ia32"
	cd "${srcdir}/elilo-${pkgver}-ia32/"
	
	## Unset all compiler FLAGS
	unset CFLAGS
	unset CPPFLAGS
	unset CXXFLAGS
	unset LDFLAGS
	unset MAKEFLAGS
	
	echo
	make ARCH="ia32"
	echo
	
}

build() {
	
	if [[ "${CARCH}" != "x86_64" ]]; then
		echo "${pkgname} package can be built only in a x86_64 system. Exiting."
		exit 1
	fi
	
	bsdtar -C "${srcdir}/" -xf "${srcdir}/elilo-${pkgver}-source.tar.gz"
	
	cd "${srcdir}/elilo-${pkgver}-source/"
	
	## Delete unwanted files
	rm -f "${srcdir}"/*.efi || true
	rm -f "${srcdir}/elilo-${pkgver}-source.tar.gz" || true
	
	## Enable gnu-efi ms_abi support
	sed 's|-fno-stack-protector|-DGNU_EFI_USE_MS_ABI -fno-stack-protector|g' -i "${srcdir}/elilo-${pkgver}-source/Make.defaults" || true
	
	## Use "uname -m" to determine ARCH
	sed 's|dpkg-architecture -qDEB_BUILD_ARCH|uname -m|g' -i "${srcdir}/elilo-${pkgver}-source/Make.defaults" || true
	
	## Fix -Werror build failure
	sed 's|DEBUGFLAGS = -Wall|DEBUGFLAGS = -Wall -Wno-error|g' -i "${srcdir}/elilo-${pkgver}-source/Make.defaults" || true
	
	## Compile elilox64.efi
	_build_elilo-efi-x86_64
	
	## Compile eliloia32.efi
	_build_elilo-efi-ia32
	
}


package() {
	
	## Install elilox64.efi and eliloia32.efi
	install -d "${pkgdir}/usr/lib/elilo"
	install -D -m0644 "${srcdir}/elilo-${pkgver}-x86_64/elilo.efi" "${pkgdir}/usr/lib/elilo/elilox64.efi"
	install -D -m0644 "${srcdir}/elilo-${pkgver}-ia32/elilo.efi" "${pkgdir}/usr/lib/elilo/eliloia32.efi"
	
	## Install example elilo.conf
	install -d "${pkgdir}/usr/lib/elilo/config"
	install -D -m0644 "${srcdir}/elilo.conf" "${pkgdir}/usr/lib/elilo/config/elilo.conf"
	
}
