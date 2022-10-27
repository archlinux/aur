# Maintainer: Jeff Henson <jeff@henson.io>
# Old Maintainer: David Runge <dvzrv@archlinux.org>

_name=jfrog
pkgname=jfrog-cli
pkgver=2.28.2
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
sha512sums=('0225194a9840c85c15202183f91db24e4091319136e18387d0959decd8f0dcbc56bf314c115c0135b928f4603a4211d40cca6bcde84548d8c549af16aa631801')

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
