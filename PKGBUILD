# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=mikecsmith
_gitname=ihj
_appname=ihj
pkgname=${_gitname}
pkgdesc="An fzf-inspired issue tracker with pluggable providers, vim mode, and LLM-assisted backlog refinement"

pkgver=0.5.9
pkgrel=1
epoch=1
_gitversion=v${pkgver}

arch=('x86_64')

url="https://github.com/${_gitauthor}/${_gitname}"
_urlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"

license=('MIT')

provides=("${_appname}")
makedepends=('go')
depends=('glibc')

source=("${pkgname}-${pkgver}.tgz::https://github.com/${_gitauthor}/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9d26e848fe2eb15f438feb22a772dee9c7343363bafe1cdafafc586b57de14dd')


prepare() {
	cd ${srcdir}/${pkgname}-${pkgver} || exit 1

	go mod tidy
}

build() {
	cd ${srcdir}/${pkgname}-${pkgver} || exit 1

	export CGO_LDFLAGS="${LDFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

	go build -o ${pkgname} "./cmd/${pkgname}"
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver} || exit 1

	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
