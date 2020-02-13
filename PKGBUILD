# Maintainer: Tom Whitwell <tom.whitwell@digital.cabinet-office.gov.uk>
pkgname=gds-cli-git
pkgver=535.f8b405e
pkgrel=2
pkgdesc="CLI for GDS Staff"
arch=('i686' 'x86_64')
url="https://github.com/alphagov/gds-cli"
license=('unknown')
optdepends=("aws-cli: CLI for Amazon AWS"
	"aws-vault: Manager for AWS Credentials"
	"yubikey-manager: Manager for yubikey")
makedepends=('git' 'go')
provides=("gds-cli=${pkgver}")
conflicts=('gds-cli')
source=("${pkgname}"::"git+https://github.com/alphagov/gds-cli")
sha512sums=('SKIP')

pkgver() {
	pushd "${srcdir}/${pkgname}" >/dev/null
	{
		echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
	}
	popd >/dev/null
}

build() {
	msg2 'building gds'
	pushd "${srcdir}/${pkgname}" >/dev/null
	{
		rm -rf gds
		make gds
	}
	popd >/dev/null
}

check() {
	msg2 'gds binary'
	pushd ${srcdir}/${pkgname} >/dev/null
	{
		./gds --version
	}
	popd >/dev/null
}

package() {
	msg2 'gds binary'
	pushd "${srcdir}/${pkgname}" >/dev/null
	{
		install -Dm755 "gds" "${pkgdir}/usr/bin/gds"
	}
	popd >/dev/null

	msg2 'completion files'
	pushd "${srcdir}/${pkgname}" >/dev/null
	{
		mkdir completion
		./gds zsh-completion >completion/_gds
		install -Dm644 "completion/_gds" "${pkgdir}/usr/share/zsh/site-functions/_gds"
		./gds bash-completion >completion/gds
		install -Dm644 "completion/gds" "${pkgdir}/usr/share/bash-completion/completions/gds"
	}
	popd >/dev/null
}
