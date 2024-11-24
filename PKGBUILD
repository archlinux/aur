# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>
# Maintainer: Carlos Alexandro Becker <carlos at becker dot software>

pkgname='nfpm'
pkgver=2.41.1
pkgrel=2
pkgdesc='nFPM is a simple, 0-dependencies, deb, rpm and apk packager.'
url='https://github.com/goreleaser/nfpm'
arch=('aarch64' 'x86_64')
license=('MIT')

depends=()
makedepends=('git' 'go')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/goreleaser/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('4578f1cb68376462146c6c835ca6d4a8e033980d39db567b6967ccbe988afd098e087e7b200ea9effea835423c67d6d44efe0c3f2d39b99a08858a59e52cc31e')
b2sums=('29823dd56fe9b52b58c080854af0827b0fbcdd07d0a0068218d4c43f2a4495ae29dd921310bdfec760fe5ebc6bf8b152049a41db3cd159b475b7ba194fec0fdd')

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
