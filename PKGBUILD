# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=bmarse
_pkgname=tododo
pkgname=${_pkgname}
pkgdesc="The todo manager that should be extinct"

pkgver=0.7.0
pkgrel=1
_pkgvername=v${pkgver}-stable

arch=('x86_64' 'i686' 'aarch64')
_barch=('amd64' '386' 'arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")


source=("${_pkgname}-${_pkgvername}.tgz::https://github.com/${_pkgauthor}/${pkgname}/archive/${_pkgvername}.tar.gz")
sha256sums=('d57c5d28efabc8f63e6ee21b5283449545ff7db6b299ed80649022c75dcfb215')


build() {
	cd "${_pkgname}-${_pkgvername##v}/" || exit

	export CGO_LDFLAGS="${LDFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

	go build -o ${_pkgname} ${_pkgname}.go
}

package() {
	cd "${_pkgname}-${_pkgvername##v}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
