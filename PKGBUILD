# Maintainer: Jean-Francois Chevrette <jfchevrette@gmail.com>

_pkgname=ytt
pkgname=${_pkgname}-git
pkgver=r482.98c00dd
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
	cd "${srcdir}/src/github.com/k14s/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	rm -rf "${srcdir}/src/github.com/k14s/${_pkgname}"
	mkdir -p "${srcdir}/src/github.com/k14s/${_pkgname}"
	mv -T "${srcdir}/${_pkgname}" "${srcdir}/src/github.com/k14s/${_pkgname}"
}

build() {
	cd "${srcdir}/src/github.com/k14s/${_pkgname}"

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
			-f ../../examples/playground/basics \
			-f ../../examples/playground/getting-started \
			-f $build_values_path \
			--file-mark 'alt-example**/*:type=data' \
			--file-mark 'example**/*:type=data' \
			--file-mark 'generated.go.txt:exclusive-for-output=true' \
			--dangerous-emptied-output-directory ../../tmp/
	)
	mv tmp/generated.go.txt pkg/website/generated.go

	# Rebuild ytt with website assets
	rm -f ./ytt
	go build -o ytt ./cmd/ytt/...
}

package() {
	cd "${srcdir}/src/github.com/k14s/${_pkgname}"
	install -Dm755 "${_pkgname}" "${pkgdir}"/usr/bin/${_pkgname}
	install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${_pkgname}/LICENSE
}
