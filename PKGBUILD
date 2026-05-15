# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=mohamedation
_gitname=gotermfx
_appname=${_gitname}
pkgname=${_appname}
pkgdesc="Terminal animations for people who spend too much time in the terminal."

pkgver=0.1.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source=("${pkgname}-${pkgver}.tgz::${url}/archive/${_gitversion}.tar.gz")
sha256sums=('2b3b58e4b0686c2ab3061f492f7163c5c76c16927f424e70df6daa681ee69169')


prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	go mod tidy
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

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
	cd ${srcdir}/${pkgname}-${pkgver} || exit 1

	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
