# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=goplus
pkgname=ixgo
pkgver=1.1.0
pkgrel=1
pkgdesc="The Go/XGo Interpreter"
arch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${pkgname}"
license=('Apache-2.0')

provides=("${pkgname}")
conflicts=('igop')
replaces=('igop')
makedepends=('go')

source=("${pkgname}-${pkgver}.tgz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a16f0b81b4a876eac25fb90c4ee7cd07ebfc6ee6239c2785a29e37c90b5e056d')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	go mod tidy
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	export CGO_ENABLED=0

	if [[ -f .ldflags ]]; then
		ldflags=$(<.ldflags)
	else
		# interim until commit fix is released
		ldflags="-checklinkname=0"
	fi

	go build -trimpath -ldflags "${ldflags}" -o "${pkgname}" ./cmd/${pkgname}
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver} || exit 1

	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
