# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=pythops
_pkgname=oryx
pkgname=${_pkgname}-bin
pkgver=0.5
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
            'a69085366f44ab6e4bae695f279962e565d5074a715ba1c0eba98239d21f4d5bfdca7d44f08d8b87a22d7a827026483cf936ea262676c42aee7d493d304afc26'
            'd90b0971037c1a64a85bf80a2f145932d8b37e462ae485bfea24043a4670fffb3cb4c7e5b6cce3f2fe528c399c7268b9d04baf948f88621876c84c3a274491ac')
sha512sums_x86_64=('89238bcde0479a9ac616cc9afea3e22253626e0afecdfe6b39cb89592238c748865546e2ed69d8e984f850086bbc05bc15e75c5acaae4ece2e86de0b21965578')
sha512sums_aarch64=('89238bcde0479a9ac616cc9afea3e22253626e0afecdfe6b39cb89592238c748865546e2ed69d8e984f850086bbc05bc15e75c5acaae4ece2e86de0b21965578')


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
