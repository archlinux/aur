# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>

pkgname='motoko'
pkgver=0.2.6
pkgrel=4
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
sha512sums=('1db11bf6154d06822c0aab4021d584883523804d15606928d1712830bf4987e550ab1dbc444f5f964a462abdeb6449416b0497d802fdb7fedb3e94b894a4e7c3')
b2sums=('79569026a00df23e6a8edbb3d9383139febae607f74291a37067f0b1dedd9c8ffa26a553f0b5c858593dc74301091937a64df41a186cd79dd3ebabde454c1fe2')

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
