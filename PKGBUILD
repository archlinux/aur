# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgauthor="Hossiy21"
pkgname="razify"
pkgdesc="A developer CLI tool that manages .env files, detects secret leaks, syncs env drift across teammates, and validates environment parity between local/staging/prod all from your terminal"
pkgver=1.0.0
pkgrel=1

url="https://github.com/${pkgauthor}/${pkgname}"
_urlraw="https://raw.githubusercontent.com/${pkgauthor}/${pkgname}"

arch=("x86_64")
license=("MIT")

provides=("${pkgname}")

makedepends=('go')
depends=('glibc')

source=("${pkgname}-${pkgver}.tgz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('e5f39dda52c0c2dcd7cccea0fbd5a913372f8d7bd7d9e7b1f793e51367412e50')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"

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
	cd "${srcdir}/${pkgname}-${pkgver}"

	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

