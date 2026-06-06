# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=oxyzenQ
_gitname=zelynic
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Easy userspace bandwidth manager for Linux"

pkgver=2.9.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('x86_64-linux')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('GPL-3.0-only')

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
sha256sums=('0d7b530ad317af15a5cc8eb0c91926d3c0f26ebfcfe5342e4c10c8bede3b5923'
            'df41f581b3bcec0f061c17d7e24b7d2f9d56d065fd12079f5c783239615e27d0'
            'fc6b0de69d88ccce9e0632562ab3214db2fffdb565e1d81489e67696c3c64497'
            'ca9afbfe436189bc5f49ae4109135223dd00fc7f4f61f052605225abc329a7b7')
sha256sums_x86_64=('ad6e8bdecdcf7adf115e138476ed30a3a6c71447dc3a0a8a5e7b690c1d1ed9f5')


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
