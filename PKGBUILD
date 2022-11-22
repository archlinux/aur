# Maintainer:  <reg-archlinux AT klein DOT tuxli DOT ch> 

_pkgname=rssnix
pkgname=${_pkgname}-git
pkgver=r30.95ebe7d
pkgrel=1
pkgdesc="Unix-style filesystem-based RSS/Atom/JSON Feed fetcher/reader"
arch=('any')
url="https://github.com/jafarlihi/rssnix"
license=('MIT')
makedepends=('git' 'go')
optdepends=('vim: default viewer'
						'ranger: enhanced viewer')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-bin")
source=(git+${url}.git)
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
 	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}"/"${_pkgname}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o ${_pkgname} .
}

package() {
	cd "${srcdir}"/"${_pkgname}"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm755 "${_pkgname}" "${pkgdir}"/usr/bin/"${_pkgname}"
  install -Dm644 README.md "${pkgdir}"/usr/share/doc/"${_pkgname}"/README.md
}
