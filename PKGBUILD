# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
#Contributor: Mesut Oezdil <versusfinem@gmail.com>

_gitauthor=moezdil
_gitname=siltide
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Terminal monitor for GPUs, NPUs and other AI accelerators"

pkgver=0.1.5
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Apache-2.0')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('glibc' 'libgcc')

options=('!strip' '!debug')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[1]}")
sha256sums=('a7e4af3391c23be030b05bdf95c29a2495e5c3e1f1c8918eef02fe041fb98d6f'
            'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
sha256sums_x86_64=('9528ebbe30f370e878f5116ad4de63d37a2abefa6c88f02d96046f4e318c638f')
sha256sums_aarch64=('e3bfca6438157cddaf5e177374e98126bec6f434ba90e0483808677fa351367b')


package() {
	cd "${srcdir}/" || exit

	local bin="${_appname}-${CARCH}-${pkgver}"

	install -Dm755 "${bin}" "${pkgdir}/usr/bin/${_appname}"

	"./${bin}" --completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_siltide"
	"./${bin}" --completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/siltide"
	"./${bin}" --completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/siltide.fish"

	"./${bin}" --man |install -Dm644 /dev/stdin "${pkgdir}/usr/share/man/man1/siltide.1"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
