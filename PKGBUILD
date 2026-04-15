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

_pkgname=sheets
pkgname=${_pkgname}-git
pkgver=r38.7beaf1a
pkgrel=2
pkgdesc="Terminal based spreadsheet tool (git release)"
arch=('x86_64' 'aarch64')
url="https://github.com/maaslalani/sheets"
license=('MIT')
source=("git+${url}.git")
sha256sums=('SKIP')

provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-bin")
options=('!debug')

makedepends=('git' 'go')

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd "${_pkgname}"
	mkdir -p build/
}

build() {
	cd "${_pkgname}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o "build/${_pkgname}" .
}

check() {
	cd "${_pkgname}"
	go test ./...
}

package() {
	cd "${_pkgname}"
	install -Dm755 "build/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	[ -f LICENSE ]   && install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	[ -f README.md ] && install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
