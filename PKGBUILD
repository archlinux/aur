# Maintainer: aulonsal <seraur at aulonsal dot com>

pkgname=f2
pkgver=2.0.1
pkgrel=1
pkgdesc='Cross-platform command-line tool for batch renaming files and directories quickly and safely'
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/ayoisaiah/${pkgname}"
license=('MIT')
depends=(
	'glibc'
)
makedepends=(
	'go'
	'just'
)
conflicts=("${pkgname}-bin")

source=("${pkgname}-${pkgver}-LICENCE::${url/github/raw.githubusercontent}/v${pkgver}/LICENCE")
source_x86_64=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")

b2sums=('1375f8eb689085b7735551ce0f5f19167df905bdf8f105ac72479ae6214666f74a03ce24766bc08a9407c878ecd8078ca3e81013ecf4fd8c80a52dc308e29d78')
b2sums_x86_64=('99e427f2d5535ad66d602bfa2037587fe685e6c6f9b54ee23aec843302a30b3aa41da8ea6dc71a539a6cb8cc3cf17213f40b486c11fca5fa4e51ec0f903e8478')

build() {
	declare -x CGO_CPPFLAGS="${CPPFLAGS}"
	declare -x CGO_CFLAGS="${CFLAGS}"
	declare -x CGO_CXXFLAGS="${CXXFLAGS}"
	declare -x CGO_LDFLAGS="${LDFLAGS}"
	declare -x GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	cd "${pkgname}-${pkgver}"
	just build
}

check() {
	cd "${pkgname}-${pkgver}"
	just test
}

package() {
	cd "${pkgname}-${pkgver}"

	install -Dm755 "bin/${pkgname}" -t "${pkgdir}/usr/bin"
	install -Dm644 LICENCE -t "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
