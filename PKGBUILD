# Maintainer: Taylor Smock <vorpalblade77@gmail.com>
# contributor: Keshav Amburay <(the ddoott ridikulus ddoott rat) (aatt)
# (gemmaeiil) (ddoott) (ccoomm)>

__pkgname="shim"
pkgname="${__pkgname}-efi"

pkgver=11
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
md5sums=('fc1163431582f1fd82215cd144236dec'
         '90dc7ecd36b974440e1abb108d664ac2')

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

	# Change /etc/efi/certs/pub.cer to whatever certificate you have
	# installed on your machine. This is just an example.
	make VENDOR_CERT_FILE=/etc/efi/certs/pub.cer
}

package() {

	cd "${srcdir}/${__pkgname}-${pkgver}/"

	install -d "${pkgdir}/usr/lib/shim/"
	install -D -m0644 "${srcdir}/${__pkgname}-${pkgver}/shimx64.efi" "${pkgdir}/usr/lib/shim"
	install -D -m0644 "${srcdir}/${__pkgname}-${pkgver}/mmx64.efi.signed" "${pkgdir}/usr/lib/shim"
	install -D -m0644 "${srcdir}/${__pkgname}-${pkgver}/fbx64.efi.signed" "${pkgdir}/usr/lib/shim"

}

