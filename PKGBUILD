# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=goplus
pkgname=xgo
pkgver=1.7.5
pkgrel=1
pkgdesc="XGo is a programming language that reads like plain English and lets you leverage assets from C/C++, Go, Python, and JavaScript/TypeScript"
arch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${pkgname}"
license=('Apache-2.0')

provides=("${pkgname}")
conflicts=('goplus')
replaces=('goplus')

makedepends=('go')
depends=('bash')

source=("${pkgname}-${pkgver}.tgz::https://github.com/${_pkgauthor}/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('aceb20c547645016b4feb33b7e32de79267f4796a0f26832d5b89e7329724afb')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}/" || exit 1

	go mod tidy
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}/" || exit 1

	export GOPROOT_FINAL=${pkgdir}/usr/lib/xgo
	export CGO_ENABLED=0

	go build -trimpath -o "${pkgname}" ./cmd/${pkgname}

	mkdir -p "./completions"

	"./${pkgname}" completion zsh > "./completions/${pkgname}.zsh"
	"./${pkgname}" completion bash > "./completions/${pkgname}.bash"
	"./${pkgname}" completion fish > "./completions/${pkgname}.fish"
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/" || exit 1

	install -dm755 "${pkgdir}/usr/"{bin,lib/${pkgname}}

	cp -rfa * "${pkgdir}/usr/lib/${pkgname}"
	ln -s "/usr/lib/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/"

	install -dm755 "${pkgdir}/usr/share/"{zsh/site-functions,bash-completion/completions,fish/vendor_completions.d}

	ln -sf "/usr/lib/${pkgname}/completions/${pkgname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
	ln -sf "/usr/lib/${pkgname}/completions/${pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
	ln -sf "/usr/lib/${pkgname}/completions/${pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"

	install -dm755 "${pkgdir}/usr/share/"{licenses/${pkgname},doc/${pkgname}}

	ln -sf "/usr/lib/${pkgname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/"
	ln -sf "/usr/lib/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"
}
