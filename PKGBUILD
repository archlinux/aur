# Maintainer:
# Contrigutor: Keshav Amburay <(the ddoott ridikulus ddoott rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>
# Contributor: Pablo Lezaeta <(prflr 88) (arro'a) (gmail) (puntocom)>

__pkgname="shim"
_pkgname="${__pkgname}-efi"
pkgname="${_pkgname}-git"

pkgver=0.9.r51.rgd3884fe
pkgrel=1
pkgdesc="Simple bootloader for x86_64 UEFI Secure Boot - GIT Version"
url="https://github.com/rhinstaller/shim"
arch=('x86_64')
license=('GPL')
options=('!strip')

makedepends=('git' 'gnu-efi-libs')
depends=('pesign' 'dosfstools' 'efivar' 'efibootmgr')
optdepends=('mactel-boot: For bless command in Apple Mac systems')

conflicts=("${_pkgname}" 'shim-efi-x86_64' 'shim-efi-x86_64-git')
provides=("${_pkgname}=${pkgver}" "shim-efi-x86_64=${pkgver}" "shim-efi-x86_64-git=${pkgver}")

source=("shim::git+https://github.com/rhinstaller/shim.git#branch=master")
sha1sums=('SKIP')

pkgver() {
	cd "${srcdir}/${__pkgname}/"
	echo "$(git describe --tags)" | sed -e 's|-|.r|g'
}

prepare() {
	
	cd "${srcdir}/${__pkgname}/"
	
	git clean -x -d -f
	echo
	
	sed 's|/usr/lib64/gnuefi|/usr/lib|g' -i "${srcdir}/${__pkgname}/Makefile"
	sed 's|/usr/lib64|/usr/lib|g' -i "${srcdir}/${__pkgname}/Makefile"
	
}

build() {
	
	cd "${srcdir}/${__pkgname}/"
	
	unset CFLAGS
	unset CPPFLAGS
	unset CXXFLAGS
	unset LDFLAGS
	unset MAKEFLAGS
	
	make
	echo
	
}

package() {
	
	cd "${srcdir}/${__pkgname}/"
	
	install -d "${pkgdir}/usr/lib/shim/"
	install -D -m0644 "${srcdir}/${__pkgname}/shim"*.efi "${pkgdir}/usr/lib/shim/shimx64.efi"
	install -D -m0644 "${srcdir}/${__pkgname}/MokManager.efi.signed" "${pkgdir}/usr/lib/shim/MokManager.efi.signed"
	install -D -m0644 "${srcdir}/${__pkgname}/fallback.efi.signed" "${pkgdir}/usr/lib/shim/fallback.efi.signed"
	
}
