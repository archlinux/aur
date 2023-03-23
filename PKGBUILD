# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>

pkgname='nfpm'
pkgver=v2.27.1
pkgrel=1
pkgdesc='A simple deb and rpm packager written in Go '
url='https://github.com/goreleaser/nfpm'
arch=('x86_64')
license=('MIT')

depends=()
makedepends=('git' 'go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/goreleaser/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('c3099258553acbc37c19216ac2784b55f25c181021a03c2ba720f9ba252ba0d6e977cead0af960d86a68d7e38e3637e4286e2fea32542cc5aa040bd0a67ccaf4')
b2sums=('f18b96802268b3d4a22e81e21c18132739fb42ee1b188b38ecb2c52d9fc5b011c2ab58608013587722121d8f432babb023a7802bcc144336e9397a13600bb3e3')

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
