# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=subwaycookiecrunch
_gitname=zentorrent
_appname=${_gitname}
pkgname=${_appname}
pkgdesc="Just a CLI torrent downloader. No UI, no BS!"

pkgver=4.0.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('linux-amd64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

makedepends=('go')

provides=("${_appname}")

options=('!strip')

source=("${pkgname}-${pkgver}.tgz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('11f58354005a3583d33653f994aca74eb4b2d71b50fd988920509bafdea0fe6d')


prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}/"

	go mod tidy
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}/"

	export CGO_ENABLED=0

	if [[ -f .ldflags ]]; then
		ldflags=$(<.ldflags)
	else
		# interim until commit fix is released
		ldflags="-checklinkname=0"
	fi

	go build -trimpath -ldflags "${ldflags}" -o "${pkgname}" ./cmd/${pkgname}
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/"

	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
