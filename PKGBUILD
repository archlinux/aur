# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

pkgname=terraboard
pkgver=2.3.0
pkgrel=1
pkgdesc="A web dashboard to inspect Terraform States."
arch=('x86_64')
url="https://github.com/camptocamp/terraboard/"
conflicts=('terraboard-bin')
provides=('terraboard')
license=('Apache-2')
makedepends=('go>=1.21' 'git' 'gzip' 'tar' 'gcc')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/camptocamp/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('821b98cdf530d66ce491bcfd3d82e0993bb5b2e8a2f3f04ff3d63d23ab4f1b77')

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
