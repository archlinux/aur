# Maintainer: Jeff Henson <jeff@henson.io>
# Old Maintainer: David Runge <dvzrv@archlinux.org>

_name=jfrog
pkgname=jfrog-cli
pkgver=2.18.0
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
sha512sums=('81014252ef05b5b2dea4be85cf3bb5136d75354006a56b7fd3fb033c62f74680e26c06f6c8f4c1e01be02cf000fa6cbc8c4118c68739e4444b43b4079202c6d1')

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
