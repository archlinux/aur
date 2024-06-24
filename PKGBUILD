# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>

pkgname='prm'
pkgver=3.5.1
pkgrel=3
pkgdesc='Pull Request Manager for Maintainers'
url='https://ldez.github.io/prm/'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
license=('APACHE')

provides=("${pkgname}")

depends=('git')
makedepends=('git' 'go')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/ldez/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('0841ce762b70fcc987371f1237ed9cc595afa4b5cb0be876f28c05f2076639f69224d5a16bd06b1da2158ebf001c62c5119dceb9e5252f5f2d358c53fe1585a6')
b2sums=('a51fed40b370fe206acc78bd1e960298aa15ed414750f5952cdb85f7e22920da9a49bda84241ca8b25d20fdeb330aff031166f5f09f1d6786e411024423386f2')

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
