# Maintainer:  <reg-archlinux AT klein DOT tuxli DOT ch> 
pkgname=mabel-git
_pkgname=mabel
pkgver=r232.93a0f10
pkgrel=1
pkgdesc="A fancy BitTorrent client for the terminal"
arch=('any')
url="https://github.com/mr-karan/mabel"
license=('GPL3')
makedepends=('git' 'go')
provides=('mabel')
conflicts=('mabel')
options=()
source=(git+https://github.com/smmr-software/mabel.git)
sha256sums=('SKIP')
build() {
	cd "${srcdir}"/"${_pkgname}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  BUILD_DATE=$(date '+%Y-%m-%d %H:%M:%S')
  go build -o build/${_pkgname} -ldflags="-X 'main.buildVersion=${pkgver}' -X 'main.buildDate=${BUILD_DATE}'" ./
}

pkgver() {
	cd "${_pkgname}"
 	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}"/"${_pkgname}"
	mkdir -p "$pkgdir"/usr/bin/
	install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm755 build/"${_pkgname}" "${pkgdir}"/usr/bin/"${_pkgname}"
  install -Dm644 README.md "${pkgdir}"/usr/share/doc/"${_pkgname}"/README.md
}
