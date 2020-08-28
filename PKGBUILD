# Maintainer: Jean-Francois Chevrette <jfchevrette@gmail.com>

_pkgname=kapp
pkgname=${_pkgname}-git
pkgver=r517.0fc63da
pkgrel=1
pkgdesc='kapp is a simple deployment tool focused on the concept of "Kubernetes application"'
url="https://get-kapp.io/"
license=('Apache')
arch=('x86_64')
makedepends=('go-pie' 'ytt>=0.17.0')
source=("git+https://github.com/k14s/${_pkgname}/")
sha256sums=('SKIP')
provides=("kapp")

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
	export GOFLAGS="-gcflags=all=-trimpath=${PWD} -asmflags=all=-trimpath=${PWD} -ldflags=-extldflags=-zrelro -ldflags=-extldflags=-znow"

	mkdir -p tmp
	build_values_path="../../../${BUILD_VALUES:-./hack/build-values-default.yml}"
	(
		cd pkg/kapp/website
		ytt template \
			-f . \
			-f $build_values_path \
			--file-mark 'generated.go.txt:exclusive-for-output=true' \
			--dangerous-emptied-output-directory ../../../tmp/
	)
	mv tmp/generated.go.txt pkg/kapp/website/generated.go

	go build -o kapp ./cmd/kapp/...
}

package() {
	cd "${srcdir}/src/github.com/k14s/${_pkgname}"
	install -Dm755 "${_pkgname}" "${pkgdir}"/usr/bin/${_pkgname}
	install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${_pkgname}/LICENSE
}
