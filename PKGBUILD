# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=arvingarciabtw
_gitname=ditto
_appname=${_gitname}
pkgname=${_appname}
pkgdesc="A system-wide ASCII keyboard visualizer in the terminal"

pkgver=1.3.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

makedepends=('go')
depends=('glibc')

provides=("${_appname}")

options=(!strip)

source=("${pkgname}-${pkgver}.tgz::${url}/archive/${_gitversion}.tar.gz")
sha256sums=('d3aff8a4c6389fd89b52e79afcf4fd0a621f476dcc6b780407889aece31011c0')


prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	go mod tidy
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	if [[ -f .ldflags ]]; then
		ldflags=$(<.ldflags)
	else
		# interim until commit fix is released
		ldflags="-checklinkname=0"
	fi

	go build -trimpath -ldflags "${ldflags}" -o "${pkgname}" "./cmd/${pkgname}/"
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver} || exit 1

	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
