# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

_pkggit=rover

pkgname=rover-git
pkgver=$PKGVER
pkgrel=2
pkgdesc="Interactive Terraform visualization. State and configuration explorer."
arch=('x86_64')
url="https://github.com/im2nguyen/rover"
conflicts=('rover-bin')
provides=('rover')
license=('MIT')
makedepends=('go>=1.17' 'git' 'gzip' 'tar' 'gcc')
source=("${_pkggit}-${pkgver}.tar.gz::https://github.com/im2nguyen/${_pkggit}/archive/v${pkgver}.tar.gz")
sha256sums=('491709df11c70c9756e55f4cd203321bf1c6b92793b8db91073012a1f13b42e5')

build() {
	cd "${_pkggit}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -buildvcs=false -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  BUILD_DATE=$(date '+%Y-%m-%d %H:%M:%S')
  go build -o build/${_pkggit} -ldflags="-X 'main.buildVersion=${pkgver}' -X 'main.buildDate=${BUILD_DATE}'"
}

package() {
	cd "${srcdir}"/"${_pkggit}-${pkgver}"
  install -Dm755 build/"${_pkggit}" "${pkgdir}"/usr/bin/"${_pkggit}"
  install -Dm644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README.md
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
