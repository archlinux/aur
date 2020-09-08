# Maintainer: Jean-Francois Chevrette <jfchevrette@gmail.com>

pkgname=kbld
pkgver=0.24.0
pkgrel=1
pkgdesc="kbld seamlessly incorporates image building and image pushing into your development and deployment workflows"
url="https://get-kbld.io/"
license=('Apache')
arch=('x86_64')
depends=('glibc')
makedepends=('git' 'go' 'ytt' 'zip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/k14s/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('c3b1c275a85fd308ddf94302d73665cb3cf61b839fe4bd74b3506523ff30e00e')

prepare() {
	rm -rf "${srcdir}/src/github.com/k14s/${pkgname}"
	mkdir -p "${srcdir}/src/github.com/k14s/${pkgname}"
	mv -T "${srcdir}/${pkgname}-${pkgver}" "${srcdir}/src/github.com/k14s/${pkgname}"
}

build() {
	cd "${srcdir}/src/github.com/k14s/${pkgname}"

	export GOPATH="${srcdir}"
	./hack/build.sh

	## Build ytt without website assets
	#go build -o ytt ./cmd/ytt/...

	## Use ytt to build website assets
	#mkdir -p tmp
	#build_values_path="../../${BUILD_VALUES:-./hack/build-values-default.yml}"
	#(
	#	cd pkg/website
	#	./../../ytt \
	#		-f . \
	#		-f ../../examples/playground \
	#		-f $build_values_path \
	#		--file-mark 'alt-example**/*:type=data' \
	#		--file-mark 'example**/*:type=data' \
	#		--file-mark 'generated.go.txt:exclusive-for-output=true' \
	#		--output-directory ../../tmp/
	#)
	#mv tmp/generated.go.txt pkg/website/generated.go

	## Rebuild ytt with website assets
	#rm -f ./ytt
	#go build -o kbld ./cmd/kbld/...
}

package() {
	cd "${srcdir}/src/github.com/k14s/${pkgname}"
	install -Dm755 "${pkgname}" "${pkgdir}"/usr/bin/${pkgname}
	install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
