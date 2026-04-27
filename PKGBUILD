# shellcheck disable=all

# ======================================================================#
#
#
#     ██████╗ ██╗  ██╗ ██████╗ ██████╗ ██╗   ██╗██╗██╗     ██████╗
#     ██╔══██╗██║ ██╔╝██╔════╝ ██╔══██╗██║   ██║██║██║     ██╔══██╗
#     ██████╔╝█████╔╝ ██║  ███╗██████╔╝██║   ██║██║██║     ██║  ██║
#     ██╔═══╝ ██╔═██╗ ██║   ██║██╔══██╗██║   ██║██║██║     ██║  ██║
#     ██║     ██║  ██╗╚██████╔╝██████╔╝╚██████╔╝██║███████╗██████╔╝
#     ╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚═════╝  ╚═════╝ ╚═╝╚══════╝╚═════╝
#
#          Maintainer: Guillermo Galavis <druxorey@proton.me>
#
# ======================================================================#

_pkgname=nano-ffmpeg
pkgname=${_pkgname}
pkgver=0.5.0
pkgrel=3
pkgdesc="Simple TUI for FFmpeg written in Go"
arch=('x86_64' 'aarch64')
url="https://github.com/dgr8akki/nano-ffmpeg"
license=('MIT')
depends=('ffmpeg')
makedepends=('go')
provides=("${_pkgname}")
conflicts=("${_pkgname}-bin" "${_pkgname}-git")

source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('4dbb79b13055c4d12bfe537285be140e9c816648293ebfe8853a673f3f5e3493')
options=('!debug')

prepare() {
	cd "${_pkgname}-${pkgver}"
	mkdir -p build/
}

build() {
	cd "${_pkgname}-${pkgver}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o "build/${_pkgname}" .
}

check() {
	cd "${_pkgname}-${pkgver}"
	go test ./...
}

package() {
	cd "${_pkgname}-${pkgver}"
	install -Dm755 "build/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	[ -f LICENSE ]   && install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	[ -f README.md ] && install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
