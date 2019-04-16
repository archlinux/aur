# Maintainer: Jean-Francois Chevrette <jfchevrette@gmail.com>

_pkgname=ytt
pkgname=${_pkgname}-git
pkgver=r33.878facd
pkgrel=1
pkgdesc="YAML templating tool that works on YAML structure instead of text"
url="https://get-ytt.io/"
license=('Apache')
arch=('x86_64')
depends=('glibc')
makedepends=('git' 'go-pie')
source=("git+https://github.com/k14s/${_pkgname}/")
sha256sums=('SKIP')
provides=("ytt")
conflicts=("ytt")

pkgver() {
	cd "${srcdir}/src/k14s/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	rm -rf "${srcdir}/src/k14s/${_pkgname}"
	mkdir -p "${srcdir}/src/k14s/${_pkgname}"
	mv -T "${srcdir}/${_pkgname}" "${srcdir}/src/k14s/${_pkgname}"
}

build() {
	cd "${srcdir}/src/k14s/${_pkgname}"

	export GOPATH="${srcdir}"
	export PATH="${srcdir}/bin:$PATH"

	# Get dep
	go get -u github.com/golang/dep/cmd/dep

	# Install dependencies
	dep ensure

	# Build ytt
	go build -o ytt ./cmd/ytt
}

package() {
	cd "${srcdir}/src/k14s/${_pkgname}"
	install -Dm755 "${_pkgname}" "${pkgdir}"/usr/bin/${_pkgname}
	install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${_pkgname}/LICENSE
}
