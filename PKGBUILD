# Maintainer : Keshav Padram <(the.ridikulus.rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>

_pkgname="elilo"
pkgname="${_pkgname}-efi"

pkgver="3.16"
pkgrel="3"
pkgdesc="UEFI version of LILO Boot Loader"
arch=('x86_64' 'i686')
url="http://sourceforge.net/projects/elilo/"
license=('GPL')

makedepends=('gnu-efi-libs')
depends=('dosfstools' 'efibootmgr')
options=('!strip' '!purge' '!libtool' '!emptydirs' '!makeflags')

install="${pkgname}.install"

source=("http://downloads.sourceforge.net/project/elilo/elilo/elilo-${pkgver}/elilo-${pkgver}-all.tar.gz"
        "elilo.conf")

sha1sums=('bd0bd4f1b3dc2d23a304f957ffbf907ae104f323'
          'b4c2eb097f733f0169d930af12ad590e47adf4b7')

build() {
	
	if [[ "${CARCH}" != "x86_64" ]]; then
		echo "${pkgname} package can be built only in a x86_64 system. Exiting."
		exit 1
	fi
	
	bsdtar -C "${srcdir}/" -xf "${srcdir}/elilo-${pkgver}-source.tar.gz"
	echo
	
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
	
	cd "${srcdir}/elilo-${pkgver}-source/"
	
	## Unset all compiler FLAGS
	unset CFLAGS
	unset CPPFLAGS
	unset CXXFLAGS
	unset LDFLAGS
	unset MAKEFLAGS
	
	make
	echo
	
}


package() {
	
	## Install elilo.efi
	install -d "${pkgdir}/usr/lib/elilo"
	install -D -m0644 "${srcdir}/elilo-${pkgver}-source/elilo.efi" "${pkgdir}/usr/lib/elilo/elilo.efi"
	
	## Install example elilo.conf
	install -d "${pkgdir}/usr/lib/elilo/config"
	install -D -m0644 "${srcdir}/elilo.conf" "${pkgdir}/usr/lib/elilo/config/elilo.conf"
	
}
