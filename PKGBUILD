# Maintainer: Taylor Smock <vorpalblade77@gmail.com>
# contributor: Keshav Amburay <(the ddoott ridikulus ddoott rat) (aatt)
# (gemmaeiil) (ddoott) (ccoomm)>

__pkgname="shim"
pkgname="${__pkgname}-efi"

pkgver=14
pkgrel=1
pkgdesc="Simple bootloader for x86_64 UEFI Secure Boot"
url="https://github.com/rhinstaller/${__pkgname}"
arch=('x86_64')
license=('GPL')
options=('!strip')

makedepends=('gnu-efi-libs')
depends=('pesign' 'dosfstools' 'efivar' 'efibootmgr')
optdepends=('mactel-boot: For bless command in Apple Mac systems')

conflicts=("${pkgname}-git" 'shim-efi-x86_64' 'shim-efi-x86_64-git')
provides=("${pkgname}=${pkgver}" "shim-efi-x86_64=${pkgver}"
"shim-efi-x86_64-git=${pkgver}")
install="${__pkgname}.install"
changelog="${__pkgname}.changelog"
source=("${url}/releases/download/${pkgver}/${__pkgname}-${pkgver}.tar.bz2"
	${__pkgname}.patch)
sha256sums=('11584881af2cb990a5a782747558ebd3a182b766f2747bd0c0955cbf4786285e'
            '40f2592eb37ccd7ab79c448f725f36a8ea560f26a10cad11c778a776980e3e7d')


# Change to path for your own certificate
# The source package has a tool called "make-certs" that you can use
# to make your own certificate(s)
__certfile="/etc/efi/certs/pub.crt"

prepare() {
	cd "${srcdir}/${__pkgname}-${pkgver}/"

	patch -i ../${__pkgname}.patch
}

build() {

	cd "${srcdir}/${__pkgname}-${pkgver}/"

	unset CFLAGS
	unset CPPFLAGS
	unset CXXFLAGS
	unset LDFLAGS
	unset MAKEFLAGS

	local __vendorCertFile="${__certfile}"
	local __makeArgs
	if [ -f "${__vendorCertFile}" ]; then
		__makeArgs="VENDOR_CERT_FILE=${__certfile}"
	fi
	make ${__makeArgs}
}

package() {
	cd "${srcdir}/${__pkgname}-${pkgver}/"

	install -d "${pkgdir}/usr/lib/shim/"
	install -D -m0644 "${srcdir}/${__pkgname}-${pkgver}/shimx64.efi" "${pkgdir}/usr/lib/shim"
	install -D -m0644 "${srcdir}/${__pkgname}-${pkgver}/mmx64.efi.signed" "${pkgdir}/usr/lib/shim" || echo "No cert at: ${__certfile}"
	install -D -m0644 "${srcdir}/${__pkgname}-${pkgver}/fbx64.efi.signed" "${pkgdir}/usr/lib/shim" || echo "No cert at: ${__certfile}"
	if [ ! -f "${__certfile}" ]; then
		echo "Certificates required for \${FILE}.signed"
		echo "Current set location: ${__certfile}"
		echo "If you want to make your own certificates, use \"make-certs\" in the source directory"
	fi
}
