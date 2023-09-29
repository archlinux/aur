# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

pkgname=diun
pkgver=4.26.0
pkgrel=1
pkgdesc="Receive notifications when an image is updated on a Docker registry."
arch=('x86_64')
url="https://github.com/crazy-max/diun"
conflicts=('diun-bin')
provides=('diun')
license=('MIT')
makedepends=('go>=1.17' 'git' 'gzip' 'tar' 'gcc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/crazy-max/${pkgname}/archive/v${pkgver}.tar.gz"
        "diun.service::https://gitlab.com/mapanare-labs/packages/archlinux/diun-bin/-/raw/main/diun.service")
sha256sums=('72cb054b2be7747c0b870310732cb568df0773cd1d788aa6bb8cd05024fcd019'
            '902084dd9bb29d19bd27de9ca6030781a7582a2353c1eeb3a9b2e5e86707a1e3')

build() {
  mv diun.service "${pkgname}-${pkgver}/"
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
  install -Dm755 diun.service ${pkgdir}/etc/systemd/system/diun.service
  install -Dm644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README.md
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -Dm644 CHANGELOG.md ${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md
}
