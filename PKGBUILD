# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=arc53
_gitname=pastevault
_appname=${_gitname}
pkgname=${_appname}-cli
pkgdesc="Modern secure pastebin with a VS Code-like editor. Share code, text, and markdown securely with automatic expiry and burn-after-read options. (CLI)"

pkgver=1.2.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('GPL-3.0')

makedepends=('go')
depends=('glibc')

provides=("${_appname}")
conflicts=("${pkgname}-bin")

options=(!strip)

source=("${_appname}-${pkgver}.tgz::https://github.com/${_gitauthor}/${_gitname}/archive/${_gitversion}.tar.gz")
sha256sums=('0c7431e286ef6b46420f11d7a042498ba91850d34fb06b5832a7429d3ecea9ee')


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

	go build -o ${_appname} ./cmd/${_appname}/
}

package() {
	cd ${srcdir}/${_appname}-${pkgver} || exit 1

	install -Dm755 "${_appname}" -t "${pkgdir}/usr/bin/"

	install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"

	install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
