# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>

pkgname='motoko'
pkgver=0.3.0
pkgrel=1
pkgdesc='Based on Go modules, update a dependency to a major version.'
url='https://github.com/ldez/motoko'
arch=('x86_64' 'i686' 'aarch64')
license=('APACHE')
provides=("${pkgname}")
conflicts=("${pkgname}-bin")

depends=()
makedepends=('git' 'go')
optdepends=()

source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/ldez/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('e81df683d3b8b3dddf75fe1fbb9df20d12d4998e7a32a5a02a16a95e882dad341342dd2b3424371d9a7d13f815973ba8706ac7dd524191d2562fbf273a9b00d8')
b2sums=('188cf567e910a02833cd93d0db9a22fb9259f40823b67bd00ab02312a0666b2a4e2df699f7ae6ad022ec269adcbedd989fcd0e5d98c4c04ec1d68f9f354a3edd')

build() {
	cd "${pkgname}-${pkgver}"

	export BUILD_DATE=$(date -u '+%Y-%m-%d_%I:%M:%S%p')

	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

	go build -ldflags="-w -s -linkmode=external -X 'main.version=v${pkgver}' -X 'main.date=${BUILD_DATE}'"

	ls -alF
	chmod +x "./${pkgname}"
}

package() {
	cd "${pkgname}-${pkgver}"
	ls -alF

	# Bin
	install -Dsm755 "./${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	# License
	install -Dm644 "./LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
