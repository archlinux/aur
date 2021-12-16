# Maintainer:  <reg-archlinux AT klein DOT tuxli DOT ch> 
pkgname=doggo-git
_pkgname=doggo
pkgver=r97.3d7b4a9
pkgrel=1
pkgdesc="Command-line DNS Client for Humans. Written in Golang" 
arch=('any')
url="https://github.com/mr-karan/doggo"
license=('GPL3')
makedepends=('git' 'go')
provides=('doggo')
conflicts=('doggo')
options=()
source=(git+https://github.com/mr-karan/doggo.git)
md5sums=('SKIP')
build() {
	cd "${srcdir}"/"${_pkgname}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  BUILD_DATE=$(date '+%Y-%m-%d %H:%M:%S')
  go build -o build/${_pkgname} -ldflags="-X 'main.buildVersion=${pkgver}' -X 'main.buildDate=${BUILD_DATE}'" ./cmd/doggo/
}

pkgver() {
	cd "${_pkgname}"
 	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}"/"${_pkgname}"
	mkdir -p "$pkgdir"/usr/bin/
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm755 build/"${_pkgname}" "${pkgdir}"/usr/bin/"${_pkgname}"
  install -Dm644 README.md "${pkgdir}"/usr/share/doc/"${_pkgname}"/README.md
  install -Dm644 completions/"${_pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}"
  install -Dm644 completions/"${_pkgname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
}
