# Maintainer: Alfredo Ramos <alfredo.ramos@proton.me>

_binname=asdf
_pkgname=${_binname}-vm
pkgname=${_pkgname}-git
pkgver=0.18.0.r1.g2114f1e
pkgrel=1
pkgdesc='Extendable version manager with support for Ruby, Node.js, Elixir, Erlang & more. Git version.'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://asdf-vm.com'
license=('MIT')
depends=('git' 'curl')
makedepends=('go' 'txt2man')
optdepends=(
	'ncurses: For terminal handling'
	'bash-completion: For Bash completion'
	'unzip: For some plugins'
)
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
install=${_pkgname}.install

source=("git+https://github.com/${_pkgname}/${_binname}.git")
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}"/${_binname}
	git describe --long --tags --abbrev=7 --match="v[0-9]*" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}"/${_binname}

	# Core
	mkdir -p build
	make TARGET_DIR=build build

	# Man page
	txt2man -t "${_pkgname}" -v "${pkgname}" -r "${pkgver}" help.txt > ${_binname}.1
}

package() {
	cd "${srcdir}"/${_binname}

	# Core
	mkdir -p "${pkgdir}"/usr/bin
	cp -a build/${_binname} "${pkgdir}"/usr/bin/${_binname}

	# Shell completions
	mkdir -p "${pkgdir}"/usr/share/{,bash-completion/completions,fish/vendor_completions.d,zsh/site-functions}
	cp -a internal/completions/asdf.bash "${pkgdir}"/usr/share/bash-completion/completions/
	cp -a internal/completions/asdf.fish "${pkgdir}"/usr/share/fish/vendor_completions.d/
	cp -a internal/completions/asdf.zsh "${pkgdir}"/usr/share/zsh/site-functions/

	# Man page
	mkdir -p "${pkgdir}"/usr/share/man/man1
	cp -a ${_binname}.1 "${pkgdir}"/usr/share/man/man1/

	# License
	mkdir -p "${pkgdir}"/usr/share/licenses/${pkgname}
	cp -a LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/
}
