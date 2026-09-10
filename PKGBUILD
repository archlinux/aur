# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=BIRSAx2
_gitname=mdcat
_appname=mdcat
_appalias=(mdless mdpick)
pkgname=${_gitname}-bin
pkgdesc="Fancy 'cat' for Markdown"

pkgver=2.16.1
pkgrel=1
_gitversion=mdcat-${pkgver}

arch=('x86_64')
_barch=('x86_64-unknown-linux-gnu')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url="${_ghurl}"

license=('MPL-2.0')

depends=('glibc' 'libgcc' 'openssl' 'zlib' 'fzf')
provides=("${_appname}" "${_appalias[@]}")
conflicts=("${pkgname%-bin}")

options=('!strip')

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}-${_barch[0]}.tar.gz")
sha256sums_x86_64=('67129dd91361ea895982ee7331359f8d794ecc1eb0c8974e564d32ba28df26fd')


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

	for alias in "${_appalias[@]}"; do
		ln -sf "./${_appname}" "./${alias}"

		ln -sf "./${_appname}.1" "./${_appname}.1/${alias}.1"
	done
}

build() {
	cd "${srcdir}/${_appname}-${pkgver}-${_CARCH}/" || exit

	mkdir -p completions

	./"${_appname}" --completions zsh > "completions/${_appname}.zsh"
	./"${_appname}" --completions bash > "completions/${_appname}.bash"
	./"${_appname}" --completions fish > "completions/${_appname}.fish"

	for alias in "${_appalias[@]}"; do
		./"${alias}" --completions zsh > "completions/${alias}.zsh"
		./"${alias}" --completions bash > "completions/${alias}.bash"
		./"${alias}" --completions fish > "completions/${alias}.fish"
	done
}

package() {
	cd "${srcdir}/${_appname}-${pkgver}-${_CARCH}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	for alias in "${_appalias[@]}"; do
		rsync -l "${alias}" "${pkgdir}/usr/bin/${alias}"
	done

	install -Dm644 "completions/${_appname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_appname}"
	install -Dm644 "completions/${_appname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_appname}"
	install -Dm644 "completions/${_appname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_appname}.fish"

	for alias in "${_appalias[@]}"; do
		install -Dm644 "completions/${alias}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${alias}"
		install -Dm644 "completions/${alias}.bash" "${pkgdir}/usr/share/bash-completion/completions/${alias}"
		install -Dm644 "completions/${alias}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${alias}.fish"
	done

	install -Dm644 "${_appname}.1/${_appname}.1" "${pkgdir}/usr/share/man/man1/${_appname}.1"

	for alias in "${_appalias[@]}"; do
		rsync -l "${_appname}.1/${alias}.1" "${pkgdir}/usr/share/man/man1/${alias}.1"
	done

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
