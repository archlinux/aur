# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

pkgname=terramate
pkgver=0.4.2
pkgrel=1
pkgdesc="Terramate is a tool for managing multiple Terraform stacks that comes with support for change detection and code generation."
arch=('x86_64')
url="https://github.com/terramate-io/terramate"
conflicts=('terramate-bin')
provides=('terramate')
license=('MPL-2')
makedepends=('go>=1.18' 'git' 'gzip' 'tar' 'gcc')
source=("https://github.com/terramate-io/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('14204c7f4e0b071c38b7a61de711847c86ffa33f57a0813a7e801793884a0545')

build() {
	cd "${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -buildvcs=false -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  BUILD_DATE=$(date '+%Y-%m-%d %H:%M:%S')
  go build -o build/${pkgname} -ldflags="-X 'main.VERSION=${pkgver}' -X 'main.buildDate=${BUILD_DATE}'" ./cmd/terramate/
}

package() {
  cd "${srcdir}"/"${pkgname}-${pkgver}"
  install -Dm755 build/${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -Dm644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README.md
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  cp -rv docs/* ${pkgdir}/usr/share/doc/${pkgname}/
}
