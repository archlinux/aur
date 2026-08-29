# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=spoo-me
_gitname=spoo-cli
_appname=${_gitname%-cli}
pkgname=${_gitname}
pkgdesc="Official spoo.me CLI to shorten links and view analytics from your terminal"

pkgver=0.4.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Apache-2.0')

provides=("${_appname}")

makedepends=('go')

options=('!strip')

source=("${pkgname}-${pkgver}.tgz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('3b44676ce918392cb89ded088e75f1c6c819657b62d345555508207e4c055356')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}/" || exit

	go mod tidy
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}/" || exit

	export CGO_ENABLED=0

	if [[ -f .ldflags ]]; then
		ldflags=$(<.ldflags)
	else
		# interim until commit fix is released
		ldflags="-checklinkname=0"
	fi

	go build -trimpath -ldflags "${ldflags}" -o "${pkgname}" ./cmd/${_appname}

	mkdir -p "./completions"

	"./${pkgname}" completion zsh > "./completions/${_appname}.zsh"
	"./${pkgname}" completion bash > "./completions/${_appname}.bash"
	"./${pkgname}" completion fish > "./completions/${_appname}.fish"
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/" || exit

	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${_appname}"

	install -D -m644 "completions/${_appname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_appname}"
	install -D -m644 "completions/${_appname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_appname}"
	install -D -m644 "completions/${_appname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_appname}.fish"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
