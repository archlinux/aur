# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>

pkgname='nfpm'
pkgver=v2.11.3
pkgrel=2
pkgdesc='A simple deb and rpm packager written in Go '
url='https://github.com/goreleaser/nfpm'
arch=('x86_64')
license=('MIT')

depends=()
makedepends=('git' 'go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/goreleaser/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('0799eaaa17457b14016d94cdd4b534743eb5c3fbc4d4b84db8f6d557de4ede77b0f468c4050d9b116b3b52a716113c708fcce99a5a63e332a4dcfd7e2bc2aa0d')
b2sums=('91edf9ceb7662538a7e6942dde5d675301226dbb2fa462dd3c774b782b18748c1955f30ce9d00ab2ab7de44d8b041c45d13aebd810379ed0cc644ec6c51e6a4f')

build() {
	cd "${pkgname}-${pkgver#v}"

	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	go build -ldflags="-w -s -buildid='' -linkmode=external -X main.version=${pkgver}" ./cmd/nfpm

	ls -alF
	chmod +x "./${pkgname}"
}

package() {
	cd "${pkgname}-${pkgver#v}"
	ls -alF

	# Bin
	install -Dsm755 "./${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	# License
	install -Dm644 "./LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	# Completions
	mkdir -p "${pkgdir}/usr/share/bash-completion/completions/"
	mkdir -p "${pkgdir}/usr/share/zsh/site-functions/"
	mkdir -p "${pkgdir}/usr/share/fish/vendor_completions.d/"
	./${pkgname} completion bash > "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
	./${pkgname} completion zsh > "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
	./${pkgname} completion fish > "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
}
