# Maintainer: Jeff Henson <jeff@henson.io>
# Old Maintainer: David Runge <dvzrv@archlinux.org>

_name=jfrog
pkgname=jfrog-cli
pkgver=2.28.1
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
sha512sums=('4e2ea54f3c8d0961d85338b99726a6fe1dea5fa69779b5d29d274b6f84e7f7870d8b1db4d57e357770bd00b5409b19a3f40aed3f6ef81f3b78aedf2a7700a6c4')

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
	install -vDm 644 {README,RELEASE}.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
	install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"

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
