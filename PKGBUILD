# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=jackdaw
_gitname=curre
_appname=${_gitname}
pkgname=${_appname}
pkgdesc="A TUI workflow runner that drives your shell scripts through JSON-defined steps with live output, parallel execution, and persistent sessions"

pkgver=0.0.4
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

_cburl="https://codeberg.org/${_gitauthor}/${_gitname}"
_cburlraw="${_cburl}/raw/tag/${_gitversion}"
url=${_cburl}

license=('MIT')

provides=("${_appname}")

makedepends=('go')

options=('!strip')

source=("${_appname}-${pkgver}.tgz::${_cburl}/archive/${_gitversion}.tar.gz")
sha256sums=('eaf98d38f45feb6c6e44643fbc844379d8ebb76eec5db2defa88d51d9e83157d')


prepare() {
	cd "${srcdir}/${pkgname}/" || exit 1

	go mod tidy
}

build() {
	cd "${srcdir}/${pkgname}/" || exit 1

	export CGO_ENABLED=0

	if [[ -f .ldflags ]]; then
		ldflags=$(<.ldflags)
	else
		# interim until commit fix is released
		ldflags="-checklinkname=0"
	fi

	go build -trimpath -ldflags "${ldflags}" -o "build/${_appname}" .
}

package() {
	cd "${srcdir}/${pkgname}/" || exit 1

	install -Dm755 "build/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
