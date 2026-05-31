# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=oxyzenQ
_gitname=zelynic
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Easy userspace bandwidth manager for Linux"

pkgver=2.0.0
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
sha256sums=('ffa9d7961c736ae9f082c14c267ba34a5ee4a29237ccef32f95661be77adcd82'
            'df1c2d01d2240633c44d59b4ed4423854a13487e27b65304960490371db43073'
            'aa5819c60d23cf202e683288a3a9f645a33e72049c77cf0850855b486e56d5d7'
            'd29c49be72c1ce61d1cd89f042bc9ab044d0b564b19c53793fbaa4a3e18e7522')
sha256sums_x86_64=('a6c7898d3b6e3227103566fa9642a74a528ffa84832b7335dd7d5b5f86e9b765')


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
