# Maintainer: Jeff Henson <jeff@henson.io>
# Old Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=jfrog-cli
pkgver=2.81.0
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
sha512sums=('17e6b41da2f019545157e6c95e971b1b9e53e6acb0aa927aed466c990d9fc73c486b1ecb7fccbc62bb49817e1640234d0a5c07e2047a467e5490900bac0f5bda')

prepare() {
	cd "${pkgname}-${pkgver}"
	go mod tidy
}

_cli_name=jf
build() {
	cd "${pkgname}-${pkgver}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o ${_cli_name}

	./${_cli_name} completion bash > ${_cli_name}.bash
	./${_cli_name} completion zsh > ${_cli_name}.zsh
	./${_cli_name} completion fish > ${_cli_name}.fish
}

package() {
	cd "${pkgname}-${pkgver}"
	install -vDm 755 ${_cli_name} -t "${pkgdir}/usr/bin/"
	ln -rs "${pkgdir}/usr/bin/${_cli_name}" "${pkgdir}/usr/bin/jfrog"
	install -vDm 644 {README,RELEASE}.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
	install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"

	# bash completions
	mkdir -p "${pkgdir}/usr/share/bash-completion/completions"
	install -vDm 644 ${_cli_name}.bash "${pkgdir}/usr/share/bash-completion/completions/${_cli_name}"
	install -vDm 644 ${_cli_name}.bash "${pkgdir}/usr/share/bash-completion/completions/jfrog"

	# zsh completions
	mkdir -p "${pkgdir}/usr/share/zsh/site-functions"
	install -vDm 644 ${_cli_name}.zsh "${pkgdir}/usr/share/zsh/site-functions/_${_cli_name}"
	install -vDm 644 ${_cli_name}.zsh "${pkgdir}/usr/share/zsh/site-functions/_jfrog"

	# fish completions
	mkdir -p "${pkgdir}/usr/share/fish/vendor_completions.d/"
	install -vDm 644 ${_cli_name}.fish "${pkgdir}/usr/share/fish/vendor_completions.d/${_cli_name}.fish"
	echo "complete -c jfrog -w ${_cli_name}" > "${pkgdir}/usr/share/fish/vendor_completions.d/jfrog.fish"
}
