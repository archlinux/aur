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
pkgver=0.3.0
pkgrel=1
pkgdesc="Simple TUI for FFmpeg written in Go"
arch=('x86_64' 'aarch64')
url="https://github.com/dgr8akki/nano-ffmpeg"
license=('MIT')
depends=('ffmpeg')
makedepends=('go')
provides=("${_pkgname}")
conflicts=("${_pkgname}-bin" "${_pkgname}-git")

source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('770c9cb4f0771fd3d4271ee70a7d4c75a1a3bb53c7c3e065fad3911f4a492464')
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
