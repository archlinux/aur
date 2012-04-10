# Maintainer : Keshav P R <(the.ridikulus.rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>

_pkgname="elilo"
pkgname="${_pkgname}-x86_64"

pkgver="3.14"
pkgrel="1"
pkgdesc="x86_64 UEFI version of LILO Boot Loader"
arch=('any')
url="http://sourceforge.net/projects/elilo/"
license=('GPL')

makedepends=('gnu-efi')
depends=('dosfstools' 'efibootmgr')
options=('!strip' 'purge' '!libtool' '!emptydirs')

install="${pkgname}.install"
backup=("boot/efi/efi/arch/elilo/elilo.conf")

source=("http://downloads.sourceforge.net/project/elilo/elilo/elilo-${pkgver}/elilo-${pkgver}-all.tar.gz"
        "elilo.conf.example")

sha1sums=('631fdf211627510b270f0759c26587edb8d30001'
          'f38e5194ec100e6c5163a4db570b240e19b37da0')

_extract_source() {
	
	cd "${srcdir}/"
	
	bsdtar xf "${srcdir}/elilo-${pkgver}-source.tar.gz"
	
}

build() {
	
	if [[ "${CARCH}" != "x86_64" ]]; then
		echo "${pkgname} package can be built only in a x86_64 system. Exiting."
		exit 1
	else
		_extract_source
	fi
	
	cd "${srcdir}/elilo/"
	
	## Enable ext2 drivers - build fails for now 
	# sed 's|CONFIG_ext2fs=n|CONFIG_ext2fs=y|g' -i "${srcdir}/elilo/Make.defaults" || true
	sed 's|DEBUGFLAGS = -Wall|DEBUGFLAGS = -Wall -Wno-error|g' -i "${srcdir}/elilo/Make.defaults" || true
	
	CFLAGS="" make
	echo
	
}


package() {
	
	cd "${srcdir}/elilo/"
	
	install -d "${pkgdir}/boot/efi/efi/arch/elilo/"
	install -D -m0644 "${srcdir}/elilo/elilo.efi" "${pkgdir}/boot/efi/efi/arch/elilo/elilox64.efi"
	install -D -m0644 "${srcdir}/elilo.conf.example" "${pkgdir}/boot/efi/efi/arch/elilo/elilo.conf"
	
	# install -d "${pkgdir}/usr/sbin/"
	# install -D -m0755 "${srcdir}/elilo/tools/eliloalt" "${pkgdir}/usr/sbin/eliloalt"
	
}
