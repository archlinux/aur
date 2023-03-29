# Maintainer: VCalV
_pkgname=gourou
pkgname="${_pkgname}-bin"
__pkgname="lib${_pkgname}"
pkgver=0.8.1
pkgrel=8
pkgdesc="Download and decrypt adobe encrypted (acsm) pdf and epub files"
arch=('x86_64')
license=('LGPL3')
url="https://indefero.soutade.fr/p/libgourou"
depends=(glibc gcc-libs zlib libzip openssl)
makedepends=(patchelf)
conflicts=(gourou-git gourou)
provides=("gourou=${pkgver}")
options=(!strip)
__man_link="https://indefero.soutade.fr/p/${__pkgname}/source/file/v${pkgver}/utils/man/"
source=(
	"https://indefero.soutade.fr/p/${__pkgname}/downloads/get/${__pkgname}_utils_${pkgver}.tgz"
	"$__man_link/acsmdownloader.1"
	"$__man_link/adept_activate.1"
	"$__man_link/adept_loan_mgt.1"
	"$__man_link/adept_remove.1"
)
sha512sums=(
        ee5e2ffd298fd38757f6a060fc2d697222d50834cdb0e19837fd036ce08eb5a1fa57cc201e11237e18b0b8f2714f7afb0e5d21ca97497aa48e6e90e551ffe4b3
        9cfaafb8ba99bf42713c9a99fd26d5a5b5f027e2fee1eba4e86f5161e1a8256ef691fbb135bd19b7ff9118eab89fc1a365e5ffc8fe9ef6cf080eec757ddd32b9
        b3cceb1ac60bedf75628c9cac56e2d246abe9378e58f959352b7ce133fabead3900f6ac3ccfa78f1163a923334ab6f724f77a2007144cd775aa45816a3398a51
        724e4c11491ca428995e3dfebf439a2a941b28b8cf08f5fa4fad93e3860196c21fe26962201bcc00d8875a970e3d7e321ebdf1b332157bb0fc920124dd12b42c
        cc99595cffc1f6882bd52525086947aa9356175cf00329b0c98cd9fd102a75595119dde8d2179b9478ce7777a42255f52998c00ad29d8556e3a130b618aa5e9a
)

package() {
	install -d "$pkgdir"/{usr/bin/,usr/lib/,/usr/share/man/man1/}

	cd "$srcdir"

	cp --no-preserve=ownership acsm*.1 adept*.1 "$pkgdir"/usr/share/man/man1/
	gzip -9 "$pkgdir"/usr/share/man/man1/*

	cd "${__pkgname}_utils_${pkgver}"

	cp -a --no-preserve=ownership {acsmdownloader,adept_activate,adept_remove,adept_loan_mgt} "$pkgdir"/usr/bin
	# somewhat cleaner
	for _exec in "$pkgdir"/usr/bin/*; do
		patchelf --replace-needed libzip.so.4 libzip.so "$_exec"
	done
	__so="${pkgdir}/usr/lib/${__pkgname}.so"
	__sov="$__so"."$pkgver"
	cp -a --no-preserve=ownership *.so "$__sov"
	ln -s $(basename "$__sov") "$__so"
}
