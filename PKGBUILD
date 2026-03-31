# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appname=jg
_pkgauthor=micahkepe
_pkgname=jsongrep
pkgname=${_pkgname}-bin
pkgdesc="A JSONPath-inspired query language over JSON documents"

pkgver=0.8.1
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')
_barch=('x86_64-unknown-linux-musl')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_appname}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${pkgver}-${_barch[0]}.tar.gz")
sha256sums_x86_64=('9123290534f33306df40aa07c7ea7720aa81f61a3fab5de7400f55e587668dfe')


case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;
esac

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}-${_CARCH}/" || exit

	mkdir -p ./completions
	./${_appname} generate shell bash > ./completions/${_appname}.bash
	./${_appname} generate shell zsh > ./completions/${_appname}.zsh
	./${_appname} generate shell fish > ./completions/${_appname}.fish

	mkdir -p man
	./${_appname} generate man -o ./man/ > /dev/null 2>&1
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}-${_CARCH}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -D -m644 "./completions/${_appname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_appname}"
	install -D -m644 "./completions/${_appname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_appname}"
	install -D -m644 "./completions/${_appname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_appname}.fish"

	install -d -m755 "${pkgdir}/usr/share/man/man1/"
	for man in man/*.1; do
		cp -P "${man}" "${pkgdir}/usr/share/man/man1/"
	done

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
