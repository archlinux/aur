# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>

pkgname='nfpm'
pkgver=v2.15.1
pkgrel=1
pkgdesc='A simple deb and rpm packager written in Go '
url='https://github.com/goreleaser/nfpm'
arch=('x86_64')
license=('MIT')

depends=()
makedepends=('git' 'go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/goreleaser/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('02e5146f180389e03045ec0ad65670971358915d3fd4bc52d7b053d82676ac85a7cbbd683916485b83f0d53aada18d107fbf6c2b73f12302958ce28f8c8d9332')
b2sums=('7461e641f7f789782f38daecb017d8ec0839764efb95377d1c71df86159cc8d78767d8516e33050f648b8b1f0f5d99e20d58bc85cc9e6e87193d63975a730e89')

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
