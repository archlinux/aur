# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 
pkgname=mabel
pkgver=0.1.6
pkgrel=3
pkgdesc="A fancy BitTorrent client for the terminal"
arch=('any')
url="https://github.com/smmr-software/${pkgname}"
license=('GPL3')
makedepends=('go')
depends=('ttf-nerd-fonts-symbols-2048-em')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('be8982446ef607f33a12475a7bd1cfbdee278cdd917ad6304aab42021fff1da0')
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
