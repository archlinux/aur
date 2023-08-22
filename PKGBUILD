# Maintainer: VCalV
_pkgname=gourou
pkgname="${_pkgname}-bin"
__pkgname="lib${_pkgname}"
pkgver=0.8.2
pkgrel=1
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
        30d92d553d37c9929ec67bac86bf98377ddbfa09cb332f4e032ffd626250835ce670a4e36bffd1aca3999aa41f1d3dc3fa5782e597fcf812d9db9a560f712719
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
	cp -a --no-preserve=ownership lib* "$pkgdir"/usr/lib
}
