# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=heymaikol
_gitname=network-doctor
_appname=(netdoc{,-sim})
pkgname=${_gitname}-bin
pkgdesc="Terminal UI that diagnoses network connectivity and explains where the connection breaks"

pkgver=1.19.1
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
sha256sums=('65043ddb5167d85459c65b4819b7bba675c248ff89a70b72e968f0e1252e5af1'
            'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('462f207b7907cf5c325a7ba6669c32523e91aa8edede65076841eb1758e29292'
                   '72611cb8eaed9293e36f054e74f2b47569d6773077df31356ccf4121a4b32cf6')
sha256sums_aarch64=('31c8271aa1576d83f0623bcce7439615daf7079b87501b88c1a5063d16ec21b2'
                    'c99b9b41af865f1cbaf13359a65618c44b6ec36abeb83dd67975e455302a94d5')


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
