# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

pkgname=colima
pkgver=0.5.6
pkgrel=1
pkgdesc="Container runtimes on macOS (and Linux) with minimal setup."
arch=('x86_64')
url="https://github.com/abiosoft/colima"
conflicts=('colima-bin')
provides=('colima')
license=('MIT')
makedepends=('go>=1.20' 'git' 'gzip' 'tar' 'gcc')
source=(  "https://github.com/abiosoft/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('76e53fb9fa003ba328b191c289049aeb9829b1c933384eee58e90f92636767b9')

build() {
	cd "${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -buildvcs=false -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  BUILD_DATE=$(date '+%Y-%m-%d %H:%M:%S')
  go build -o build/${pkgname} -ldflags="-X 'main.VERSION=${pkgver}' -X 'main.buildDate=${BUILD_DATE}'" ./cmd/colima/
}

package() {
	cd "${srcdir}"/"${pkgname}-${pkgver}"
  install -Dm755 build/"${pkgname}" "${pkgdir}"/usr/bin/"${pkgname}"
  install -Dm644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README.md
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
