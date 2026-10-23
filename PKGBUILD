# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=goplus
pkgname=ixgo
pkgver=1.2.5
pkgrel=1
pkgdesc="The Go/XGo Interpreter"
arch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${pkgname}"
license=('Apache-2.0')

provides=("${pkgname}")
conflicts=('igop')
replaces=('igop')
makedepends=('go')

source=("${pkgname}-${pkgver}.tgz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('df12ec8640abacfd1276ae2f0af7fa29b6212f5692b0b0ab33fac5193498e826')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}/" || exit 1

	go mod tidy
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}/" || exit 1

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
	cd "${srcdir}/${pkgname}-${pkgver}/" || exit 1

	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
