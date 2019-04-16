# Maintainer: Jean-Francois Chevrette <jfchevrette@gmail.com>

pkgname=ytt
pkgver=0.6.0
pkgrel=1
pkgdesc="YAML templating tool that works on YAML structure instead of text"
url="https://get-ytt.io/"
license=('Apache')
arch=('x86_64')
depends=('glibc')
makedepends=('git' 'go-pie')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/k14s/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('abcf564ab90cf68e98b03d7c24100008dd1d6e2153459c0e1d6f7ea512ddc2bc')

prepare() {
	rm -rf "${srcdir}/src/k14s/${pkgname}"
	mkdir -p "${srcdir}/src/k14s/${pkgname}"
	mv -T "${srcdir}/${pkgname}-${pkgver}" "${srcdir}/src/k14s/${pkgname}"
	
}

build() {
	cd "${srcdir}/src/k14s/${pkgname}"

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
	cd "${srcdir}/src/k14s/${pkgname}"
	install -Dm755 "${pkgname}" "${pkgdir}"/usr/bin/${pkgname}
	install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
