# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=heymaikol
_gitname=network-doctor
_appname=(netdoc{,-sim})
pkgname=${_gitname}-bin
pkgdesc="A network troubleshooting TUI that turns interface, DNS, TCP, TLS, HTTP, proxy, and path-MTU checks into one plain-English diagnosis"

pkgver=2.2.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Apache-2.0')

provides=("${_appname[@]}")
conflicts=("${pkgname%-bin}")

makedepends=('git')

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname[0]}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname[0]}_${pkgver}_${_barch[0]}"
			   "${_appname[1]}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname[1]}_${pkgver}_${_barch[0]}")
source_aarch64=("${_appname[0]}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname[0]}_${pkgver}_${_barch[1]}"
				"${_appname[1]}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname[1]}_${pkgver}_${_barch[1]}")
sha256sums=('bad7a635351aeb0c9197ce1267db6a41b6beeac63dcbfb354d0b50ede9e6f64f'
            'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('84c598bccec48e9318c028a616156266c467e706b44e70382392c286dafe6d26'
                   'bec4d8a84e6ec35d8815e7e153b3776bf1ef23fef693054499f1cd98f8ef79d3')
sha256sums_aarch64=('ac339ce622fefc00a30a51e36332b1c58d015bba003bb31ae2c13b39dc58a059'
                    'eac9d30db5fcf7482a292ea4acb5d118848a46471787d05ade19c18b0e3880e6')


prepare() {
	cd "${srcdir}/" || exit

	rm -rf git && git clone -n --depth=1 --filter=tree:0 "${_ghurl}" git

	cd git && git sparse-checkout set --no-cone /packaging && git checkout

	cp -rfa packaging "${srcdir}/" && cd .. && rm -rf git
}

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname[0]}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname[0]}"
	install -Dm755 "${_appname[1]}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_appname[1]}"

	install -Dm644 "./packaging/${_appname[0]}.1" "${pkgdir}/usr/share/man/man1/${_appname[0]}.1"
	install -Dm644 "./packaging/${_appname[1]}.1" "${pkgdir}/usr/share/man/man1/${_appname[1]}.1"

	install -Dm644 "./packaging/completions/${_appname[0]}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_appname[0]}"
	install -Dm644 "./packaging/completions/${_appname[1]}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_appname[1]}"
	install -Dm644 "./packaging/completions/${_appname[0]}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_appname[0]}"
	install -Dm644 "./packaging/completions/${_appname[1]}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_appname[1]}"
	install -Dm644 "./packaging/completions/${_appname[0]}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_appname[0]}.fish"
	install -Dm644 "./packaging/completions/${_appname[1]}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_appname[1]}.fish"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
