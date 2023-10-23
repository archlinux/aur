# Maintainer: Jan Vanmullem <jan@siteworld.be>

_pkgname=alpaca
pkgname="${_pkgname}-proxy"
pkgver=2.0.3
pkgrel=1
pkgdesc="A local HTTP proxy for command-line tools."
license=('apache')
arch=('x86_64')
makedepends=('go')
url="https://github.com/samuong/${_pkgname}"
source=("${_pkgname}-v${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
	"${_pkgname}.install"
	"${_pkgname}.service")
install="${_pkgname}.install"
sha512sums=('5fa0ff0b013726d1a2a8fbd76773d9580220f73a6d62d87816696be420685e3ab4a529b3c4ef5709f56b593cdec2d4bd7d8b5dc8469bfd0ee8f6f38e95b02f0f'
	'0fa82689d3722237be1d3b0ae22e7477834656b12b36a15ef2ac7839d04b524013d8e963e412b3be17590dcf2d878905bc9b17c2751c4ad84d57f86e5c76777b'
	'39ecc8b4627298ee515d9274ee1436a175a11d4c1450365de5770d6933ced9bc43d4f1acee7b0557ceee533729edf019732815b4599e26bafb1d2348bb6e0d75')

prepare() {
	cd "${_pkgname}-${pkgver}"
	mkdir -p build
}

build() {	
	cd "${_pkgname}-${pkgver}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o build .
}

package() {
	cd "${_pkgname}-${pkgver}"
	install -D -m 0755 "build/${_pkgname}" "${pkgdir}/usr/bin/$_pkgname"
	install -D -m 0644 "${srcdir}/${_pkgname}.service" "${pkgdir}/usr/lib/systemd/user/${_pkgname}.service"
}
