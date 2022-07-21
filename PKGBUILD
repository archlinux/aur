# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 
pkgname=mabel
pkgver=0.1.4
pkgrel=1
pkgdesc="A fancy BitTorrent client for the terminal"
arch=('any')
url="https://github.com/mr-karan/mabel"
license=('GPL3')
makedepends=('go')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
options=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/smmr-software/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2533d3525f24aec82429be6313176554d21e136b29ed8bf2a0bbcd5549c17dfe')
build() {
	cd "${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  BUILD_DATE=$(date '+%Y-%m-%d %H:%M:%S')
  go build -o build/${pkgname} -ldflags="-X 'main.buildVersion=${pkgver}' -X 'main.buildDate=${BUILD_DATE}'" ./
}

package() {
	cd "${pkgname}-${pkgver}"
	mkdir -p "$pkgdir"/usr/bin/
	install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 build/"${pkgname}" "${pkgdir}"/usr/bin/"${pkgname}"
  install -Dm644 README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/README.md
}
