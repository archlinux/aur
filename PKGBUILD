# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=pythops
_pkgname=oryx
pkgname=${_pkgname}-bin
pkgver=0.2
pkgrel=2
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
            'f0aec270c7264824170fd114f68e97950fcdc1d511c4b24b8f4993c8f08348acbe91d2915134d8a3ab38e7b3d8b14339b0b631b7f6dedb8e0b63e4414c7dfedc'
            '9a9d07093e77a1cc19b2cbf3136982270d1d802ebcb1575b1affd206d43501dfafcc7eaa0da4fd950c66f6ef4eb70494314417122044d0c40e760ea8e26b3f75')
sha512sums_x86_64=('fe8b18122fec7fe2f155b7cbbc1920f6daa7a69936c8e978ad527aa10cca6960f01a685619c9744b2b36337905124c0e8840fd5e858b9ed5e79a6004a670fbfb')
sha512sums_aarch64=('8845d3413ccc74e7d38a513dea7054134dc3e040a02ef59169e522b303ff88202452f4370b41aaaea7975dfe3b06400b61d0018cf81935c164bd51a07b1eb71d')


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
