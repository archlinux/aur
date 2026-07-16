# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=permadart
_gitname=chicle
_appname=${_gitname}
pkgname=${_gitname}
pkgdesc="A platform-agnostic command-line tool for managing multiple Git identities"

pkgver=0.0.5
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')

url="https://github.com/${_gitauthor}/${_gitname}"
_urlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"

license=('MIT')

provides=("${_appname}")

makedepends=('go')
depends=('git')

source=("${pkgname}-${pkgver}.tgz::https://github.com/${_gitauthor}/${pkgname}/archive/${_gitversion}.tar.gz")
sha256sums=('062c34f897539edd47069fbd09165fd670f0da4868db141f4ac122ad16216edc')


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

	go build -o ${_appname} ./
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver} || exit 1

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
