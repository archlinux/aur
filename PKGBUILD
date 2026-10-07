# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
#Contributor: Mesut Oezdil <versusfinem@gmail.com>

_gitauthor=moezdil
_gitname=siltide
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Terminal monitor for GPUs, NPUs and other AI accelerators"

pkgver=0.1.4
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
sha256sums=('d670cfcf3419c5f0b1840842d012d179b8d545268f2e247976ffc2f92baaa66e'
            'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')
sha256sums_x86_64=('7fe85b10953010234b48cbaa82ffde1ac18747679c405118cde150758e49b9ef')
sha256sums_aarch64=('29dbf7dd2bf0a854d05e2cd7482c2aaeae9325927904720cb3e3d12caafb7170')


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
