# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=jdefrancesco
_gitname=dskDitto
_appname=dskDitto
pkgname=dsk-ditto
pkgdesc="Ultra fast and easy duplicate file finder. Awesome TUI/GUI to manage results."

pkgver=0.5.6
pkgrel=1
epoch=1
_gitversion=v${pkgver}

arch=('x86_64')

url="https://github.com/${_gitauthor}/${_gitname}"
_urlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"

license=('Apache-2.0')

provides=("${_appname}")
makedepends=('go')
depends=('glibc')

source=("${pkgname}-${pkgver}.tgz::https://github.com/${_gitauthor}/${_gitname}/archive/${_gitversion}.tar.gz")
sha256sums=('32df44adf16990f7773a9f498e4bdfae16e414e8a8a6189c10d508dfa0f00026')


prepare() {
	cd ${srcdir}/${_appname}-${pkgver} || exit 1

	go mod tidy
}

build() {
	cd ${srcdir}/${_appname}-${pkgver} || exit 1

	export CGO_LDFLAGS="${LDFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

	go build -o ${_appname} "./cmd/${_appname}"
}

package() {
	cd ${srcdir}/${_appname}-${pkgver} || exit 1

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
