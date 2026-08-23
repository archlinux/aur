# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=padovanl
_gitname=termdock
_appname=${_gitname}
pkgname=${_appname}
pkgdesc="A terminal multiplexer with persistent sessions — split panes, detach, reattach"

pkgver=0.0.8
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

makedepends=('go')
provides=("${_appname}")

options=('!strip')

source=("${pkgname}-${pkgver}.tgz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('00a9d57b93fecc145286916444de9a12b0c6e77defc53717ddc78efb3828eda1')


prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}/" || exit

	go mod tidy
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}/" || exit

	export CGO_ENABLED=0

	if [[ -f .ldflags ]]; then
		ldflags=$(<.ldflags)
	else
		# interim until commit fix is released
		ldflags="-checklinkname=0"
	fi

	go build -trimpath -ldflags "${ldflags}" -o "${pkgname}" ./
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "packaging/${_appname}.conf.example" "${pkgdir}/usr/share/${pkgname%-bin}/config/${_appname}.conf.example"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
