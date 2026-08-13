# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=mustachius
_gitname=taskframe
_appname=${_gitname}
pkgname=${_gitname}
pkgdesc="A fast, keyboard-driven task manager for the terminal, inspired by Taskwarrior but simpler."

pkgver=0.3.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')

url="https://github.com/${_gitauthor}/${_gitname}"
_urlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"

license=('MIT')

provides=("${_appname}")

makedepends=('go')
depends=('glibc')

source=("${pkgname}-${pkgver}.tgz::https://github.com/${_gitauthor}/${pkgname}/archive/${_gitversion}.tar.gz")
sha256sums=('7445b7cabd9a1c152c741d780f1244a1e85e17ad13d808bc0435d8b1a4f40c4d')


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

	go build -o ${_appname} ./cmd/${_appname}
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver} || exit 1

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
