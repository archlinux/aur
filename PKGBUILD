# Maintainer: Jeff Henson <jeff@henson.io>
# Old Maintainer: David Runge <dvzrv@archlinux.org>

_name=jfrog
pkgname=jfrog-cli
pkgver=2.21.3
pkgrel=1
pkgdesc="Simple interface to Artifactory, Bintray and Mission Control"
arch=('x86_64')
url="https://github.com/jfrog/jfrog-cli"
license=('Apache')
depends=('glibc')
conflicts=('jfrog-cli-go')
replaces=('jfrog-cli-go')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jfrog/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('a945d8882b904d3834e7428d1f903db9f31413fd853cbb31c23ebc5073e875412fead3fce8d46cdf75f3b0c5b1bcef8251b5142de8d57757f99c3d2dcfe2360e')

build() {
	cd "${pkgname}-${pkgver}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o ${_name}
}

package() {
	cd "${pkgname}-${pkgver}"
	install -vDm 755 jfrog -t "${pkgdir}/usr/bin/"
	install -vDm 644 {README,RELEASE}.md -t "${pkgdir}/usr/share/doc/${pkgname}"

	# build bash completions
	mkdir -p "${pkgdir}/usr/share/bash-completion/completions"
	./${_name} completion bash > "${pkgdir}/usr/share/bash-completion/completions/${_name}"

	# build zsh completions
	mkdir -p "${pkgdir}/usr/share/zsh/site-functions"
	./${_name} completion zsh > "${pkgdir}/usr/share/zsh/site-functions/_${_name}"

	# build fish completions
	mkdir -p "${pkgdir}/usr/share/fish/vendor_completions.d/"
	./${_name} completion fish > "${pkgdir}/usr/share/fish/vendor_completions.d/${_name}.fish"
}
