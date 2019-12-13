# Maintainer: Jean-Francois Chevrette <jfchevrette@gmail.com>

pkgname=ytt
pkgver=0.23.0
pkgrel=1
pkgdesc="YAML templating tool that works on YAML structure instead of text"
url="https://get-ytt.io/"
license=('Apache')
arch=('x86_64')
depends=('glibc')
makedepends=('git' 'go-pie')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/k14s/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('4de6f6ce6a09613407e9a40a46807eaa4f8ffd2266dda323bb8beb308c061a00')


prepare() {
	rm -rf "${srcdir}/src/github.com/k14s/${pkgname}"
	mkdir -p "${srcdir}/src/github.com/k14s/${pkgname}"
	mv -T "${srcdir}/${pkgname}-${pkgver}" "${srcdir}/src/github.com/k14s/${pkgname}"
}

build() {
	cd "${srcdir}/src/github.com/k14s/${pkgname}"

	export GOPATH="${srcdir}"

	# Build ytt without website assets
	go build -o ytt ./cmd/ytt/...

	# Use ytt to build website assets
	mkdir -p tmp
	build_values_path="../../${BUILD_VALUES:-./hack/build-values-default.yml}"
	(
		cd pkg/website
		./../../ytt \
			-f . \
			-f ../../examples/playground \
			-f $build_values_path \
			--file-mark 'alt-example**/*:type=data' \
			--file-mark 'example**/*:type=data' \
			--file-mark 'generated.go.txt:exclusive-for-output=true' \
			--output-directory ../../tmp/
	)
	mv tmp/generated.go.txt pkg/website/generated.go

	# Rebuild ytt with website assets
	rm -f ./ytt
	go build -o ytt ./cmd/ytt/...
}

package() {
	cd "${srcdir}/src/github.com/k14s/${pkgname}"
	install -Dm755 "${pkgname}" "${pkgdir}"/usr/bin/${pkgname}
	install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
