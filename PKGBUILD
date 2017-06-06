# Maintainer: Taylor Smock <vorpalblade77@gmail.com>
# contributor: Keshav Amburay <(the ddoott ridikulus ddoott rat) (aatt)
# (gemmaeiil) (ddoott) (ccoomm)>

__pkgname="shim"
pkgname="${__pkgname}-efi"

pkgver=12
pkgrel=4
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
sha256sums=('d9364983ef91ab09dc231c8d979b413cfa36d4744830ba59f5d3e52b616048b0'
            'e2715a7aef5ee4d7c6f428d09ab387ce86bdf83969921e2b36eb92696752ebc0')


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
	if [ -f ${__vendorCertFile} ]; then
		__makeArgs="VENDOR_CERT_FILE=${__certfile}"
	fi
	make ${__makeArgs}
}

package() {

	cd "${srcdir}/${__pkgname}-${pkgver}/"

	install -d "${pkgdir}/usr/lib/shim/"
	install -D -m0644 "${srcdir}/${__pkgname}-${pkgver}/shimx64.efi" "${pkgdir}/usr/lib/shim"
	install -D -m0644 "${srcdir}/${__pkgname}-${pkgver}/mmx64.efi.signed" "${pkgdir}/usr/lib/shim"
	install -D -m0644 "${srcdir}/${__pkgname}-${pkgver}/fbx64.efi.signed" "${pkgdir}/usr/lib/shim"

}

