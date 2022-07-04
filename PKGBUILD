# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

pkgname=terraboard
pkgver=2.2.0
pkgrel=1
pkgdesc="A web dashboard to inspect Terraform States."
arch=('x86_64')
url="https://github.com/camptocamp/terraboard/"
conflicts=('terraboard-bin')
provides=('terraboard')
license=('Apache-2')
makedepends=('go>=1.18' 'git' 'gzip' 'tar' 'gcc')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/camptocamp/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('ff86c037ad7d1c3ee7d7ea285bacc1d389d93ce99cd90ab60247ef4d4ae0d3f3')

build() {
	cd "${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -buildvcs=false -trimpath"
  go build -o build/${pkgname} -ldflags "-linkmode external -extldflags -static -X 'main.version=${pkgver}'"
}

package() {
  cd "${srcdir}"/"${pkgname}-${pkgver}"
  install -Dm755 build/"${pkgname}" "${pkgdir}"/usr/bin/"${pkgname}"
  install -Dm644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README.md
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -Dm644 CHANGELOG.md ${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md
}
