# Maintainer: VCalV
_pkgname=gourou
pkgname="${_pkgname}-bin"
__pkgname="lib${_pkgname}"
__commit="0d77cf55e1b0de1e8238d12c1e4015863135485d"
pkgver=0.8.6
pkgrel=2
pkgdesc="Download and decrypt adobe encrypted (acsm) pdf and epub files"
arch=('x86_64')
license=('LGPL3')
url="https://forge.soutade.fr/soutade/libgourou"
depends=(glibc gcc-libs zlib libzip openssl)
makedepends=(patchelf)
conflicts=(gourou-git gourou)
provides=("gourou=${pkgver}")
options=(!strip)
__commit_link="https://forge.soutade.fr/soutade/${__pkgname}/raw/commit/${__commit}/"
__man_link="${__commit_link}/utils/man/"
source=(
	"https://forge.soutade.fr/api/packages/soutade/generic/${__pkgname}/${pkgver}/libgourou_utils_${pkgver}.tgz"
	"$__man_link/acsmdownloader.1"
	"$__man_link/adept_activate.1"
	"$__man_link/adept_loan_mgt.1"
	"$__man_link/adept_remove.1"
    "$__commit_link/utils/LICENSE"
)
sha512sums=(
        a74df6a5a18ef6a49324e8874d1130320730ceba9f0a331f477d34647717ea586249d644b644c4b1436f409217bb9f638f64d6190aea8f87317e6a00919891da
        9cfaafb8ba99bf42713c9a99fd26d5a5b5f027e2fee1eba4e86f5161e1a8256ef691fbb135bd19b7ff9118eab89fc1a365e5ffc8fe9ef6cf080eec757ddd32b9
        b3cceb1ac60bedf75628c9cac56e2d246abe9378e58f959352b7ce133fabead3900f6ac3ccfa78f1163a923334ab6f724f77a2007144cd775aa45816a3398a51
        724e4c11491ca428995e3dfebf439a2a941b28b8cf08f5fa4fad93e3860196c21fe26962201bcc00d8875a970e3d7e321ebdf1b332157bb0fc920124dd12b42c
        cc99595cffc1f6882bd52525086947aa9356175cf00329b0c98cd9fd102a75595119dde8d2179b9478ce7777a42255f52998c00ad29d8556e3a130b618aa5e9a
        dd35b1dfd86efd7ea783b0d0c84e457991416ea986610494b32301188f4fd857df6610ae7d94759a1328536f75ff8764a5eb6a08f4965699ff3a8fd166dda725
)

package() {
	install -d "$pkgdir"/{usr/bin/,usr/lib/,/usr/share/man/man1/}

	cd "$srcdir"

	install -Dm444 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

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
