# Maintainer: aulonsal <seraur at aulonsal dot com>

pkgname=f2
pkgver=2.0.3
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
b2sums_x86_64=('f6e73d541b5e4894e1755c7069b118d537c1d10cad3ccc1dddb9a4f46b9e1e53e2f0aabcd14f37f92722df03d173a911c1596a2965727e2631933619751af768')

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
