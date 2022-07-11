# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 

_pkgname=spidy
pkgname="${_pkgname}-git"
pkgver=r10.f31f292
pkgrel=1
pkgdesc='Expired Domain Name Scraper - scrap the web and find expired domains'
arch=('x86_64' 'aarch64')
url="https://github.com/twiny/spidy.git"
license=('GPL')
makedepends=('go' 'git')
source=("git+${url}")
conflicts=("${_pkgname}-bin" ${_pkgname})
provides=('spidy')
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
 	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare(){
  cd "${_pkgname}"
  mkdir -p build/
}

build() {
  cd "${_pkgname}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build/${_pkgname} -v cmd/spidy/main.go
}

package() {
  cd "${_pkgname}"
  install -Dm755 build/"${_pkgname}" "${pkgdir}"/usr/bin/"${_pkgname}"
  install -Dm644 README.md "${pkgdir}"/usr/share/doc/"${_pkgname}"/README.md
  install -Dm644 config/example.config.yaml "${pkgdir}"/usr/share/doc/"${_pkgname}"/example.config.yaml
}
