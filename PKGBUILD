# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>

pkgname='prm'
pkgver=3.6.0
pkgrel=1
pkgdesc='Pull Request Manager for Maintainers'
url='https://ldez.github.io/prm/'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
license=('APACHE')

provides=("${pkgname}")

depends=('git')
makedepends=('git' 'go')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/ldez/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('4413e5188a92717c88326435c6f7624a6c4d9f6c1ac47f0099ad84197564a6b1776296d3002f73f84acd1e23d93793ba890f6351d93838853fcf14b4e9ea1cc1')
b2sums=('21275aa2eb01b9defeb3cbb2d152eb9544078657c2c21b9044ae00581b5a15c4f472bcf3e4e32d94943925217a3898b0096262d3983355648f65b3b70206fed5')

build() {
	cd "${pkgname}-${pkgver#v}"

	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	go build -ldflags="-w -s -buildid='' -linkmode=external -X main.version=v${pkgver}" .

	ls -alF
	chmod +x "./${pkgname}"
}

package() {
	cd "${pkgname}-${pkgver#v}"
	ls -alF

	# Bin
	install -Dsm755 "./${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
