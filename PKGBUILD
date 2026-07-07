# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=BIRSAx2
_gitname=mdcat
_appname=mdcat
_appalias=mdless
pkgname=${_gitname}-bin
pkgdesc="Fancy 'cat' for Markdown"

pkgver=2.10.1
pkgrel=1
_gitversion=mdcat-${pkgver}

arch=('x86_64')
_barch=('x86_64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MPL-2.0')

depends=('glibc' 'libgcc' 'openssl' 'zlib')
provides=("${_appname}" "${_appalias}")
conflicts=("${_appname}")

options=(!strip)

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}-${_barch[0]}.tar.gz")
sha256sums_x86_64=('ae235dd90df6bc37db8094d667b4bbad8ee5c7de59b6a1f27295ee51430f958a')


case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;

  ${arch[1]})
    _CARCH=${_barch[1]}
    ;;
esac

prepare() {
	cd "${srcdir}/${_appname}-${pkgver}-${_CARCH}/" || exit

	ln -sf "./${_appname}" "./${_appalias}"

	ln -sf "./${_appname}.1" "./${_appname}.1/${_appalias}.1"
}

build() {
	cd "${srcdir}/${_appname}-${pkgver}-${_CARCH}/" || exit

	mkdir -p completions
	./"${_appname}" --completions zsh > "completions/${_appname}.zsh"
	./"${_appname}" --completions bash > "completions/${_appname}.bash"
	./"${_appname}" --completions fish > "completions/${_appname}.fish"

	./"${_appalias}" --completions zsh > "completions/${_appalias}.zsh"
	./"${_appalias}" --completions bash > "completions/${_appalias}.bash"
	./"${_appalias}" --completions fish > "completions/${_appalias}.fish"
}


package() {
	cd "${srcdir}/${_appname}-${pkgver}-${_CARCH}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"
	# install -Dm755 "${_appalias}" "${pkgdir}/usr/bin/${_appalias}"
	rsync -l "${_appalias}" "${pkgdir}/usr/bin/${_appalias}"

	install -Dm644 "completions/${_appname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_appname}"
	install -Dm644 "completions/${_appname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_appname}"
	install -Dm644 "completions/${_appname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_appname}.fish"

	install -Dm644 "completions/${_appalias}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_appalias}"
	install -Dm644 "completions/${_appalias}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_appalias}"
	install -Dm644 "completions/${_appalias}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_appalias}.fish"

	install -Dm644 "${_appname}.1/${_appname}.1" "${pkgdir}/usr/share/man/man1/${_appname}.1"
	# install -Dm644 "${_appname}.1/${_appalias}.1" "${pkgdir}/usr/share/man/man1/${_appalias}.1"
	rsync -l "${_appname}.1/${_appalias}.1" "${pkgdir}/usr/share/man/man1/${_appalias}.1"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
