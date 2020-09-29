# Maintainer: Tom Whitwell <tom.whitwell@digital.cabinet-office.gov.uk>
pkgname=gds-cli-git
pkgver=3.0.0.r11.g52ceac3
pkgrel=1
pkgdesc="CLI for GDS Staff"
arch=('i686' 'x86_64')
url="https://github.com/alphagov/gds-cli"
license=('unknown')
optdepends=("aws-cli: CLI for Amazon AWS"
	"aws-vault: Manager for AWS Credentials"
	"yubikey-manager: Manager for yubikey"
    "govuk-guix: CLI tool for managing GOV.UK services")
makedepends=('git' 'go-pie')
provides=("gds-cli=${pkgver}")
conflicts=('gds-cli')
source=("${pkgname}"::"git+https://github.com/alphagov/gds-cli#branch=main")
sha512sums=('SKIP')

pkgver() {
	pushd "${srcdir}/${pkgname}" >/dev/null
	{
		git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v\(.*\)/\1/'
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
