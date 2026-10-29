# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=heymaikol
_gitname=network-doctor
_appname=(netdoc{,-sim})
pkgname=${_gitname}-bin
pkgdesc="A network troubleshooting TUI that turns interface, DNS, TCP, TLS, HTTP, proxy, and path-MTU checks into one plain-English diagnosis"

pkgver=2.1.1
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
sha256sums=('388d929f58559801dce2e727d1f4bbc9cca72fc8b59db0a0528f4c752456585d'
            'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('18d51562763957035a3a75b1684136fc5a0556531a0a2e6dab6eb09e8d83957a'
                   '808ecfdae1f8d6c3abc003583119e06b0173add7a3d6c7670bf21e95c2de820b')
sha256sums_aarch64=('77e50f29f8e534b63a9194335c1adb12ae56f505473f469d42a075d025459d6a'
                    'bf0b8d6ab822c307eb1434ab0b9e2bc6dbfb090b5e87c6987ee468af513f1c58')


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
