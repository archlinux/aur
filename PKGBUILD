# Maintainer: Jean-Francois Chevrette <jfchevrette@gmail.com>

pkgname=ytt
pkgver=0.7.0
pkgrel=1
pkgdesc="YAML templating tool that works on YAML structure instead of text"
url="https://get-ytt.io/"
license=('Apache')
arch=('x86_64')
depends=('glibc')
makedepends=('git' 'go-pie')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/k14s/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('fb7fdd94ba4e375797525bc65c456a99e46443a241be281b34294175e144222b')


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
