# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

pkgname=terrascan
pkgver=1.18.0
pkgrel=1
pkgdesc="Detect compliance and security violations across Infrastructure as Code"
arch=('x86_64')
url="https://github.com/accurics/terrascan"
conflicts=('terrascan-bin')
provides=('terrascan')
license=('Apache-2')
makedepends=('go>=1.19' 'git' 'gzip' 'tar' 'gcc')
source=("https://github.com/accurics/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('b6cf06567d2a9ea5b059dadf65845d1d7c390c26e6d07c726a18ed7dc7c1b8b3')

build() {
	cd "${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -buildvcs=false -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  BUILD_DATE=$(date '+%Y-%m-%d %H:%M:%S')
  go build -o build/${pkgname} -ldflags="-X 'main.VERSION=${pkgver}' -X 'main.buildDate=${BUILD_DATE}'" ./cmd/terrascan/
}

package() {
  cd "${srcdir}"/"${pkgname}-${pkgver}"
  install -Dm755 build/"${pkgname}" "${pkgdir}"/usr/bin/"${pkgname}"
  install -Dm644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README.md
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -Dm644 CHANGELOG.md ${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md
}
