# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=adibhanna
_pkgname=tsm
pkgname=${_pkgname}-bin
pkgdesc="Terminal Session Manager"

pkgver=0.5.1
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

makedepends=('patchelf')
depends=('glibc' 'ghostty')

options=(!strip)

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
		"CLI-${pkgver}.md::${_urlraw}/docs/CLI.md"
		"ARCHITECTURE-${pkgver}.md::${_urlraw}/docs/ARCHITECTURE.md"
		"COMPATIBILITY-${pkgver}.md::${_urlraw}/docs/COMPATIBILITY.md"
		"KNOWN_LIMITATIONS-${pkgver}.md::${_urlraw}/docs/KNOWN_LIMITATIONS.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${_pkgvername}_${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${_pkgvername}_${_barch[1]}.tar.gz")
sha256sums=('2b87bf7de1f8d01aa9b6d406e29cf45a5c326657faccff7eaacd7a04399e1a64'
            '0106ca5d76d2c99698fc0ebb3e5490f014d51a1486ae5dbe48a79c1f4e387b53'
            'e37a30c9f284582ed5ac1bab5e1e02f76bbc27c93bbd632d02322e569a4d2d25'
            '55410d1470810d3249e1f85a9a153ee83147f763f7d7e0328c050c043d53fb92'
            '4dd10c794ada37058cffdb44e0f38f07bd028eea5ab6d51042780941a5bb9875')
sha256sums_x86_64=('9d3abc7ddb06fb9f8c53ca840fe59e8fe4c9678b16c81b94345438fe1e19ff25')
sha256sums_aarch64=('d6abe8addb2a7289b75fe727a921cefbcb603dad88ed2a9d27d85cdc64171860')


case ${CARCH} in
	${arch[0]})
		_CARCH="${_barch[0]}"
		;;
	${arch[1]})
		_CARCH="${_barch[1]}"
		;;
esac

prepare() {
	cd "${srcdir}/${_pkgname}_${_pkgvername}_${_CARCH}/" || exit

	patchelf --set-rpath "/usr/lib/${_pkgname}" "./${_pkgname}"
}

package() {
	cd "${srcdir}/${_pkgname}_${_pkgvername}_${_CARCH}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm755 "libghostty-vt.so.0.1.0" "${pkgdir}/usr/lib/${_pkgname}/libghostty-vt.so.0.1.0"
	ln -sf "/usr/lib/${_pkgname}/libghostty-vt.so.0.1.0" "${pkgdir}/usr/lib/${_pkgname}/libghostty-vt.so"
	ln -sf "/usr/lib/${_pkgname}/libghostty-vt.so.0.1.0" "${pkgdir}/usr/lib/${_pkgname}/libghostty-vt.so.0"

	install -Dm644 "config/${_pkgname}/config.toml" "${pkgdir}/usr/share/doc/${pkgname}/config.example.toml"

	install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"

	install -Dm644 "../CLI-${pkgver}.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"
	install -Dm644 "../ARCHITECTURE-${pkgver}.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"
	install -Dm644 "../COMPATIBILITY-${pkgver}.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"
	install -Dm644 "../KNOWN_LIMITATIONS-${pkgver}.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"

	install -Dm644 "../LICENSE-${pkgver}" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
