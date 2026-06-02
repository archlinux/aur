# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=oxyzenQ
_gitname=zelynic
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Easy userspace bandwidth manager for Linux"

pkgver=2.1.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('x86_64-linux')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('GPL-3.0-or-later')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc' 'iproute2' 'nftables')

options=(!strip)

source=("USAGE-${pkgver}.md::${_ghurlraw}/docs/usage.md"
		"VALIDATION-${pkgver}.md::${_ghurlraw}/docs/validation.md"
		"GETTING-STARTED-${pkgver}.md::${_ghurlraw}/docs/getting-started.md"
		"STRICT-BACKEND_DESIGN-${pkgver}.md::${_ghurlraw}/docs/strict-backend-design.md")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}-${_barch[1]}.tar.gz")
sha256sums=('3362e83917159592b0d31dfc83b2aec0fe4c5963d64ef02b85d687e2107a1741'
            '6c2548fc92d37270af86e4f5aeabc7154ec4b02c9625f14bdefb1e43bf3222a7'
            '07e9f7960c49519c3fb76931ac0f4d187239986ff75bc9525e0f067f26006199'
            '56be18876a1dfd2d4b81fd900443d555a869beb7ccb3308b00b68b1d01e0fc5b')
sha256sums_x86_64=('0d82344d2de72df6c88a56bcfdd38e65f1a79fdbfa96be2539dabe390251b30e')


case ${CARCH} in
  ${arch[0]})
    _CARCH=${_barch[0]}
    ;;

  ${arch[1]})
    _CARCH=${_barch[1]}
    ;;
esac


prepare() {
    cd "${srcdir}/${_gitname}-${_gitversion}-${_CARCH}/" || exit

    mkdir -p docs
    mv ../*.md ./docs
}

build() {
    cd "${srcdir}/${_gitname}-${_gitversion}-${_CARCH}/" || exit

    mkdir -p completions
    ./${_appname} completions zsh > "./completions/${_appname}.zsh"
    ./${_appname} completions bash > "./completions/${_appname}.bash"
    ./${_appname} completions fish > "./completions/${_appname}.fish"
}

package() {
	cd "${srcdir}/${_gitname}-${_gitversion}-${_CARCH}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "man/${_appname}.1.gz" "${pkgdir}/usr/share/man/man1/${_appname}.1.gz"

	install -Dm644 "completions/${_appname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_appname}"
	install -Dm644 "completions/${_appname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_appname}"
	install -Dm644 "completions/${_appname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_appname}.fish"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "docs/USAGE-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/USAGE.md"
	install -Dm644 "docs/VALIDATION-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/VALIDATION.md"
	install -Dm644 "docs/GETTING-STARTED-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/GETTING-STARTED.md"
	install -Dm644 "docs/STRICT-BACKEND_DESIGN-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/STRICT-BACKEND-DESIGN.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
