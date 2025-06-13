# Maintainer: aulonsal <seraur at aulonsal dot com>

pkgname=f2
pkgver=2.1.2
pkgrel=2
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
	'perl-image-exiftool'
)
conflicts=("${pkgname}-bin")

source=("${pkgname}-${pkgver}-LICENCE::${url/github/raw.githubusercontent}/v${pkgver}/LICENCE")
source_x86_64=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")

b2sums=('1375f8eb689085b7735551ce0f5f19167df905bdf8f105ac72479ae6214666f74a03ce24766bc08a9407c878ecd8078ca3e81013ecf4fd8c80a52dc308e29d78')
b2sums_x86_64=('7083915839ef70828e98a08836f9b515dd9e179307078a963e7b375e1e9450e1b2492a1e578e556d4a3c50fc0ca3f7a0702221c6db733f2c4383101e5eadce12')

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
