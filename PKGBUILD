# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=pythops
_pkgname=oryx
pkgname=${_pkgname}-bin
pkgver=0.3
pkgrel=1
pkgdesc="A TUI for sniffing network traffic using eBPF"
arch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('GPL-3.0-only')

depends=('gcc-libs')
makedepends=('help2man')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}::${_urlraw}/Readme.md"
        "RELEASE-${pkgver}::${_urlraw}/Release.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-${arch[0]}-unknown-linux-musl")
source_aarch64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-${arch[1]}-unknown-linux-musl")
sha512sums=('d361e5e8201481c6346ee6a886592c51265112be550d5224f1a7a6e116255c2f1ab8788df579d9b8372ed7bfd19bac4b6e70e00b472642966ab5b319b99a2686'
            '60f3720bba49e2e09a319ebdbfe72738b7f620b581d6f07597a7043378b28bb69dfbb85d433c50082371b627ce99a8dab57f63018f3558c9bbb644fb4b326bac'
            'ce8a4278a38cd89b8e8339312624f18a276864783dbaa05d9f1421402a69670a4090a64e3094088541523bc671aef07136077b28a886a6dc1a55cff2a4577306')
sha512sums_x86_64=('6c57207ebfb95130203b5474030508ea99f96d65a9a527d8334935a189f8f62aba834766d74bed1621bbc5591fdfb019a439d4065a68ed86c2fdac4eb5c137f3')
sha512sums_aarch64=('6c57207ebfb95130203b5474030508ea99f96d65a9a527d8334935a189f8f62aba834766d74bed1621bbc5591fdfb019a439d4065a68ed86c2fdac4eb5c137f3')


prepare() {
  chmod +x ${_pkgname}-${CARCH}-${pkgver}
}

build() {
	help2man ./${_pkgname}-${CARCH}-${pkgver} --no-info --section 8 --output "MAN-${pkgver}.8"
}

package() {
	cd "${srcdir}"

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

	install -Dm644 "README-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 "RELEASE-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/RELEASE.md"

	install -Dm644 "MAN-${pkgver}.8" "${pkgdir}/usr/share/man/man8/${_pkgname}.8"
	gzip "${pkgdir}/usr/share/man/man8/${_pkgname}.8"
}
