# Maintainer : Keshav Padram <(the.ridikulus.rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>

_pkgname="elilo"
pkgname="${_pkgname}-efi"

pkgver="3.16"
pkgrel="1"
pkgdesc="UEFI version of LILO Boot Loader"
arch=('any')
url="http://sourceforge.net/projects/elilo/"
license=('GPL')

makedepends=('gnu-efi-libs')
depends=('dosfstools' 'efibootmgr')
options=('!strip' 'purge' '!libtool' '!emptydirs' '!makeflags')

install="${pkgname}.install"

source=("http://downloads.sourceforge.net/project/elilo/elilo/elilo-${pkgver}/elilo-${pkgver}-all.tar.gz"
        "elilo.conf.example")

sha1sums=('bd0bd4f1b3dc2d23a304f957ffbf907ae104f323'
          'b961f6181504f7d1bf4b14f76c0477159fc54445')

build() {
	
	if [[ "${CARCH}" != "x86_64" ]]; then
		echo "${pkgname} package can be built only in a x86_64 system. Exiting."
		exit 1
	else
		cd "${srcdir}/"
		bsdtar xf "${srcdir}/elilo-${pkgver}-source.tar.gz"
	fi
	
	cd "${srcdir}/elilo-${pkgver}-source/"
	rm -f "${srcdir}"/*.efi || true
	rm -f "${srcdir}/elilo-${pkgver}-source.tar.gz" || true
	
	## Fix ARCH Makefile variable
	sed 's|ARCH	   :=|ARCH	   ?=|g' -i "${srcdir}/elilo-${pkgver}-source/Make.defaults" || true
	sed 's|dpkg-architecture -qDEB_BUILD_ARCH|uname -m|g' -i "${srcdir}/elilo-${pkgver}-source/Make.defaults" || true
	
	## Fix -Werror issues
	sed 's|DEBUGFLAGS = -Wall|DEBUGFLAGS = -Wall -Wno-error|g' -i "${srcdir}/elilo-${pkgver}-source/Make.defaults" || true
	
	## Enable ext2 drivers - build fails for now 
	# sed 's|^CONFIG_ext2fs=n|CONFIG_ext2fs=y|g' -i "${srcdir}/elilo-${pkgver}-source/Make.defaults" || true
	
	cp -r "${srcdir}/elilo-${pkgver}-source" "${srcdir}/elilo-${pkgver}-x86_64"
	cd "${srcdir}/elilo-${pkgver}-x86_64/"
	
	unset CFLAGS
	unset CPPFLAGS
	unset CXXFLAGS
	unset LDFLAGS
	unset MAKEFLAGS
	
	ARCH="x86_64" make
	echo
	
	cp -r "${srcdir}/elilo-${pkgver}-source" "${srcdir}/elilo-${pkgver}-ia32"
	cd "${srcdir}/elilo-${pkgver}-ia32/"
	
	unset CFLAGS
	unset CPPFLAGS
	unset CXXFLAGS
	unset LDFLAGS
	unset MAKEFLAGS
	
	ARCH="ia32" make
	echo
	
}


package() {
	
	install -d "${pkgdir}/usr/lib/elilo"
	install -D -m0644 "${srcdir}/elilo-${pkgver}-x86_64/elilo.efi" "${pkgdir}/usr/lib/elilo/elilox64.efi"
	install -D -m0644 "${srcdir}/elilo-${pkgver}-ia32/elilo.efi" "${pkgdir}/usr/lib/elilo/eliloia32.efi"
	
	install -d "${pkgdir}/usr/lib/elilo/config"
	install -D -m0644 "${srcdir}/elilo.conf.example" "${pkgdir}/usr/lib/elilo/config/elilo.conf"
	
}
