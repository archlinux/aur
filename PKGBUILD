# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

pkgname=diun
pkgver=4.22.0
pkgrel=2
pkgdesc="Receive notifications when an image is updated on a Docker registry."
arch=('x86_64')
url="https://github.com/crazy-max/diun"
conflicts=('diun-bin')
provides=('diun')
license=('MIT')
makedepends=('go>=1.17' 'git' 'gzip' 'tar' 'gcc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/crazy-max/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('92040b6506bf2d01d674aaee119ca198af2048a4a31d42c7af5837814c1bb238')

build() {
	cd "${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -buildvcs=false -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  BUILD_DATE=$(date '+%Y-%m-%d %H:%M:%S')
  go build -o build/${pkgname} -ldflags="-X 'main.buildVersion=${pkgver}' -X 'main.buildDate=${BUILD_DATE}'" ./cmd/
}

package() {
	cd "${srcdir}"/"${pkgname}-${pkgver}"
  install -Dm755 build/"${pkgname}" "${pkgdir}"/usr/bin/"${pkgname}"
  install -Dm644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README.md
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -Dm644 CHANGELOG.md ${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md
}
