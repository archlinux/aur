# Maintainer: Taylor Smock <vorpalblade77@gmail.com>
# contributor: Keshav Amburay <(the ddoott ridikulus ddoott rat) (aatt)
# (gemmaeiil) (ddoott) (ccoomm)>

__pkgname="shim"
pkgname="${__pkgname}-efi"

pkgver=15
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
source=("${url}/releases/download/${pkgver}/${__pkgname}-${pkgver}.tar.bz2")
sha256sums=('473720200e6dae7cfd3ce7fb27c66367a8d6b08233fe63f01aa1d6b3888deeb6')


# Change to path for your own certificate
# The source package has a tool called "make-certs" that you can use
# to make your own certificate(s)
__certfile="/etc/efi/certs/pub.crt"

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
	EFI_PATH="/usr/lib/" make ${__makeArgs}
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
