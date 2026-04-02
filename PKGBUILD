# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=mikecsmith
_pkgname=ihj
pkgname=${_pkgname}
pkgdesc="Instant High-Speed Jira"

pkgver=1.2.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${pkgname}")
makedepends=('go')
depends=('glibc')

source=("${pkgname}-${pkgver}.tgz::https://github.com/${_pkgauthor}/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('87b70bb44d9ea6f1f291ae66f782963e9e02bc603530ac6999d34263713e24ab')


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
