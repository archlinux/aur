# Maintainer: Jeff Henson <jeff@henson.io>
# Old Maintainer: Gabriel M. Dutra <0xdutra@gmail.com>

pkgname=terraform-docs
pkgver=0.17.0
pkgrel=1
pkgdesc=" Generate documentation from Terraform modules in various output formats"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/terraform-docs/terraform-docs"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/terraform-docs/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('698537c9cc170f8760cda862d560bfeaa24f2a705bbc70c22a8facbf05a829e0')

build() {
	cd "${pkgname}-${pkgver}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o "${pkgname}"

	./${pkgname} completion bash > ${pkgname}.bash
	./${pkgname} completion zsh > ${pkgname}.zsh
	./${pkgname} completion fish > ${pkgname}.fish
}

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm755 "${pkgname}" -t "${pkgdir}/usr/bin/"
	install -vDm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"

	install -vDm 644 ${pkgname}.bash "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
	install -vDm 644 ${pkgname}.zsh "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
	install -vDm 644 ${pkgname}.fish "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
}
