# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>
# Maintainer: Carlos Alexandro Becker <carlos at becker dot software>

pkgname='nfpm'
pkgver=2.41.0
pkgrel=1
pkgdesc='A simple deb and rpm packager written in Go '
url='https://github.com/goreleaser/nfpm'
arch=('x86_64')
license=('MIT')

depends=()
makedepends=('git' 'go')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/goreleaser/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('8e93813dabe0662ed66314f6cd3adaf82892e9f4a59d0fb894931300ff29ac77b7a70dc460d96e74d31a5e39015ed9e93a0f3806e71c6b75aeef157aa8e8fac1')
b2sums=('1a83f5022db273dc215222423ac4897ab2c16f5a35dc60c3ab140b0762802f4ee44c72ce5553f56e0a95f4b8a1dda726bfdc0e99a6277bb6c63e2137f7c6d109')

build() {
	cd "${pkgname}-${pkgver}"

	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	go build -ldflags="-w -s -buildid='' -linkmode=external -X main.version=v${pkgver}" ./cmd/nfpm

	ls -alF
	chmod +x "./${pkgname}"
}

package() {
	cd "${pkgname}-${pkgver}"
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
