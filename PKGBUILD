# Maintainer: VCalV
_pkgname=gourou
pkgname="${_pkgname}-bin"
__pkgname="lib${_pkgname}"
pkgver=0.8.1
pkgrel=6
pkgdesc="Download and decrypt adobe encrypted (acsm) pdf and epub files"
arch=('x86_64')
license=('LGPL3')
url="https://indefero.soutade.fr/p/libgourou"
depends=(glibc gcc-libs zlib libzip openssl)
makedepends=(patchelf)
conflicts=(gourou-git gourou)
provides=("gourou=${pkgver}")
options=(!strip)
source=("https://indefero.soutade.fr/p/${__pkgname}/downloads/get/${__pkgname}_utils_${pkgver}.tgz")
sha512sums=(ee5e2ffd298fd38757f6a060fc2d697222d50834cdb0e19837fd036ce08eb5a1fa57cc201e11237e18b0b8f2714f7afb0e5d21ca97497aa48e6e90e551ffe4b3)

package() {
	cd "${srcdir}/${__pkgname}_utils_${pkgver}"

	install -d $pkgdir/{usr/bin/,usr/lib/}
	cp -a --no-preserve=ownership {acsmdownloader,adept_activate,adept_remove,adept_loan_mgt} "$pkgdir"/usr/bin
	# somewhat cleaner
	for _exec in "$pkgdir"/usr/bin/*; do
		patchelf --replace-needed libzip.so.4 libzip.so.5 "$_exec"
	done
	cp -a --no-preserve=ownership *.so $pkgdir/usr/lib
}
